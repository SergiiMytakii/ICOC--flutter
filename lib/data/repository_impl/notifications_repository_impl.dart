import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';
import 'package:icoc/domain/repository/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository {
  final FirebaseDataSource firebaseDataSource;

  NotificationsRepositoryImpl(this.firebaseDataSource);

  @override
  Future<Either<Failure, List<NotificationsModel>>> getNotifications() async {
    try {
      final QuerySnapshot snapshot = await firebaseDataSource
          .getFromFirebase(FirebaseCollections.Notifications.name);
      final List<NotificationsModel> notifications = snapshot.docs.map(
        (doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return NotificationsModel.fromJson(
            data,
          );
        },
      ).toList();

      return Right(notifications);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }
}
