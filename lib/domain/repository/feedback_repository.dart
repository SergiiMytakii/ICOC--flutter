import 'package:icoc/domain/model/feedback/feedback_model.dart';

abstract class FeedbackRepository {
  Future<List<FeedbackModel>> getFeedbackList();
  Future<List<FeedbackModel>> insertFeedback(String name, String feedback);
}
