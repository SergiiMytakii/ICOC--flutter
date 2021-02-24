import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference songCollection =
  FirebaseFirestore.instance.collection('Songs');

  Future updateSongTest() async {
    return await songCollection.doc('test').set({
      'id': 2,
      'text': {
        'eng': {'v1': 'bla-bla-bla'}
      }
    });
  }
}
