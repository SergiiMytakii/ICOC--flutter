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
        'ru1': 'Иисус Господь \r\nВедет нас за Собой.\r\nГрехи простил, \r\nОсвободил \r\nИ дал нам Дух\r\nСвятой.\r\nДень пришел,\r\nДень последний\r\nТрубный глас\r\nПрозвучал!\r\nДень пришел,\r\nДень последний\r\nТрубный глас\r\nПрозвучал!\r\nТы нас избрал. \r\nИисус Господь \r\nВедет нас за Собой.\r\nГрехи простил, \r\nОсвободил \r\nИ дал нам Дух\r\nСвятой.\r\nТы нас избрал. \r\nИисус Господь \r\nВедет нас за Собой.\r\nГрехи простил, \r\nОсвободил \r\nИ дал нам Дух\r\nСвятой.'
      },
      'title': {'ru': 'Ты нас избрал'}
    });
  }

  //converting  snapshot to song list
  List<Song?> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<Song?> songs = snapshot.docs.map((doc) {
      return Song(
          id: doc.id,
          description: doc.data()['description'] ?? {},
          text: doc.data()['text'] ?? {},
          title: doc.data()['title'] ?? {},
          createdAt: doc.data()['created_at'] ?? '',
          chords: doc.data()['chords'] ?? {},
          resources: doc.data()['resources'] ?? []);
    }).toList();
    //get rid from nullable songs
    songs.removeWhere((song) => song == null);
    return songs;
  }

  //get songs stream
  Stream<List<Song?>> get songs {
    updateSongTest();
    return songCollection.snapshots().map(_songListFromSnapshot);
  }
}
