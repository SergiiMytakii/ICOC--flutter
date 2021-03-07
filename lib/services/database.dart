import 'package:Projects/song_book/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');
  //Source source = Source.server;

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

  //song list from snapshot
  List<Song?>? _songListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data()['title']);
      return Song(
          id: doc.id,
          description: doc.data()!['description'] ?? {},
          text: doc.data()!['text'] ?? {},
          title: doc.data()!['title'] ?? {},
          createdAt: doc.data()!['created_at'] ?? '',
          chords: doc.data()!['chords'] ?? {},
          resources: doc.data()!['resources'] ?? []);
    }).toList();
  }

  //get songs stream
  Stream<List<Song?>?> get songs {
    //print(_songListFromSnapshot);
    return songCollection.snapshots().map(_songListFromSnapshot);
  }
}
