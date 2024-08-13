import 'package:icoc/domain/model/notifications/notifications_model.dart';

abstract class NotificationsRepository {
  Future<List<NotificationsModel>> getNotifications();
}
