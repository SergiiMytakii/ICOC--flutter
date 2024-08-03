import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/data_sources/local/local_db_data_source.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/songs/song_model.dart';
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
  Future<Database?> db() async {
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
        await db.execute(
            'CREATE VIRTUAL TABLE $TABLE_SONGS USING fts4 ( tokenize = unicode61, id INTEGER PRIMARY KEY AUTOINCREMENT, $ID_SONG INTEGER, $SONG_TITLE TEXT, $SONG_TEXT TEXT, $SONG_LANG TEXT)');
        await db.execute(
            'CREATE TABLE $TABLE_FAVORITES ($ID_SONG INTEGER PRIMARY KEY, $FAVORITE_STATUS INTEGER)');
        log.i(' !!!!databases hac been opened!!!!!');
      });
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
      return null;
    }
  }

/* inserting songs into database */
  @override
  Future<bool> insertAllSongs(List<SongModel> songs) async {
    // Get a reference to the database.
    final Database? database = await db();
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
          final Database? database = await db();
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
    log.i('HAS BEEN INSERTED SONGS:  ${await songsInLocalDB}');
  }

  Future<int> get songsInLocalDB async {
    final Database? database = await db();
    if (database != null) {
      final List<Map<String, dynamic>> songs =
          await database.query(TABLE_SONGS, columns: ['id']);
      return songs.length;
    } else {
      return 0;
    }
  }

//for testing
  @override
  Future<void> printSongsDBHead() async {
    final Database? database = await db();
    final List<Map<String, dynamic>> songs = await database!.query(TABLE_SONGS);

    for (int i = 0; i < 5; i++) {
      print(songs[i]);
    }
  }

  /* functions for favorites*/

  @override
  Future<bool> addToFavorites(int id) async {
    // Get a reference to the database.
    final Database? database = await db();
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
    final Database? database = await db();
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
    final Database? database = await db();
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
  Future<List<int>> getListFavorites() async {
    final Database? database = await db();
    if (database != null) {
      final List<Map<String, dynamic>> items =
          await database.query(TABLE_FAVORITES, columns: [ID_SONG]);
      final List<int> songsIds =
          items.map((e) => e.values.first as int).toList();

      return songsIds;
    } else {
      return [];
    }
  }

/* functions for full text search */

  @override
  Future<List<SongVersionLocal>> getSearchResult(
    String query,
  ) async {
    final Database? database = await db();

    final List<SongVersionLocal> songs = [];
    if (database != null)
    // search in titiles
    {
      try {
        final List<Map<String, dynamic>> searchInTitles =
            await database.rawQuery('''
                  SELECT $TABLE_SONGS.$ID_SONG,
                  snippet($TABLE_SONGS, '[', ' ', '...') as title,
                  $TABLE_SONGS.$SONG_TEXT AS text,
                  $TABLE_SONGS.$SONG_LANG AS lang
                  FROM $TABLE_SONGS
                  WHERE $TABLE_SONGS.$SONG_TITLE MATCH '$query*'
                  ''');

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
                  WHERE $TABLE_SONGS.$SONG_TEXT MATCH '$query*'
                  ORDER BY $TABLE_SONGS.$ID_SONG 
                  ''');

        for (Map map in searhInTexts) {
          final SongVersionLocal song = SongVersionLocal(
            id: map['id_song'],
            title: map['title'],
            text: map['text'],
            lang: map['lang'],
          );
          songs.add(song);
        }

        return songs;
      } catch (e, stackTrace) {
        logError(e, stackTrace);
        return [];
      }
    } else {
      return [];
    }
  }
}
