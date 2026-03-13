import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';

@dev
@prod
@Injectable(as: FirebaseDataSource)
class DatabaseServiceFirebase implements FirebaseDataSource {
  var log = Logger();
  final db = FirebaseFirestore.instance;

  DatabaseServiceFirebase() {
    db.settings = const Settings(persistenceEnabled: true);
  }

  //get songs
  @override
  Future<QuerySnapshot> getFromFirebase(
    String collectionName, {
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    Map<String, bool>? orderBy,
  }) async {
    Query query = db.collection(collectionName);
    if (filters != null && filters.isNotEmpty) {
      for (var filter in filters.entries) {
        if (filter.value is List) {
          query = query.where(filter.key, whereIn: filter.value);
        } else {
          query = query.where(filter.key, isEqualTo: filter.value);
        }
      }
    }
    if (search != null && search.isNotEmpty) {
      for (var search in search.entries) {
        query = query.where(search.key, arrayContainsAny: {search.value});
      }
    }

    if (orderBy != null && orderBy.isNotEmpty) {
      query = query.orderBy(orderBy.entries.first.key,
          descending: orderBy.entries.first.value);
    }

    return await query.get();
  }

  @override
  Future<QuerySnapshot> postToFirebase(
      String collectionName, Map<String, dynamic> data) async {
    final CollectionReference collection = db.collection(collectionName);
    final DocumentReference documentRef = collection.doc(data['id'].toString());
    await documentRef.set(data);
    final QuerySnapshot snapshot = await collection.get();
    return snapshot;
  }

  @override
  Future<QuerySnapshot> updateToFirebase(
      {required String collectionName,
      required String documentPath,
      required Map<String, dynamic> data}) async {
    final CollectionReference collection = db.collection(collectionName);
    final DocumentReference documentRef = collection.doc(documentPath);
    documentRef.update(data);
    final QuerySnapshot snapshot = await collection.get();

    return snapshot;
  }
}
