import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';
import 'package:icoc/domain/model/insights/post.dart';

abstract class InsightsRepository {
  Future<Either<Failure, List<Post>>> getPosts({Set<String> languages});
  Future<Either<Failure, List<String>>> getAvailableLanguages();
  Future<Either<Failure, Post?>> getPostById(String postId);
  Future<Either<Failure, InsightLikeResult>> toggleLike({
    required String postId,
    required String deviceId,
  });
  Future<Either<Failure, List<String>>> getLikedPosts({
    required String deviceId,
  });
  Future<Either<Failure, int>> incrementShare({
    required String postId,
    required String deviceId,
  });
  Future<Either<Failure, List<InsightComment>>> getComments({
    required String postId,
    int limit = 30,
  });
  Future<Either<Failure, InsightCommentSubmissionResult>> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  });
}
