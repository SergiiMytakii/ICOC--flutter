import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  // final SongLangController songLangController = Get.find();
  final db = FirebaseFirestore.instance;
  late final CollectionReference songCollection;
  late final CollectionReference bibleStudyCollection;
  late final CollectionReference notificationsCollection;
  late final CollectionReference videoCollection;
  late final CollectionReference feedbackCollection;

  DatabaseServiceFirebase() {
    db.settings = const Settings(persistenceEnabled: true);

    songCollection = db.collection('Songs');
    bibleStudyCollection = db.collection('BibleStudy');
    notificationsCollection = db.collection('Notifications');
    videoCollection = db.collection('Video');
    feedbackCollection = db.collection('Feedback');
    //print(songCollection.get().);
  }

  //get songs
  Future<QuerySnapshot> getSongs() async {
    final QuerySnapshot snapshot = await songCollection.get();

    return snapshot;
  }

  Future<QuerySnapshot> getBibleStudies() async {
    final QuerySnapshot bibleStudies =
        await bibleStudyCollection.orderBy('lessons', descending: true).get();

    return bibleStudies;
  }

  Future getNotifications() async {
    final QuerySnapshot snapshot = await notificationsCollection.get();
    return snapshot;
  }

  Future getVideos() async {
    final QuerySnapshot snapshot = await videoCollection.get();
    return snapshot;
  }

  Future getFeedbackList() async {
    final QuerySnapshot snapshot = await feedbackCollection.get();
    return snapshot;
  }

  Future insertFeedback(String name, String feedback, String date) async {
    DocumentReference documentRef = feedbackCollection.doc(date);
    await documentRef.set({'name': name, 'text': feedback});
    final QuerySnapshot snapshot = await feedbackCollection.get();
    return snapshot;
  }
}
