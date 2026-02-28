import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';

abstract class InsightsInteractionsApi {
  Future<InsightLikeResult> toggleLike({
    required String postId,
    required String deviceId,
  });

  Future<int> incrementShare({
    required String postId,
    required String deviceId,
  });

  Future<InsightCommentSubmissionResult> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  });
}
