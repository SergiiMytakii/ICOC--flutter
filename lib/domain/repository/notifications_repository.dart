import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationsModel>>> getNotifications();
}
