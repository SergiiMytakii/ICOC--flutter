import 'package:Projects/song_book/models/song_detail.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelperFTS {
  bool _en = true;
  bool _ru = true;
  bool _uk = true;
  List<SongDetail> songs = [];

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();

    _en = (prefLanguages.getBool('en') ?? _en);
    _ru = (prefLanguages.getBool('ru') ?? _ru);
    _uk = (prefLanguages.getBool('uk') ?? _uk);
  }

  static Database? _db;
  static const String DB_NAME = 'Songs.db';
  static const String ID = 'id';

  static const String TABLE_TITLE = 'title';
  static const String TITLE_RU = 'ru';
  static const String TITLE_UK = 'uk';
  static const String TITLE_EN = 'en';

  static const String TABLE_TEXT_RU = 'text_ru';
  static const String TEXT_RU = 'ru';
  static const String ID_SONG = 'id_song';
  static const String TABLE_TEXT_UK = 'text_uk';
  static const String TEXT_UK = 'uk';
  static const String TABLE_TEXT_EN = 'text_en';
  static const String TEXT_EN = 'en';

  static const String TABLE_DESCRIPTION = 'description';
  static const String DESCRIPTION_RU = 'ru';
  static const String DESCRIPTION_UK = 'uk';
  static const String DESCRIPTION_EN = 'en';

  static const String TABLE_CHORDS = 'chords';
  static const String CHORDS = 'chords_v';

  static const String TABLE_FAVORITES = 'favorites';
  static const String FAVORITE_STATUS = 'favoriteStatus';

  static const String TABLE_PLAYLISTS = 'playlists';
  static const String PLAYLIST_NAME = 'playlistName';

  static const String TABLE_PLAYLISTS_SONGS = 'playlistsSongs';
  static const String PLAYLIST_ID = 'playlistId';
  static const String SONG_ID = 'songId';

  List<String> columnsTitle = [];
  List<String> columnsDescription = [];

  void _filterLangDisplaying() {
    if (_ru) {
      columnsTitle.add(TITLE_RU);
      columnsDescription.add(DESCRIPTION_RU);
    }
    if (_uk) {
      columnsTitle.add(TITLE_UK);
      columnsDescription.add(DESCRIPTION_UK);
    }
    if (_en) {
      columnsTitle.add(TITLE_EN);
      columnsDescription.add(DESCRIPTION_EN);
    }
  }

//get refetence to the DB
  Future<Database?> get db async {
    _loadPreferences();

    if (_db != null) {
      print('db already exist!');
      return _db;
    } else {
      _db = await initDB();
      print('initializing db');
      return _db;
    }
  }

  Future<Database> initDB() async {
    String path = join((await getDatabasesPath()), DB_NAME);
    //await deleteDatabase(path);   // - if we need to clean database
    print('!!!!databases was opened!!!!!' + path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE VIRTUAL TABLE $TABLE_TITLE USING fts4 ( tokenize = unicode61, $ID_SONG INTEGER, $TITLE_RU,  $TITLE_UK, $TITLE_EN)');
      await db.execute(
          'CREATE VIRTUAL TABLE $TABLE_TEXT_RU USING fts4 (tokenize = unicode61, $ID_SONG, $TEXT_RU)');
      await db.execute(
          'CREATE VIRTUAL TABLE $TABLE_TEXT_UK USING fts4 (tokenize = unicode61, $ID_SONG, $TEXT_UK)');
      await db.execute(
          'CREATE VIRTUAL TABLE $TABLE_TEXT_EN USING fts4 (tokenize = unicode61, $ID_SONG, $TEXT_EN)');
      await db.execute(
          'CREATE TABLE $TABLE_DESCRIPTION ($ID_SONG INTEGER PRIMARY KEY, $DESCRIPTION_RU TEXT, $DESCRIPTION_UK TEXT, $DESCRIPTION_EN TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_CHORDS ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_SONG INTEGER, $CHORDS TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_FAVORITES ($ID_SONG INTEGER PRIMARY KEY, $FAVORITE_STATUS INTEGER)');
      await db.execute(
          'CREATE TABLE $TABLE_PLAYLISTS ($ID INTEGER PRIMARY KEY AUTOINCREMENT,  $PLAYLIST_NAME TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_PLAYLISTS_SONGS ($PLAYLIST_ID INTEGER PRIMARY KEY,  $SONG_ID)');

      print(' !!!!databases was created!!!!!');
    });
  }

/* inserting songs into database */

  Future<void> insertAllSongs(List<SongDetail> songs) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    //clean tables before inserting new data
    await database.delete(TABLE_TITLE);
    await database.delete(TABLE_TEXT_RU);
    await database.delete(TABLE_TEXT_UK);
    await database.delete(TABLE_TEXT_EN);
    await database.delete(TABLE_DESCRIPTION);
    await database.delete(TABLE_CHORDS);

    for (SongDetail song in songs) {
      await database.insert(
        TABLE_TITLE,
        song.toMapTitle(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      song.text.forEach((key, value) async {
        if (key.contains('ru')) {
          await database.rawQuery('''
        INSERT INTO $TABLE_TEXT_RU ($ID_SONG, $TEXT_RU)
        VALUES (?,?)
      ''', [song.id, value]);
        }
      });

      song.text.forEach((key, value) async {
        if (key.contains('uk')) {
          await database.rawQuery('''
        INSERT INTO $TABLE_TEXT_UK ($ID_SONG, $TEXT_UK)
        VALUES (?,?)
      ''', [song.id, value]);
        }
      });

      song.text.forEach((key, value) async {
        if (key.contains('en')) {
          await database.rawQuery('''
        INSERT INTO $TABLE_TEXT_EN ($ID_SONG, $TEXT_EN)
        VALUES (?,?)
      ''', [song.id, value]);
        }
      });

      await database.insert(
        TABLE_DESCRIPTION,
        song.toMapDescription(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      song.chords.forEach((key, value) async {
        await database.rawQuery('''
        INSERT INTO $TABLE_CHORDS ($ID_SONG, $CHORDS)
        VALUES (?,?)
      ''', [song.id, value]);
      });
    }
    print('HAS BEEN INSERTED SONGS:  ${songs.length}');
  }

/* get all songs from database*/

  Stream<List<SongDetail>> getListSongs(String parameter) async* {
    final Database? database = await db;
    //filter which lang-s will be displaying
    _filterLangDisplaying();

    Map<String, dynamic> texts = {};
    List<Map<String, dynamic>> mapTextsRuIndexed = [];
    List<Map<String, dynamic>> mapTextsUkIndexed = [];
    List<Map<String, dynamic>> mapTextsEnIndexed = [];
    List<Map<String, dynamic>> idSongsToDisplay = [];

    //get table with id's of  all songs
    if (parameter == 'All songs') {
      idSongsToDisplay = await database!.rawQuery('''
        SELECT $ID_SONG FROM $TABLE_TITLE 
        ORDER BY $ID_SONG
        ''');
    }
    if (parameter == 'Favorites') {
      idSongsToDisplay = await database!.rawQuery('''
        SELECT $ID_SONG FROM $TABLE_FAVORITES 
        ORDER BY $ID_SONG
        ''');
    }

    //loop in every song_id to take all versions of every song
    for (Map id in idSongsToDisplay) {
      final List<Map<String, dynamic>> titles = await database!.query(
          TABLE_TITLE,
          columns: columnsTitle,
          where: '$ID_SONG = ${id.values}',
          orderBy: TITLE_RU);
//remove nullable values
      Map<String, dynamic> titlesWritable =
          Map<String, dynamic>.from(titles[0]);
      titlesWritable.removeWhere((key, value) => value == null);

//get descriptions
      final List<Map<String, dynamic>> descriptions = await database.query(
          TABLE_DESCRIPTION,
          columns: columnsDescription,
          where: '$ID_SONG = ${id.values}');
//remove nullable values
      Map<String, dynamic> descriptionsWritable =
          Map<String, dynamic>.from(descriptions[0]);
      descriptionsWritable.removeWhere((key, value) => value == null);

      //get texts
      if (_ru) {
        final List<Map<String, dynamic>> mapTextsRu =
            await database.rawQuery('''
        SELECT $TEXT_RU 
        FROM $TABLE_TEXT_RU WHERE $ID_SONG = ${id.values} 
          ''');

        // the keys in our map are 'ru' - the same for all entities
        //so we need to add indexes for every version of song
        int i = 0;
        mapTextsRuIndexed = mapTextsRu.map((e) {
          i += 1;
          return {'ru$i': e['ru']};
        }).toList();
      }
      //do the same for uk texts

      if (_uk) {
        final List<Map<String, dynamic>> mapTextsUk =
            await database.rawQuery('''
        SELECT $TEXT_UK 
        FROM $TABLE_TEXT_UK WHERE $ID_SONG = ${id.values}
          ''');

        int i = 0;
        mapTextsUkIndexed = mapTextsUk.map((e) {
          i += 1;
          return {'uk$i': e['uk']};
        }).toList();
      }

      //do the same for uk texts
      if (_en) {
        final List<Map<String, dynamic>> mapTextsEn =
            await database.rawQuery('''
        SELECT $TEXT_EN 
        FROM $TABLE_TEXT_EN WHERE $ID_SONG = ${id.values}
          ''');

        int i = 0;
        mapTextsEnIndexed = mapTextsEn.map((e) {
          i += 1;
          return {'en$i': e['en']};
        }).toList();
      }

      //join maps into list of maps
      final List<Map<String, dynamic>> allMapsTexts =
          mapTextsRuIndexed + mapTextsUkIndexed + mapTextsEnIndexed;
      //make one map with all texts
      texts = Map.fromEntries(allMapsTexts.expand((map) => map.entries));
//remove nullable values
      texts.removeWhere((key, value) => value == null);

// get chords
      final List<Map<String, dynamic>> mapsChords = await database.rawQuery('''
        SELECT $CHORDS 
        FROM $TABLE_CHORDS WHERE $ID_SONG = ${id.values}
          ''');
      // the keys in our map are 'chords_v' - the same for all entities
      //so we need to add indexes for every version of song
      int i = 0;
      final List<Map<String, dynamic>> mapChordsIndexed = mapsChords.map((e) {
        i += 1;
        return {'Chords_v$i': e['chords_v']};
      }).toList();

      //make one map with all chords
      Map<String, dynamic> chords =
          Map.fromEntries(mapChordsIndexed.expand((map) => map.entries));
//remove nullable values
      chords.removeWhere((key, value) => value == null);

      SongDetail song = SongDetail(
          id: id['id_song'],
          title: titlesWritable,
          description: descriptionsWritable,
          text: texts,
          chords: chords);
      songs.add(song);
    }

    songs.removeWhere((song) => song.title.values.isEmpty);

    yield songs;
  }

  /*add to favorite list*/

  Future<void> addToFavorites(int id) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database.insert(
      TABLE_FAVORITES,
      {ID_SONG: id, FAVORITE_STATUS: 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('inserted to favorites');
  }

  Future<void> deleteFromFavorites(int id) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database
        .delete(TABLE_FAVORITES, where: '$ID_SONG = ?', whereArgs: [id]);
    print('deleted from favorites');
  }

  Future<bool> getFavoriteStatus(int id) async {
    final database = await db;
    var status = await database!.query(TABLE_FAVORITES,
        columns: ['$FAVORITE_STATUS'], where: '$ID_SONG = ?', whereArgs: [id]);
    if (status.isNotEmpty) {
      return true;
    } else
      return false;
  }
}
