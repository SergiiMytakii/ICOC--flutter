import 'package:icoc/core/model/notifications_model.dart';

abstract class NotificationsRepository {
  Future<List<NotificationsModel>> getNotifications();
}
