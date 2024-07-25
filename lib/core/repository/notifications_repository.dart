import 'package:icoc/core/model/notifications/notifications_model.dart';

abstract class NotificationsRepository {
  Future<List<NotificationsModel>> getNotifications();
}
