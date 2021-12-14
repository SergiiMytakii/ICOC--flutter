import '/index.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  final SongLangController songLangController = Get.find();

  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

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
      if (doc.get('resources') != null &&
          doc.get('resources') is Iterable<dynamic>) {
        resourses = List.from(doc.get('resources'));
      }

      final song = SongDetail(
          id: doc.get('id') ?? 0,
          description: doc.get('description'),
          text: doc.get('text') ?? {},
          title: doc.get('title') ?? {},
          chords: doc.get('chords') ?? {},
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
