import '../../../index.dart';

class NotificationsServiceFirebase {
  var log = Logger();
  //get access to database
  final CollectionReference notidicationsCollection =
      FirebaseFirestore.instance.collection('Notifications');

  Future<QuerySnapshot> get notifications async {
    final QuerySnapshot notifications = await notidicationsCollection.get();

    return notifications;
  }
}
