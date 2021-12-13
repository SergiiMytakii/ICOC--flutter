import '/index.dart';

class DatabaseServiceFirebase {
  var log = Logger();

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
        'resources': song.resources ?? null
      });
    }
  }

  //converting  snapshot to song list
  List<SongDetail> _songListFromSnapshot(QuerySnapshot snapshot) {
    final SongLangController songLangController = Get.find();
    final lang = songLangController.songLang;

    List<SongDetail> songs = snapshot.docs.map((doc) {
      //log.e(doc.get('resources'));
      List resourses = [];
      if (doc.get('resources') != null &&
          doc.get('resources') is Iterable<dynamic>) {
        resourses = List.from(doc.get('resources'));
      }

      return SongDetail(
          id: doc.get('id') ?? 0,
          description: doc.get('description'),
          text: doc.get('text') ?? {},
          title: doc.get('title') ?? {},
          chords: doc.get('chords'),
          resources: resourses.isNotEmpty
              ? resourses.map((item) {
                  //log.e(item);
                  return Resources.fromJson(item);
                }).toList()
              : null);
    }).toList();

    //get rid from nullable values

    songs.forEach((song) {
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
    });

    return songs;
  }

  //get songs
  Stream<List<SongDetail>> get songs {
    // insertSongsToFirebase(); //use this line to insert all songs from assets/songs.json
    //List<SongDetail> songs = [];
    return songCollection
        .snapshots()
        .map((event) => _songListFromSnapshot(event));
  }
}
