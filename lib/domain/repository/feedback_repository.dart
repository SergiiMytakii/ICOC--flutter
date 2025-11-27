import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/feedback/feedback_model.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, List<FeedbackModel>>> getFeedbackList();
  Future<Either<Failure, List<FeedbackModel>>> insertFeedback(
      String name, String feedback);
}
