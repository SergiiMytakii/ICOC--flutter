import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseDataSource {
  Future<QuerySnapshot> getFromFirebase(String collection,
      {dynamic orderBy, bool? descending});
  Future<QuerySnapshot> postToFirebase(
      String collection, Map<String, dynamic> data);
}
