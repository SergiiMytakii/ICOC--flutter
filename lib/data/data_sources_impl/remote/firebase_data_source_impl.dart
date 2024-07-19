import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:icoc/core/data_sources/remote/firebase_data_source.dart';

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
  Future<QuerySnapshot> getFromFirebase(String collectionName,
      {dynamic orderBy, bool? descending}) async {
    final CollectionReference collection = db.collection(collectionName);
    if (descending != null && orderBy != null) {
      return collection.orderBy(orderBy, descending: descending).get();
    } else {
      return await collection.get();
    }
  }

  @override
  Future<QuerySnapshot> postToFirebase(
      String collectionName, Map<String, String> data) async {
    final CollectionReference collection = db.collection(collectionName);
    final DocumentReference documentRef = collection.doc(
      DateTime.now().toUtc().toString(),
    );
    await documentRef.set(data);
    final QuerySnapshot snapshot = await collection.get();
    return snapshot;
  }
}
