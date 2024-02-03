import 'package:icoc/core/model/notifications_model.dart';

abstract class NotificationsRepository {
  Future<List<Map<String, NotificationsModel>>> getNotifications();
}
