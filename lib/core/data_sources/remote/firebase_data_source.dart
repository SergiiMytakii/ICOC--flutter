import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseDataSource {
  Future<QuerySnapshot> getFromFirebase(String collection,
      {String? orderBy, bool? descending});
  Future<QuerySnapshot> postToFirebase(
      String collection, Map<String, String> data);
}
