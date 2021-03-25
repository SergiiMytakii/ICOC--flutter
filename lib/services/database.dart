import 'package:Projects/song_book/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  bool? _en;
  bool? _ru;
  bool? _ukr;

  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

  //just to check how we can write to DB
  Future updateSongTest() async {
    return await songCollection.doc('8').set({
      'text': {
        'ru': 'Господу хвалу поем, создал мир и все, что в нем.'
            'Дал Он Слово, дал мечту приводить людей к Христу.'
            'Аллилуйя! Аллилу- аллилу- аллилуйя!'
            ' Аллилуйя! Аллилу- аллилу- аллилуйя!'
      },
      'title': {'ru': 'Иисус - Господь'}
    });
  }

  //converting  snapshot to song list
  List<Song?> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<Song?> songs = snapshot.docs.map((doc) {
      return Song(
          id: doc.id,
          description: doc.data()!['description'] ?? {},
          text: doc.data()!['text'] ?? {},
          title: doc.data()!['title'] ?? {},
          createdAt: doc.data()!['created_at'] ?? '',
          chords: doc.data()!['chords'] ?? {},
          resources: doc.data()!['resources'] ?? []);
    }).toList();
    //get rid from nullable songs
    songs.removeWhere((song) => song == null);
    return songs;
  }

  //get songs stream
  Stream<List<Song?>> get songs {
    //print(_songListFromSnapshot);
    return songCollection.snapshots().map(_songListFromSnapshot);
  }
}
