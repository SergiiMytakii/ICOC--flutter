import '/index.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  final SongLangController songLangController = Get.find();
  final db = FirebaseFirestore.instance;
  late CollectionReference songCollection;

  DatabaseServiceFirebase() {
    db.settings = const Settings(persistenceEnabled: true);

    songCollection = db.collection('Songs');
    //print(songCollection.get().);
  }

  //function to add songs to firebase from json file
  Future insertSongsToFirebase() async {
    List<SongDetail> songsFromJson = await ImportSongs().loadSongsFromJson();
    songCollection.doc().delete();
    for (SongDetail song in songsFromJson) {
      await songCollection.doc(song.id.toString()).set({
        'id': song.id,
        'text': song.text,
        'title': song.title,
        'description': song.description,
        'chords': song.chords,
        'resources': song.resources
      });
    }
  }

  SongDetail cleanSong(SongDetail song) {
    final lang = songLangController.songLang;
    song.title.removeWhere((key, value) => value == null);
    song.text.removeWhere((key, value) => value == null);
    if (song.description != null)
      song.description!.removeWhere((key, value) => value == null);
    if (song.chords != null)
      song.chords!.removeWhere((key, value) => value == null);
    if (!lang['ru']!) {
      song.title.removeWhere((key, value) => key == 'ru');
      song.text.removeWhere((key, value) => key.contains('ru'));
      if (song.description != null)
        song.description!.removeWhere((key, value) => key.contains('ru'));
    }
    if (!lang['uk']!) {
      song.title.removeWhere((key, value) => key == 'uk');
      song.text.removeWhere((key, value) => key.contains('uk'));
      if (song.description != null)
        song.description!.removeWhere((key, value) => key.contains('uk'));
    }
    if (!lang['en']!) {
      song.title.removeWhere((key, value) => key == 'en');
      song.text.removeWhere((key, value) => key.contains('en'));
      if (song.description != null)
        song.description!.removeWhere((key, value) => key.contains('en'));
    }

    return song;
  }

  //converting  snapshot to song list
  List<SongDetail> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<SongDetail> songs = snapshot.docs.map((doc) {
      List resourses = [];
      Map data = doc.data() as Map;
      // print("snapshot.metadata.isFromCache}  ${snapshot.metadata.isFromCache}");
      if (data['resources'] != null && data['resources'] is Iterable<dynamic>) {
        resourses = List.from(doc.get('resources'));
      }

      final song = SongDetail(
          id: data['id'] ?? 0,
          description: data['description'],
          text: data['text'] ?? {},
          title: data['title'] ?? {},
          chords: data['chords'] ?? {},
          resources: resourses.isNotEmpty
              ? resourses.map((item) {
                  //log.e(item);
                  return Resources.fromJson(item);
                }).toList()
              : null);

      return cleanSong(song);
    }).toList();

    //get rid from nullable values

    songs.removeWhere((song) => song.text.isEmpty);
    songs.removeWhere((song) => song.title.isEmpty);
    return songs;
  }

  //get songs
  Stream<List<SongDetail>> get songs {
    return songCollection
        .snapshots()
        .map((event) => _songListFromSnapshot(event));
  }
}
