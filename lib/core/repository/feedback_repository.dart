import 'package:icoc/core/model/feedback.dart';

abstract class FeedbackRepository {
  Future<List<Feedback>> getFeedbackList();
  Future<List<Feedback>> insertFeedback(String name, String feedback);
}
