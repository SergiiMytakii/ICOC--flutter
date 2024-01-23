import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/core/repository/notifications_repository.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';

class NotificationsRepositoryImpl extends NotificationsRepository {
  @override
  Future<List<Map<String, NotificationsModel>>> getNotifications() async {
    final List<Map<String, NotificationsModel>> notifications = [];

    DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();
    QuerySnapshot snapshot = await databaseServiceFirebase.getNotifications();
    for (final doc in snapshot.docs) {
      Map data = doc.data() as Map;
      var keys = data.keys;
      keys.forEach((key) {
        for (final Map notification in data[key]) {
          notifications.add({
            key: NotificationsModel(
                topic: doc.id,
                title: notification["title"],
                text: notification["text"],
                link: notification["link"])
          });
        }
      });
    }

    return notifications.reversed.toList();
  }
}
