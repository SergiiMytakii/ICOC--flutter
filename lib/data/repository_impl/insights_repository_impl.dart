import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/insights_comments_data_source.dart';
import 'package:icoc/domain/data_sources/remote/insights_feed_data_source.dart';
import 'package:icoc/domain/data_sources/remote/insights_interactions_api.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/repository/insights_repository.dart';

@LazySingleton(as: InsightsRepository)
class InsightsRepositoryImpl implements InsightsRepository {
  InsightsRepositoryImpl(
    this._feedDataSource,
    this._commentsDataSource,
    this._interactionsApi,
  );

  final InsightsFeedDataSource _feedDataSource;
  final InsightsCommentsDataSource _commentsDataSource;
  final InsightsInteractionsApi _interactionsApi;

  @override
  Future<Either<Failure, InsightCommentSubmissionResult>> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  }) async {
    try {
      final InsightCommentSubmissionResult result =
          await _interactionsApi.addComment(
        postId: postId,
        deviceId: deviceId,
        displayName: displayName,
        text: text,
      );
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAvailableLanguages() async {
    try {
      final List<String> languages =
          await _feedDataSource.getAvailableLanguages();
      return Right(languages);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<InsightComment>>> getComments({
    required String postId,
    int limit = 30,
  }) async {
    try {
      final List<InsightComment> comments =
          await _commentsDataSource.getComments(
        postId: postId,
        limit: limit,
      );
      return Right(comments);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Post?>> getPostById(String postId) async {
    try {
      final Post? post = await _feedDataSource.getPostById(postId);
      return Right(post);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts({
    Set<String> languages = const <String>{},
  }) async {
    try {
      final List<Post> posts =
          await _feedDataSource.getPosts(languages: languages);
      return Right(posts);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, int>> incrementShare({
    required String postId,
    required String deviceId,
  }) async {
    try {
      final int shares = await _interactionsApi.incrementShare(
        postId: postId,
        deviceId: deviceId,
      );
      return Right(shares);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, InsightLikeResult>> toggleLike({
    required String postId,
    required String deviceId,
  }) async {
    try {
      final InsightLikeResult result = await _interactionsApi.toggleLike(
        postId: postId,
        deviceId: deviceId,
      );
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }
}
