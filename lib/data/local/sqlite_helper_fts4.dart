import 'package:icoc/core/helpers/error_logger.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants.dart';
import '../../core/helpers/shared_preferences_helper.dart';
import '../../core/model/song_detail.dart';

class DatabaseHelperFTS4 {
  static Database? _db;
  static const String DB_NAME = 'Songs.db';
  static const String ID_SONG = 'id_song';
  static const String TABLE_TITLE = 'title';
  static const String TABLE_TEXT = 'text';

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
      //log.i('db already exist!');
      return _db!;
    } else {
      _db = await initDB();
      //log.i('initializing db');
      return _db;
    }
  }

  Future<Database?> initDB() async {
    String path = join((await getDatabasesPath()), DB_NAME);
    // await deleteDatabase(path); // - if we need to clean database
    final List<String> allSongsTitleKeys =
        await SharedPreferencesHelper.getList(
                SharedPreferencesKeys.allSongsTitleKeys) ??
            [];
    String columnTitleDefinitions =
        allSongsTitleKeys.map((key) => '$key TEXT').join(', ');

    final List<String> allSongsTextKeys = await SharedPreferencesHelper.getList(
            SharedPreferencesKeys.allSongsTextKeys) ??
        [];
    String columnTextDefinitions =
        allSongsTextKeys.map((key) => '$key TEXT').join(', ');
    print(columnTitleDefinitions);
    print(columnTextDefinitions);

    try {
      return await openDatabase(path, version: 5,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE VIRTUAL TABLE $TABLE_TITLE USING fts4 ( tokenize = unicode61, $ID_SONG INTEGER, $columnTitleDefinitions)');
        await db.execute(
            'CREATE VIRTUAL TABLE $TABLE_TEXT USING fts4 (tokenize = unicode61, $ID_SONG, $columnTextDefinitions)');

        await db.execute(
            'CREATE TABLE $TABLE_FAVORITES ($ID_SONG INTEGER PRIMARY KEY, $FAVORITE_STATUS INTEGER)');
        log.i(' !!!!databases was created!!!!!');
      });
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
      return null;
    }
  }

/* inserting songs into database */

  Future<void> insertAllSongs(List<SongDetail> songs) async {
    // Get a reference to the database.
    final Database? database = await db();

    //clean tables before inserting new data
    if (database != null) {
      database.delete(TABLE_TITLE);
      database.delete(TABLE_TEXT);

      try {
        await insertTitlesAndTexts(songs, database);
      } on Exception catch (e, stackTrace) {
        logError(e, stackTrace);
        //on error we delete db and make a second try
        String path = join((await getDatabasesPath()), DB_NAME);
        await deleteDatabase(path);
        _db = null;
        final Database? database = await db();
        if (database != null) insertTitlesAndTexts(songs, database);
      }
    }
    // printSongsDBHead();
  }

  Future<void> insertTitlesAndTexts(
      List<SongDetail> songs, Database database) async {
    for (SongDetail song in songs) {
      Map<String, Object?>? map = Map.from(song.title);
      map[ID_SONG] = song.id;
      await database.insert(
        TABLE_TITLE,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      Map<String, Object?>? map2 = Map.from(song.text);
      map2[ID_SONG] = song.id;
      await database.insert(
        TABLE_TEXT,
        map2,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    log.i('HAS BEEN INSERTED SONGS:  ${await songsInLocalDB}');
  }

  Future<int> get songsInLocalDB async {
    final Database? database = await db();
    if (database != null) {
      final List<Map<String, dynamic>> songs =
          await database.query(TABLE_TITLE, columns: [ID_SONG]);
      return songs.length;
    } else
      return 0;
  }

  Future<void> printSongsDBHead() async {
    final Database? database = await db();
    final List<Map<String, dynamic>> songs = await database!.query(TABLE_TITLE);

    for (int i = 0; i < 5; i++) {
      print(songs[i]);
    }
  }

  /* functions for favorites*/

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
      } else
        return false;
    } else
      return false;
  }

  Future<bool> deleteFromFavorites(int id) async {
    // Get a reference to the database.
    final Database? database = await db();
    if (database != null) {
      final int status = await database
          .delete(TABLE_FAVORITES, where: '$ID_SONG = ?', whereArgs: [id]);
      if (status > 0) {
        return true;
      } else
        return false;
    } else
      return false;
  }

  Future<bool> getFavoriteStatus(int id) async {
    final Database? database = await db();
    if (database != null) {
      var status = await database.query(TABLE_FAVORITES,
          columns: ['$FAVORITE_STATUS'],
          where: '$ID_SONG = ?',
          whereArgs: [id]);
      if (status.isNotEmpty) {
        return true;
      } else
        return false;
    } else
      return false;
  }

  Future<List<int>> getListFavorites() async {
    final Database? database = await db();
    if (database != null) {
      final List<Map<String, dynamic>> items =
          await database.query(TABLE_FAVORITES, columns: [ID_SONG]);
      List<int> songsIds = items.map((e) => e.values.first as int).toList();

      return songsIds;
    } else
      return [];
  }

/* functions for full text search */

  Future<List<SongDetail>> getSearchResult(
      String query, List<String> languagesToShow) async {
    final Database? database = await db();

    List<SongDetail> songs = [];
    // log.i('query' + query);
    if (database != null)
    // search in titiles
    {
      try {
        for (final lang in languagesToShow) {
          final List<Map<String, dynamic>> searchInTitles =
              await database.rawQuery('''
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TITLE, '[', ' ', '...') as title,
                  $TABLE_TEXT.${lang}1 AS text
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT.$ID_SONG
                  WHERE $TABLE_TITLE.$lang MATCH '$query*'
                  ''');

          for (Map map in searchInTitles) {
            SongDetail song = SongDetail(
                id: map['id_song'],
                searchTitle: map['title'],
                searchText: map['text'],
                searchLang: lang,
                title: {},
                text: {});
            songs.add(song);
          }

          final List<Map<String, dynamic>> searhInTexts =
              await database.rawQuery('''
                
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TEXT, '[', ' ', '...') AS text,
                  $TABLE_TITLE.$lang as title
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT.$ID_SONG
                  WHERE $TABLE_TEXT.${lang}1  MATCH '$query*'
                  ORDER BY $TABLE_TITLE.$ID_SONG 
                  ''');

          for (Map map in searhInTexts) {
            SongDetail song = SongDetail(
                id: map['id_song'],
                searchTitle: map['title'],
                searchText: map['text'],
                searchLang: lang,
                title: {},
                text: {});
            songs.add(song);
          }
        }
        return songs;
      } catch (e, stackTrace) {
        logError(e, stackTrace);
        return [];
      }
    } else
      return [];
  }
}
