import 'package:Projects/services/import_songs.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceFirebase {
  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

  //function to add songs to firebase from json file
  Future insertSongsToFirebase() async {
    List<Song> songsFromJson = await ImportSongs().loadSongsFromJson();

    for (Song song in songsFromJson) {
      print(" new song ${song.title}");
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
  List<Song> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<Song> songs = snapshot.docs.map((doc) {
      return Song(
          id: doc.data()['id'] ?? 0,
          description: doc.data()['description'] ?? {},
          text: doc.data()['text'] ?? {},
          title: doc.data()['title'] ?? {},
          chords: doc.data()['chords'] ?? {},
          resources: doc.data()['resources'] ?? []);
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
  Future get songs {
    //insertSongsToFirebase();  //use this line to insert all songs from assets/songs.json
    return songCollection
        .get()
        .then((snapshot) => _songListFromSnapshot(snapshot), onError: (error) {
      print('Error is $error');
    });
  }
}
