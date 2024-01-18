import 'package:sqflite/sqflite.dart';
import '../../../../index.dart';

class DatabaseHelperFTS4 {
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

  static const String TABLE_RESOURCES = 'resources';
  static const String VIDEO_ID = 'videoId';
  static const String VIDEO_TITLE = 'videoTitle';
  static const String VIDEO_LANG = 'videoLang';

  List<String> columnsTitle = [ID_SONG];
  var columnsText = [];
  List<String> columnsDescription = [];
  String colTexts = '';
  String colTitles = '';
  final controller = Get.put(SongLangController());
  var log = Logger();

  void _filterLangDisplaying() {
    if (controller.songLang['ru']!) {
      columnsTitle.add('$TABLE_TITLE.$TITLE_RU');
      columnsText.add('$TABLE_TEXT_RU.$TEXT_RU');
      columnsDescription.add('$DESCRIPTION_RU');
    }
    if (controller.songLang['uk']!) {
      columnsTitle.add('title.uk');
      columnsText.add('text_uk.uk');
      columnsDescription.add(DESCRIPTION_UK);
    }
    if (controller.songLang['en']!) {
      columnsTitle.add('title.en');
      columnsText.add('text_en.en');
      columnsDescription.add(DESCRIPTION_EN);
    }
    //convert lists to strings
    colTexts =
        columnsText.toString().substring(1, columnsText.toString().length - 1);
    colTitles = columnsTitle
        .toString()
        .substring(1, columnsTitle.toString().length - 1);
  }

  String get query {
    String query = '$TABLE_TITLE.$ID_SONG, ';
    if (controller.songLang['ru']!) {
      query +=
          '$TABLE_TITLE.$TITLE_RU as title_ru, $TABLE_TEXT_RU.$TEXT_RU as text_ru, ';
    }
    if (controller.songLang['uk']!) {
      query +=
          '$TABLE_TITLE.$TITLE_UK as title_uk, $TABLE_TEXT_UK.$TEXT_UK as text_uk, ';
    }
    if (controller.songLang['en']!) {
      query +=
          '$TABLE_TITLE.$TITLE_EN as title_en, $TABLE_TEXT_EN.$TEXT_EN as text_en, ';
    }
    query = query.substring(0, query.length - 2);
    return query;
  }

  List<SongDetail> convertToSongs(List<Map<String, dynamic>> items) {
    List<SongDetail> songs = [];
    for (Map map in items) {
      if (map['title_ru'] != null ||
          map['title_uk'] != null ||
          map['title_en'] != null) {
        SongDetail song = SongDetail(id: map['id_song'], text: {
          'ru': map['text_ru'],
          'uk': map['text_uk'],
          'en': map['text_en']
        }, title: {
          'ru': map['title_ru'],
          'uk': map['title_uk'],
          'en': map['title_en']
        });
        song.text.removeWhere((key, value) => value == null);
        song.title.removeWhere((key, value) => value == null);

        songs.add(song);
      }
    }
    return songs;
  }

/* get refetence to the DB and initialasing DB */
  Future<Database?> get db async {
    if (_db != null) {
      //log.i('db already exist!');
      return _db;
    } else {
      _db = await initDB();
      //log.i('initializing db');
      return _db;
    }
  }

  Future<Database> initDB() async {
    String path = join((await getDatabasesPath()), DB_NAME);
    //await deleteDatabase(path);   // - if we need to clean database

    return await openDatabase(path, version: 5,
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
          'CREATE TABLE $TABLE_RESOURCES($ID INTEGER PRIMARY KEY AUTOINCREMENT, $VIDEO_ID TEXT, $VIDEO_TITLE TEXT, $VIDEO_LANG TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_CHORDS ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_SONG INTEGER, $CHORDS TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_FAVORITES ($ID_SONG INTEGER PRIMARY KEY, $FAVORITE_STATUS INTEGER)');
      await db.execute(
          'CREATE TABLE $TABLE_PLAYLISTS ($ID INTEGER PRIMARY KEY AUTOINCREMENT,  $PLAYLIST_NAME TEXT)');
      await db.execute(
          'CREATE TABLE $TABLE_PLAYLISTS_SONGS ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $PLAYLIST_ID INTEGER ,  $ID_SONG)');

      // log.i(' !!!!databases was created!!!!!');
    });
  }

/* inserting songs into database */

  Future<void> insertAllSongs(List<SongDetail> songs) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    //clean tables before inserting new data
//not sure we need to clean tables every time

    database.delete(TABLE_TITLE);
    database.delete(TABLE_TEXT_RU);
    database.delete(TABLE_TEXT_UK);
    database.delete(TABLE_TEXT_EN);
    database.delete(TABLE_DESCRIPTION);
    database.delete(TABLE_CHORDS);
    // database.delete(TABLE_RESOURCES);//todo may you don't need it

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
        if (key.contains('uk')) {
          await database.rawQuery('''
        INSERT INTO $TABLE_TEXT_UK ($ID_SONG, $TEXT_UK)
        VALUES (?,?)
      ''', [song.id, value]);
        }
        if (key.contains('en')) {
          await database.rawQuery('''
        INSERT INTO $TABLE_TEXT_EN ($ID_SONG, $TEXT_EN)
        VALUES (?,?)
      ''', [song.id, value]);
        }
      });
      if (song.description != null) {
        await database.insert(
          TABLE_DESCRIPTION,
          song.toMapDescription()!,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      if (song.chords != null) {
        song.chords!.forEach((key, value) async {
          await database.rawQuery('''
        INSERT INTO $TABLE_CHORDS ($ID_SONG, $CHORDS)
        VALUES (?,?)
      ''', [song.id, value]);
        });
      }
    }
    log.i('HAS BEEN INSERTED SONGS:  ${songs.length}');
  }

  Future<int> get songsInLocalDB async {
    final Database? database = await db;
    final List<Map<String, dynamic>> songs =
        await database!.query(TABLE_TITLE, columns: [ID_SONG]);
    return songs.length;
  }

/* get list of all songs */
  Stream<List<SongDetail>> getListSongs() async* {
    final Database? database = await db;

    final List<Map<String, dynamic>> items = await database!.rawQuery('''
        SELECT $query
        FROM $TABLE_TITLE
        LEFT JOIN $TABLE_TEXT_RU ON $TABLE_TEXT_RU.$ID_SONG = $TABLE_TITLE.$ID_SONG 
        LEFT JOIN $TABLE_TEXT_UK ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_UK.$ID_SONG
        LEFT JOIN $TABLE_TEXT_EN ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_EN.$ID_SONG
        GROUP BY $TABLE_TITLE.$ID_SONG
          ''');
    List<SongDetail> songs = convertToSongs(items);
    yield songs;
  }

/* get songDetail from database*/

  Future<SongDetail> getSongDetail(int id) async {
    final Database? database = await db;
    //filter which lang-s will be displaying
    _filterLangDisplaying();

    Map<String, dynamic> texts = {};
    List<Map<String, dynamic>> mapTextsRuIndexed = [];
    List<Map<String, dynamic>> mapTextsUkIndexed = [];
    List<Map<String, dynamic>> mapTextsEnIndexed = [];

    final List<Map<String, dynamic>> searchInTitles = await database!.query(
      TABLE_TITLE,
      columns: columnsTitle,
      where: '$ID_SONG = $id',
    );
//remove nullable values
    Map<String, dynamic> titlesWritable =
        Map<String, dynamic>.from(searchInTitles[0]);
    titlesWritable.removeWhere((key, value) => value == null);

//get descriptions
    final List<Map<String, dynamic>> descriptions = await database.query(
        TABLE_DESCRIPTION,
        columns: columnsDescription,
        where: '$ID_SONG = $id');
//remove nullable values
    Map<String, dynamic> descriptionsWritable =
        Map<String, dynamic>.from(descriptions[0]);
    descriptionsWritable.removeWhere((key, value) => value == null);

    //get texts
    if (controller.songLang['ru']!) {
      final List<Map<String, dynamic>> mapTextsRu = await database.rawQuery('''
        SELECT $TEXT_RU 
        FROM $TABLE_TEXT_RU WHERE $ID_SONG = $id 
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

    if (controller.songLang['uk']!) {
      final List<Map<String, dynamic>> mapTextsUk = await database.rawQuery('''
        SELECT $TEXT_UK 
        FROM $TABLE_TEXT_UK WHERE $ID_SONG = $id
          ''');

      int i = 0;
      mapTextsUkIndexed = mapTextsUk.map((e) {
        i += 1;
        return {'uk$i': e['uk']};
      }).toList();
    }

    //do the same for uk texts
    if (controller.songLang['en']!) {
      final List<Map<String, dynamic>> mapTextsEn = await database.rawQuery('''
        SELECT $TEXT_EN 
        FROM $TABLE_TEXT_EN WHERE $ID_SONG = $id
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
        FROM $TABLE_CHORDS WHERE $ID_SONG = $id
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
        id: id,
        title: titlesWritable,
        description: descriptionsWritable,
        text: texts,
        chords: chords);

    return song;
  }

  /* functions for favorites*/

  Future<void> addToFavorites(int id) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database.insert(
      TABLE_FAVORITES,
      {ID_SONG: id, FAVORITE_STATUS: 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFromFavorites(int id) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database
        .delete(TABLE_FAVORITES, where: '$ID_SONG = ?', whereArgs: [id]);
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

  Stream<List<int>> getListFavorites() async* {
    final Database? database = await db;

    final List<Map<String, dynamic>> items =
        await database!.query(TABLE_FAVORITES, columns: [ID_SONG]);
    List<int> songsIds = items.map((e) => e.values.first as int).toList();

    yield songsIds;
  }

/* functions for full text search */

  Stream<List<SongDetail>> getSearchResult(String query) async* {
    final Database? database = await db;

    List<SongDetail> songs = [];
    // log.i('query' + query);
    if (query != '') {
      // search in titiles

      if (controller.songLang['ru']!) {
        final List<Map<String, dynamic>> searchInTitles =
            await database!.rawQuery('''
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TITLE, '[', ' ', '...') as title_ru,
                  $TABLE_TEXT_RU.$TEXT_RU AS text_ru
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_RU ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_RU.$ID_SONG
                  WHERE $TABLE_TITLE.$TITLE_RU  MATCH '$query*'
                  ''');

        for (Map map in searchInTitles) {
          SongDetail song = SongDetail(
            id: map['id_song'],
            title: {'ru': map['title_ru']},
            text: {'ru': map['text_ru'] ?? ''},
          );
          songs.add(song);
        }

        final List<Map<String, dynamic>> searhInTexts =
            await database.rawQuery('''
                
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TEXT_RU, '[', ' ', '...') AS text_ru,
                  $TABLE_TITLE.$TITLE_RU
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_RU ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_RU.$ID_SONG
                  WHERE $TABLE_TEXT_RU.$TEXT_RU  MATCH '$query*'
                  ORDER BY $TABLE_TITLE.$ID_SONG 
                  ''');

        for (Map map in searhInTexts) {
          SongDetail song = SongDetail(
            id: map['id_song'],
            title: {'ru': map['ru']},
            text: {'ru': map['text_ru'] ?? ''},
          );
          songs.add(song);
        }
      }
      if (controller.songLang['uk']!) {
        final List<Map<String, dynamic>> searchInTitles =
            await database!.rawQuery('''
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TITLE, '[', ' ', '...') as title_uk,
                  $TABLE_TEXT_UK.$TEXT_UK AS text_uk
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_UK ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_UK.$ID_SONG
                  WHERE $TABLE_TITLE.$TITLE_UK  MATCH '$query*'
                  ''');

        for (Map map in searchInTitles) {
          SongDetail song = SongDetail(
            id: map['id_song'],
            title: {'uk': map['title_uk']},
            text: {'uk': map['text_uk'] ?? ''},
          );
          songs.add(song);
        }
        final List<Map<String, dynamic>> searhInTexts =
            await database.rawQuery('''
                
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TEXT_UK, '[', ' ', '...') AS text_uk,
                  $TABLE_TITLE.$TITLE_UK
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_UK ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_UK.$ID_SONG
                  WHERE $TABLE_TEXT_UK.$TEXT_UK  MATCH '$query*'
                  ORDER BY $TABLE_TITLE.$ID_SONG 
                  ''');

        for (Map map in searhInTexts) {
          SongDetail song = SongDetail(
              id: map['id_song'],
              title: {'uk': map['uk']},
              text: {'uk': map['text_uk'] ?? ''});
          songs.add(song);
        }
      }
      if (controller.songLang['en']!) {
        final List<Map<String, dynamic>> searchInTitles =
            await database!.rawQuery('''
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TITLE, '[', ' ', '...') as title_en,
                  $TABLE_TEXT_EN.$TEXT_EN AS text_en
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_EN ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_EN.$ID_SONG
                  WHERE $TABLE_TITLE.$TITLE_EN  MATCH '$query*'
                  ''');

        for (Map map in searchInTitles) {
          SongDetail song = SongDetail(
              id: map['id_song'],
              title: {'en': map['title_en']},
              text: {'en': map['text_en'] ?? ''});
          //print(song.title);
          // print(song.text.toString());
          songs.add(song);
        }

        final List<Map<String, dynamic>> searhInTexts =
            await database.rawQuery('''
                
                  SELECT $TABLE_TITLE.$ID_SONG,
                  snippet($TABLE_TEXT_EN, '[', ' ', '...') AS text_en,
                  $TABLE_TITLE.$TITLE_EN
                  FROM $TABLE_TITLE
                  JOIN $TABLE_TEXT_EN ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_EN.$ID_SONG
                  WHERE $TABLE_TEXT_EN.$TEXT_EN  MATCH '$query*'
                  ORDER BY $TABLE_TITLE.$ID_SONG 
                  ''');

        for (Map map in searhInTexts) {
          SongDetail song = SongDetail(
              id: map['id_song'],
              title: {'en': map['en']},
              text: {'en': map['text_en'] ?? ''});
          songs.add(song);
        }
      }
      yield songs;
    }
  }

  Stream<List<SongDetail>> getSearchResultByNumber(String searchQuery) async* {
    final Database? database = await db;

    final List<Map<String, dynamic>> items = await database!.rawQuery('''
        SELECT $query
        FROM $TABLE_TITLE
        LEFT JOIN $TABLE_TEXT_RU ON $TABLE_TEXT_RU.$ID_SONG = $TABLE_TITLE.$ID_SONG 
        LEFT JOIN $TABLE_TEXT_UK ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_UK.$ID_SONG
        LEFT JOIN $TABLE_TEXT_EN ON $TABLE_TITLE.$ID_SONG = $TABLE_TEXT_EN.$ID_SONG
        GROUP BY $TABLE_TITLE.$ID_SONG
          ''');
    List<SongDetail> songs = convertToSongs(items);
    yield songs
        .where((song) => song.id.toString().contains(searchQuery))
        .toList();
  }

/* functions for playlists*/

//create new playlist
  Future<void> createPlaylist(String name) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database.insert(
      TABLE_PLAYLISTS,
      {'$PLAYLIST_NAME': name},
    );
  }

//insert song into playlist
  Future<void> insertIntoPlaylist(String playlist, int songId) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    final List<Map<String, dynamic>> select = await database.query(
        TABLE_PLAYLISTS,
        where: '$PLAYLIST_NAME = ?',
        whereArgs: [playlist]);
    await database.insert(
        TABLE_PLAYLISTS_SONGS,
        {
          PLAYLIST_ID: select.last['id'],
          ID_SONG: songId,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Stream<List<Map<String, Object?>>> getPlaylists() async* {
    // Get a reference to the database.
    final Database database = (await db)!;

    List<Map<String, Object?>> playlists = await database.rawQuery('''
      SELECT * FROM $TABLE_PLAYLISTS
      ORDER BY $ID DESC
    ''');

    yield List.from(playlists);
  }

  Future<void> deletePlaylist(int playlistId) async {
    // Get a reference to the database.
    final Database database = (await db)!;
    await database
        .delete(TABLE_PLAYLISTS, where: '$ID = ?', whereArgs: [playlistId]);
    await database.delete(TABLE_PLAYLISTS_SONGS,
        where: '$PLAYLIST_ID = ?', whereArgs: [playlistId]);
  }

  Future renamePlaylists(int playlistId, String newName) async {
    // Get a reference to the database.
    final Database database = (await db)!;
    await database.rawUpdate('''
    UPDATE $TABLE_PLAYLISTS
    SET $PLAYLIST_NAME = ?
    WHERE $ID = ?;
        ''', [newName, playlistId]);
  }

  Stream<List<int>> getSongsInPlaylist(int playlistId) async* {
    // Get a reference to the database.
    final Database database = (await db)!;

    final List<Map<String, dynamic>> items = await database.query(
        TABLE_PLAYLISTS_SONGS,
        columns: [ID_SONG],
        where: '$PLAYLIST_ID = ?',
        whereArgs: [playlistId]);
    List<int> songsIds = items.map((e) => e.values.first as int).toList();
    yield songsIds;
  }

  Future<void> removeFromPlaylist(int playlistId, int id) async {
    // Get a reference to the database.
    final Database database = (await db)!;

    await database.rawQuery('''
        DELETE
        FROM $TABLE_PLAYLISTS_SONGS
        WHERE $PLAYLIST_ID = ? 
        AND $ID_SONG =?;
        ''', [playlistId, id]);
  }

//work with video

  Future<List<Resources>> fetchFavoritesVideos() async {
    final Database database = (await db)!;
    final List<Map<String, dynamic>> query = await database.query(
      TABLE_RESOURCES,
      columns: ['$VIDEO_ID', '$VIDEO_TITLE', '$VIDEO_LANG'],
    );

    List<Resources> videos = query
        .map((item) => Resources(
            lang: item[VIDEO_LANG],
            title: item[VIDEO_TITLE],
            link: item[VIDEO_ID]))
        .toList();
    return videos;
  }

  addVideoToFavorites(Resources video) async {
    final Database database = (await db)!;
    await database.insert(TABLE_RESOURCES, {
      VIDEO_ID: video.link,
      VIDEO_LANG: video.lang,
      VIDEO_TITLE: video.title
    });
  }

  deleteVideoFromFavorites(Resources video) async {
    final Database database = (await db)!;

    int result = await database.delete(TABLE_RESOURCES,
        where: '$VIDEO_ID = ?', whereArgs: [video.link]);

    //log.w(result.toString() + " " + video.link);
  }
}
