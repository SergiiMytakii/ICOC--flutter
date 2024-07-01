import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/core/repository/notifications_repository.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository {
  @override
  Future<List<Map<String, NotificationsModel>>> getNotifications() async {
    final List<Map<String, NotificationsModel>> notifications = [];

    final DatabaseServiceFirebase databaseServiceFirebase =
        DatabaseServiceFirebase();
    final QuerySnapshot snapshot =
        await databaseServiceFirebase.getNotifications();
    for (final doc in snapshot.docs) {
      final Map data = doc.data() as Map;
      final keys = data.keys;
      keys.forEach((key) {
        for (final Map notification in data[key]) {
          notifications.add({
            key: NotificationsModel(
                topic: doc.id,
                title: notification['title'],
                text: notification['text'],
                link: notification['link'])
          });
        }
      });
    }

    return notifications.reversed.toList();
  }
}
