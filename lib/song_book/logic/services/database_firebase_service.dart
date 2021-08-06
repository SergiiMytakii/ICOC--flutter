import 'package:icoc/song_book/models/song_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'import_songs.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

  //function to add songs to firebase from json file
  Future insertSongsToFirebase() async {
    List songsFromJson = await ImportSongs().loadSongsFromJson();

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
    List<SongDetail> songs = snapshot.docs.map((doc) {
      return SongDetail(
          id: doc.get('id') ?? 0,
          description: doc.get('description') ?? {},
          text: doc.get('text') ?? {},
          title: doc.get('title') ?? {},
          chords: doc.get('chords') ?? {},
          resources: doc.get('resources') ?? []);
    }).toList();

    //get rid from nullable values
    songs.forEach((song) {
      song.title.removeWhere((key, value) => value == null);
      song.text.removeWhere((key, value) => value == null);
      song.description.removeWhere((key, value) => value == null);
      song.chords.removeWhere((key, value) => value == null);
    });

    return songs;
  }

  //get songs
  Stream<List<SongDetail>> get songs {
    //insertSongsToFirebase(); //use this line to insert all songs from assets/songs.json
    return songCollection.snapshots().map(_songListFromSnapshot);
  }
}
