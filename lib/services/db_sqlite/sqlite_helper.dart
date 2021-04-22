import 'package:Projects/song_book/models/song.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  bool _en = true;
  bool _ru = true;
  bool _uk = true;

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();

    _en = (prefLanguages.getBool('en') ?? _en);
    _ru = (prefLanguages.getBool('ru') ?? _ru);
    _uk = (prefLanguages.getBool('uk') ?? _uk);
  }

  static Database? _db;
  static const String DB_NAME = 'Songs.db';
  static const String ID = 'id';

  static const String TABLE_TITLE = 'Title';
  static const String TITLE_RU = 'ru';
  static const String TITLE_UK = 'uk';
  static const String TITLE_EN = 'en';

  static const String TABLE_TEXT = 'text';
  static const String TEXT_RU1 = 'ru1';
  static const String TEXT_RU2 = 'ru2';
  static const String TEXT_UK1 = 'uk1';
  static const String TEXT_UK2 = 'uk2';
  static const String TEXT_EN1 = 'en1';
  static const String TEXT_EN2 = 'en2';

  static const String TABLE_DESCRIPTION = 'description';
  static const String DESCRIPTION_RU = 'ru';
  static const String DESCRIPTION_UK = 'uk';
  static const String DESCRIPTION_EN = 'en';

  static const String TABLE_CHORDS = 'chords';
  static const String CHORDS_V1 = 'v1';
  static const String CHORDS_V2 = 'v2';
  static const String CHORDS_V3 = 'v3';
  static const String CHORDS_V4 = 'v4';

List<String> columnsTitle = [ID];
List<String> columnsText = [ID];
List<String> columnsDescription = [ID];

  void _filterLangDisplaying() {
    if (_ru) {
      columnsTitle.add(TITLE_RU);
      columnsText.add(TEXT_RU1);
      columnsText.add(TEXT_RU2);
      columnsDescription.add(DESCRIPTION_RU);
    }
    if (_uk) {
      columnsTitle.add(TITLE_UK);
      columnsText.add(TEXT_UK1);
      columnsText.add(TEXT_UK2);
      columnsDescription.add(DESCRIPTION_UK);
    }
    if (_en) {
      columnsTitle.add(TITLE_EN);
      columnsText.add(TEXT_EN1);
      columnsText.add(TEXT_EN2);
      columnsDescription.add(DESCRIPTION_EN);
    }

  }

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

    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $TABLE_TITLE ($ID INTEGER PRIMARY KEY, $TITLE_RU TEXT, $TITLE_EN TEXT, $TITLE_UK TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_TEXT ($ID INTEGER PRIMARY KEY, $TEXT_RU1 TEXT, $TEXT_RU2 TEXT, $TEXT_EN2 TEXT, $TEXT_UK2 TEXT, $TEXT_EN1 TEXT, $TEXT_UK1 TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_DESCRIPTION ($ID INTEGER PRIMARY KEY, $DESCRIPTION_RU TEXT, $DESCRIPTION_EN TEXT, $DESCRIPTION_UK TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_CHORDS ($ID INTEGER PRIMARY KEY, $CHORDS_V1 TEXT, $CHORDS_V2 TEXT, $CHORDS_V3 TEXT, $CHORDS_V4 TEXT)');

      print(' !!!!databases was created!!!!!');
    });
  }

  // insert 1 song
  Future<void> insertSong(Song song) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database.insert(
      TABLE_TITLE,
      song.toMapTitle(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await database.insert(
      TABLE_TEXT,
      song.toMapText(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await database.insert(
      TABLE_DESCRIPTION,
      song.toMapDescription(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await database.insert(
      TABLE_CHORDS,
      song.toMapChords(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAllSongs(List<Song> songs) async {
    // Get a reference to the database.
    final Database database = (await db)!;
    for (Song song in songs) {
      await database.insert(
        TABLE_TITLE,
        song.toMapTitle(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await database.insert(
        TABLE_TEXT,
        song.toMapText(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await database.insert(
        TABLE_DESCRIPTION,
        song.toMapDescription(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await database.insert(
        TABLE_CHORDS,
        song.toMapChords(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      //await database.close();

    }
    print('HAS BEEN INSERTED SONGS:  ${songs.length}');
  }

  Stream<List<Song>> getAllSongs() async* {
    final Database? database = await db;
    //filter which lang-s will be displaying
    _filterLangDisplaying();

    //get all tables
    // we use comas inside the strings TITLE_RU ets, because
    //if this string would be '' (don't need it), we also don't need coma behind it
    final List<Map<String, dynamic>> mapsTitles = await database!.query(
        TABLE_TITLE, columns: columnsTitle);


    final List<Map<String, dynamic>> mapsTexts = await database.query(
        TABLE_TEXT, columns: columnsText);

    final List<Map<String, dynamic>> mapsDescriptions = await database
        .query(
        TABLE_DESCRIPTION, columns: columnsDescription);
    final List<Map<String, dynamic>> mapsChords =
        await database.query(TABLE_CHORDS);

    // Convert the List<Map<String, dynamic> into a List<Song>.
     List<Song> songs = List.generate(mapsTitles.length, (i) {
      //maps is read only, so we should make a copy of it, to remove first element with id
      Map<String, dynamic> mapTitlesWritable =
          Map<String, dynamic>.from(mapsTitles[i]);
      //remove id field because we don't need it in our maps
      mapTitlesWritable.remove('id');
      //remove empty values
      mapTitlesWritable.removeWhere((key, value) => value == null);

      //do the same for text map
      Map<String, dynamic> mapTextsWritable =
          Map<String, dynamic>.from(mapsTexts[i]);
      mapTextsWritable.remove('id');
      mapTextsWritable.removeWhere((key, value) => value == null);

      //do the same for description map
      Map<String, dynamic> mapDescriptionsWritable =
          Map<String, dynamic>.from(mapsDescriptions[i]);
      mapDescriptionsWritable.remove('id');
      mapDescriptionsWritable.removeWhere((key, value) => value == null);

      //do the same for description map
      Map<String, dynamic> mapChordsWritable =
          Map<String, dynamic>.from(mapsChords[i]);
      mapChordsWritable.remove('id');
      mapChordsWritable.removeWhere((key, value) => value == null);


      return Song(
          id: mapsTitles[i]['id'],
          title: mapTitlesWritable,
          text: mapTextsWritable,
          description: mapDescriptionsWritable,
          chords: mapChordsWritable);
    });
      //to finish filtering by lang we remove from list songs with empty entities
     songs.removeWhere((song) => song.title.isEmpty);
    yield songs;
  }

// when we need to clean database
  Future<void> deleteAllSongs() async {
    // Get a reference to the database.
    final database = await db;

    await database!.delete(TABLE_TITLE);
    await database.delete(TABLE_TEXT);
    await database.delete(TABLE_DESCRIPTION);
    await database.delete(TABLE_CHORDS);
    await database.close();

    print('database tables has been deleted');
  }

  Future<void> deleteSong(int id) async {
    final database = await db;
    await database!.delete(TABLE_TITLE, where: '$ID = ?', whereArgs: [id]);
    await database.delete(TABLE_DESCRIPTION, where: '$ID = ?', whereArgs: [id]);
    await database.delete(TABLE_TEXT, where: '$ID = ?', whereArgs: [id]);
    await database.delete(TABLE_CHORDS, where: '$ID = ?', whereArgs: [id]);
  }

  Future<void> deleteDb() async {
    String path = join((await getDatabasesPath()), DB_NAME);
    await deleteDatabase(path);
    print('database has been deleted');
  }
}
