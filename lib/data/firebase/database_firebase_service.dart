import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  // final SongLangController songLangController = Get.find();
  final db = FirebaseFirestore.instance;
  late CollectionReference songCollection;
  late CollectionReference bibleStudyCollection;

  DatabaseServiceFirebase() {
    db.settings = const Settings(persistenceEnabled: true);

    songCollection = db.collection('Songs');
    bibleStudyCollection = db.collection('BibleStudy');
    //print(songCollection.get().);
  }

  //get songs
  Future<QuerySnapshot> getSongs() async {
    QuerySnapshot snapshot = await songCollection.get();

    return snapshot;
  }

  Future<QuerySnapshot> getBibleStudies() async {
    var bibleStudies =
        await bibleStudyCollection.orderBy('lessons', descending: true).get();

    return bibleStudies;
  }
}
