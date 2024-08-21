import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/feedback/feedback_model.dart';
import 'package:icoc/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: FeedbackRepository)
class FeedbackRepositoryImpl implements FeedbackRepository {
  final FirebaseDataSource firebaseDataSource;

  FeedbackRepositoryImpl(this.firebaseDataSource);

  @override
  Future<Either<Failure, List<FeedbackModel>>> getFeedbackList() async {
    try {
      final QuerySnapshot snapshot = await firebaseDataSource
          .getFromFirebase(FirebaseCollections.Feedback.name);
      final List<FeedbackModel> feedbacks = _listFromSnapshot(snapshot);
      return Right(feedbacks.reversed.toList());
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<FeedbackModel>>> insertFeedback(
      String name, String feedback) async {
    try {
      final QuerySnapshot snapshot = await firebaseDataSource
          .postToFirebase(FirebaseCollections.Feedback.name, {
        'id': DateTime.now().toString(),
        'name': name,
        'text': feedback,
        'date': DateTime.now().toString(),
      });
      final List<FeedbackModel> feedbacks = _listFromSnapshot(snapshot);
      return Right(feedbacks.reversed.toList());
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }
}

List<FeedbackModel> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<FeedbackModel> feedbacks = snapshot.docs.map((doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    data['date'] ??= doc.id;
    data['id'] = doc.id;
    return FeedbackModel.fromJson(data);
  }).toList();
  return feedbacks;
}
