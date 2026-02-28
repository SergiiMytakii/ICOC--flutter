import 'package:icoc/domain/model/insights/insight_comment.dart';

abstract class InsightsCommentsDataSource {
  Future<List<InsightComment>> getComments({
    required String postId,
    int limit = 30,
  });
}
