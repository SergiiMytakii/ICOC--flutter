import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/data_sources/local/local_db_data_source.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@dev
@prod
@Injectable(as: LocalSongsDB)
class SqliteSongsDbImpl implements LocalSongsDB {
  final LocalCache localCache;
  SqliteSongsDbImpl({required this.localCache});

  static Database? _db;
  static const String DB_NAME = 'Songs.db';
  static const String ID_SONG = 'id_song';
  static const String SONG_TITLE = 'title';
  static const String SONG_TEXT = 'text';
  static const String SONG_LANG = 'lang';

  static const String TABLE_SONGS = 'songs';
  static const String TABLE_FAVORITES = 'favorites';
  static const String FAVORITE_STATUS = 'favoriteStatus';

  var columnsText = [];
  String colTexts = '';
  String colTitles = '';
  // final controller = Get.put(SongLangController());
  var log = Logger();

/* get refetence to the DB and initialasing DB */
  Future<Database?> getDb() async {
    if (_db != null) {
      // log.i('db already exist!');
      return _db!;
    } else {
      log.i('initializing db');
      _db = await initDB();
      return _db;
    }
  }

  Future<Database?> initDB() async {
    final String path = join((await getDatabasesPath()), DB_NAME);
    // await deleteDatabase(path); // - if we need to clean database

    try {
      return await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        try {
          await db.execute(
              'CREATE VIRTUAL TABLE $TABLE_SONGS USING fts5($ID_SONG UNINDEXED, $SONG_TITLE, $SONG_TEXT, $SONG_LANG, tokenize="unicode61")');
          await FirebaseAnalytics.instance.logEvent(
              name: 'songs_fts_init',
              parameters: {'fts': 'fts5', 'tokenizer': 'unicode61'});
          FirebaseCrashlytics.instance
              .log('songs_fts_init fts=fts5 tokenizer=unicode61');
        } catch (_) {
          try {
            await db.execute(
                'CREATE VIRTUAL TABLE $TABLE_SONGS USING fts4(tokenize=unicode61, $ID_SONG INTEGER, $SONG_TITLE TEXT, $SONG_TEXT TEXT, $SONG_LANG TEXT)');
            await FirebaseAnalytics.instance.logEvent(
                name: 'songs_fts_init',
                parameters: {'fts': 'fts4', 'tokenizer': 'unicode61'});
            FirebaseCrashlytics.instance
                .log('songs_fts_init fts=fts4 tokenizer=unicode61');
          } catch (_) {
            await db.execute(
                'CREATE VIRTUAL TABLE $TABLE_SONGS USING fts4($ID_SONG INTEGER, $SONG_TITLE TEXT, $SONG_TEXT TEXT, $SONG_LANG TEXT)');
            await FirebaseAnalytics.instance
                .logEvent(name: 'songs_fts_init', parameters: {'fts': 'fts4'});
            FirebaseCrashlytics.instance.log('songs_fts_init fts=fts4');
          }
        }
        await db.execute(
            'CREATE TABLE $TABLE_FAVORITES ($ID_SONG INTEGER PRIMARY KEY, $FAVORITE_STATUS INTEGER)');
        log.i(' !!!!databases hac been opened!!!!!');
        await FirebaseAnalytics.instance.logEvent(name: 'sqlite_opened');
        FirebaseCrashlytics.instance.log('sqlite_opened');
      }, onOpen: (Database db) async {
        await _migrateToFts5IfSupported(db);
      });
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
      return null;
    }
  }

  Future<bool> _supportsFts5(Database db) async {
    try {
      await db.execute('CREATE VIRTUAL TABLE temp_fts5 USING fts5(x)');
      await db.execute('DROP TABLE temp_fts5');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> _currentSongsTableSql(Database db) async {
    final List<Map<String, Object?>> res = await db.rawQuery(
        "SELECT sql FROM sqlite_master WHERE type='table' AND name=?",
        [TABLE_SONGS]);
    if (res.isEmpty) return null;
    final val = res.first['sql'];
    return val is String ? val : null;
  }

  Future<void> _migrateToFts5IfSupported(Database db) async {
    final supports = await _supportsFts5(db);
    if (!supports) return;
    final sql = await _currentSongsTableSql(db);
    if (sql == null) return;
    if (sql.contains('fts5')) return;
    if (sql.contains('fts4')) {
      try {
        await db
            .execute('ALTER TABLE $TABLE_SONGS RENAME TO ${TABLE_SONGS}_old');
        await db.execute(
            'CREATE VIRTUAL TABLE $TABLE_SONGS USING fts5($ID_SONG UNINDEXED, $SONG_TITLE, $SONG_TEXT, $SONG_LANG, tokenize="unicode61")');
        await db.execute(
            'INSERT INTO $TABLE_SONGS($ID_SONG, $SONG_TITLE, $SONG_TEXT, $SONG_LANG) SELECT $ID_SONG, $SONG_TITLE, $SONG_TEXT, $SONG_LANG FROM ${TABLE_SONGS}_old');
        await FirebaseAnalytics.instance.logEvent(
            name: 'songs_fts_migrate',
            parameters: {'from': 'fts4', 'to': 'fts5'});
        FirebaseCrashlytics.instance.log('songs_fts_migrate from=fts4 to=fts5');
        await db.execute('DROP TABLE ${TABLE_SONGS}_old');
      } catch (e, stackTrace) {
        FirebaseCrashlytics.instance.setCustomKey('fts_migration_error', '$e');
        FirebaseCrashlytics.instance.log('songs_fts_migration_error');
        await logError(e, stackTrace);
      }
    }
  }

/* inserting songs into database */
  @override
  Future<bool> insertAllSongs(List<SongModel> songs) async {
    // Get a reference to the database.
    final Database? database = await getDb();
    //clean tables before inserting new data
    if (database != null) {
      try {
        await database.delete(TABLE_SONGS);
        await insertTitlesAndTexts(songs, database);
      } catch (e, stackTrace) {
        logError(e, stackTrace);
        //on error we delete db and make a second try
        try {
          final String path = join((await getDatabasesPath()), DB_NAME);
          await deleteDatabase(path);
          await FirebaseAnalytics.instance
              .logEvent(name: 'Deleting DB and make second try to insert');
          _db = null;
          final Database? database = await getDb();
          if (database != null) insertTitlesAndTexts(songs, database);
        } catch (e, stackTrace) {
          logError(e, stackTrace);
          return false;
        }
      }
    }
    return true;
    // printSongsDBHead();
  }

  Future<void> insertTitlesAndTexts(
      List<SongModel> songs, Database database) async {
    for (SongModel song in songs) {
      for (var songVersion in song.songVersions) {
        if (!songVersion.isChords) {
          final Map<String, Object?> map = {
            ID_SONG: song.id,
            SONG_TITLE: songVersion.title,
            SONG_TEXT: songVersion.text,
            SONG_LANG: songVersion.lang.name,
            // Add any other relevant fields from SongModel and VersionModel
          };
          await database.insert(
            TABLE_SONGS,
            map,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
    }
    final count = await songsInLocalDB;
    log.i('HAS BEEN INSERTED SONGS:  $count');
    await FirebaseAnalytics.instance
        .logEvent(name: 'songs_inserted', parameters: {'count': count});
    FirebaseCrashlytics.instance.log('songs_inserted count=$count');
  }

  Future<int> get songsInLocalDB async {
    final Database? database = await getDb();
    if (database != null) {
      final List<Map<String, dynamic>> songs =
          await database.query(TABLE_SONGS, columns: [ID_SONG]);
      return songs.length;
    } else {
      return 0;
    }
  }

//for testing
  @override
  Future<void> printSongsDBHead() async {
    final Database? database = await getDb();
    final List<Map<String, dynamic>> songs = await database!.query(TABLE_SONGS);

    for (int i = 0; i < 5; i++) {
      print(songs[i]);
    }
  }

  /* functions for favorites*/

  @override
  Future<bool> addToFavorites(int id) async {
    // Get a reference to the database.
    final Database? database = await getDb();
    if (database != null) {
      final int status = await database.insert(
        TABLE_FAVORITES,
        {ID_SONG: id, FAVORITE_STATUS: 1},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      if (status > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteFromFavorites(int id) async {
    // Get a reference to the database.
    final Database? database = await getDb();
    if (database != null) {
      final int status = await database
          .delete(TABLE_FAVORITES, where: '$ID_SONG = ?', whereArgs: [id]);
      if (status > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> getFavoriteStatus(int id) async {
    final Database? database = await getDb();
    if (database != null) {
      final status = await database.query(TABLE_FAVORITES,
          columns: [FAVORITE_STATUS], where: '$ID_SONG = ?', whereArgs: [id]);
      if (status.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<Set<int>> getListFavorites() async {
    final Database? database = await getDb();
    if (database != null) {
      final List<Map<String, dynamic>> items =
          await database.query(TABLE_FAVORITES, columns: [ID_SONG]);
      final Set<int> songsIds = items.map((e) => e.values.first as int).toSet();

      return songsIds;
    } else {
      return {};
    }
  }

/* functions for full text search */

  @override
  Future<List<SongVersionLocal>> getSearchResult(
    String query,
  ) async {
    final Database? database = await getDb();

    final List<SongVersionLocal> songs = [];
    if (database != null)
    // search in titiles
    {
      try {
        FirebaseCrashlytics.instance.setCustomKey('search_query', query.trim());
        FirebaseCrashlytics.instance.log('search_songs_start');
        try {
          final List<Map<String, dynamic>> searchInTitles =
              await database.rawQuery('''
                  SELECT $TABLE_SONGS.$ID_SONG,
                  highlight($TABLE_SONGS, 1, '[', ' ') as title,
                  $TABLE_SONGS.$SONG_TEXT AS text,
                  $TABLE_SONGS.$SONG_LANG AS lang
                  FROM $TABLE_SONGS
                  WHERE $TABLE_SONGS.$SONG_TITLE MATCH ?
                  ''', ['${query.trim()}*']);

          for (Map map in searchInTitles) {
            final SongVersionLocal song = SongVersionLocal(
              id: map['id_song'],
              title: map['title'],
              text: map['text'],
              lang: map['lang'],
            );
            songs.add(song);
          }

          final List<Map<String, dynamic>> searhInTexts =
              await database.rawQuery('''
                  SELECT $TABLE_SONGS.$ID_SONG,
                  highlight($TABLE_SONGS, 2, '[', ' ') as text,
                  $TABLE_SONGS.$SONG_TITLE AS title,
                  $TABLE_SONGS.$SONG_LANG AS lang
                  FROM $TABLE_SONGS
                  WHERE $TABLE_SONGS.$SONG_TEXT MATCH ?
                  ORDER BY $TABLE_SONGS.$ID_SONG 
                  ''', ['${query.trim()}*']);

          for (Map map in searhInTexts) {
            final SongVersionLocal song = SongVersionLocal(
              id: map['id_song'],
              title: map['title'],
              text: map['text'],
              lang: map['lang'],
            );
            songs.add(song);
          }

          await FirebaseAnalytics.instance.logEvent(
              name: 'search_songs',
              parameters: {'method': 'fts5', 'results': songs.length});
          FirebaseCrashlytics.instance
              .log('search_songs method=fts5 results=${songs.length}');
          return songs;
        } catch (_) {}

        final List<Map<String, dynamic>> searchInTitles =
            await database.rawQuery('''
                  SELECT $TABLE_SONGS.$ID_SONG,
                  snippet($TABLE_SONGS, '[', ' ', '...') as title,
                  $TABLE_SONGS.$SONG_TEXT AS text,
                  $TABLE_SONGS.$SONG_LANG AS lang
                  FROM $TABLE_SONGS
                  WHERE $TABLE_SONGS.$SONG_TITLE MATCH ?
                  ''', ['${query.trim()}*']);

        for (Map map in searchInTitles) {
          final SongVersionLocal song = SongVersionLocal(
            id: map['id_song'],
            title: map['title'],
            text: map['text'],
            lang: map['lang'],
          );
          songs.add(song);
        }

        final List<Map<String, dynamic>> searhInTexts =
            await database.rawQuery('''
                  SELECT $TABLE_SONGS.$ID_SONG,
                  snippet($TABLE_SONGS, '[', ' ', '...') as text,
                  $TABLE_SONGS.$SONG_TITLE AS title,
                  $TABLE_SONGS.$SONG_LANG AS lang
                  FROM $TABLE_SONGS
                  WHERE $TABLE_SONGS.$SONG_TEXT MATCH ?
                  ORDER BY $TABLE_SONGS.$ID_SONG 
                  ''', ['${query.trim()}*']);

        for (Map map in searhInTexts) {
          final SongVersionLocal song = SongVersionLocal(
            id: map['id_song'],
            title: map['title'],
            text: map['text'],
            lang: map['lang'],
          );
          songs.add(song);
        }

        await FirebaseAnalytics.instance.logEvent(
            name: 'search_songs',
            parameters: {'method': 'fts4', 'results': songs.length});
        FirebaseCrashlytics.instance
            .log('search_songs method=fts4 results=${songs.length}');
        return songs;
      } catch (e, stackTrace) {
        logError(e, stackTrace);
        FirebaseCrashlytics.instance.setCustomKey('search_error', '$e');
        FirebaseCrashlytics.instance.log('search_songs_error');
        try {
          final List<Map<String, dynamic>> likeResults = await database.query(
            TABLE_SONGS,
            columns: [ID_SONG, SONG_TITLE, SONG_TEXT, SONG_LANG],
            where: '$SONG_TITLE LIKE ? OR $SONG_TEXT LIKE ?',
            whereArgs: ['%${query.trim()}%', '%${query.trim()}%'],
          );

          final Map<int, SongVersionLocal> unique = {};
          for (final map in likeResults) {
            unique[map[ID_SONG] as int] = SongVersionLocal(
              id: map[ID_SONG] as int,
              title: map[SONG_TITLE] as String,
              text: map[SONG_TEXT] as String,
              lang: map[SONG_LANG] as String,
            );
          }
          final list = unique.values.toList();
          await FirebaseAnalytics.instance.logEvent(
              name: 'search_songs',
              parameters: {'method': 'like', 'results': list.length});
          FirebaseCrashlytics.instance
              .log('search_songs method=like results=${list.length}');
          return list;
        } catch (_) {
          return [];
        }
      }
    } else {
      return [];
    }
  }
}
