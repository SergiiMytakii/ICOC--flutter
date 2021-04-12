import 'package:Projects/services/import_songs.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {


  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

  //just to check how we can write to DB
  Future insertSongsToFirebase() async {
    List<Song> songsFromJson =  await ImportSongs().loadSongsFromJson();

for(Song song in songsFromJson) {

      print(" new song ${song.title}");
      await songCollection.doc(song.id.toString()).set({
        'id': song.id ,
        'text': song.text ,
        'title': song.title ,
        'description': song.description ,
        'chords': song.chords ,
        'resources': song.resources ?? null
      });
    }
  }

  //converting  snapshot to song list
  List<Song> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<Song> songs = snapshot.docs.map((doc) {
      return Song(
          id: int.parse(doc.id),
          description: doc.data()['description'] ?? {},
          text: doc.data()['text'] ?? {},
          title: doc.data()['title'] ?? {},
          chords: doc.data()['chords'] ?? {},
          resources: doc.data()['resources'] ?? []);
    }).toList();
    //get rid from nullable songs
    songs.removeWhere((song) => song == null);
    //get rid from nullable values
    songs.forEach((song) {
      song.title.removeWhere((key, value) => value == null);
      song.text.removeWhere((key, value) => value == null);
      song.description.removeWhere((key, value) => value == null);
      song.chords.removeWhere((key, value) => value == null);

    });
    return songs;
  }

  //get songs stream
  Stream<List<Song>> get songs {
    //insertSongsToFirebase();
    return songCollection.orderBy('id').snapshots().map(_songListFromSnapshot);
  }


}


