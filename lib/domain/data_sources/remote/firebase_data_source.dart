import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseDataSource {
  Future<QuerySnapshot> updateToFirebase(
      {required String collectionName,
      required String documentPath,
      required Map<String, dynamic> data});
  Future<QuerySnapshot> getFromFirebase(
    String collection, {
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    Map<String, bool>? orderBy,
  });
  Future<QuerySnapshot> postToFirebase(
      String collection, Map<String, dynamic> data);
}
