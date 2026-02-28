import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_bloc.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_event.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_state.dart';

class _FakeInsightsRepository implements InsightsRepository {
  Future<Either<Failure, List<InsightComment>>> Function({
    required String postId,
    int limit,
  })? getCommentsHandler;
  Future<Either<Failure, InsightCommentSubmissionResult>> Function({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  })? addCommentHandler;

  @override
  Future<Either<Failure, InsightCommentSubmissionResult>> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  }) {
    final handler = addCommentHandler;
    if (handler == null) {
      throw StateError('addCommentHandler is not configured');
    }
    return handler(
      postId: postId,
      deviceId: deviceId,
      displayName: displayName,
      text: text,
    );
  }

  @override
  Future<Either<Failure, List<String>>> getAvailableLanguages() async =>
      const Right(<String>[]);

  @override
  Future<Either<Failure, List<InsightComment>>> getComments({
    required String postId,
    int limit = 30,
  }) {
    final handler = getCommentsHandler;
    if (handler == null) {
      throw StateError('getCommentsHandler is not configured');
    }
    return handler(postId: postId, limit: limit);
  }

  @override
  Future<Either<Failure, Post?>> getPostById(String postId) async =>
      const Right(null);

  @override
  Future<Either<Failure, List<Post>>> getPosts(
          {Set<String> languages = const {}}) async =>
      const Right(<Post>[]);

  @override
  Future<Either<Failure, int>> incrementShare({
    required String postId,
    required String deviceId,
  }) async =>
      const Right(0);

  @override
  Future<Either<Failure, InsightLikeResult>> toggleLike({
    required String postId,
    required String deviceId,
  }) async =>
      const Right(InsightLikeResult(liked: false, likes: 0));
}

class _MemoryLocalCache implements LocalCache {
  final Map<String, Object?> _values = <String, Object?>{};

  @override
  bool? getBool(String key) => _values[key] as bool?;

  @override
  double? getDouble(String key) => _values[key] as double?;

  @override
  List<String>? getList(String key) => (_values[key] as List?)?.cast<String>();

  @override
  Map<String, dynamic>? getMap(String key) =>
      (_values[key] as Map?)?.cast<String, dynamic>();

  @override
  String? getString(String key) => _values[key] as String?;

  @override
  Future<void> removeValue(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveList(String key, List<String> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveString(String key, String value) async {
    _values[key] = value;
  }
}

void main() {
  late InsightsCommentsBloc bloc;
  late _FakeInsightsRepository repository;
  late _MemoryLocalCache cache;
  late InsightsInteractionLocalStore localStore;

  final InsightComment comment = InsightComment(
    id: 'comment-1',
    postId: 'post-1',
    displayName: 'Alex',
    text: 'Great post',
    createdAt: DateTime(2025, 1, 2),
  );

  setUp(() async {
    repository = _FakeInsightsRepository();
    cache = _MemoryLocalCache();
    await cache.saveString(StorageKeys.deviceId, 'device-1');
    localStore = InsightsInteractionLocalStore(cache);
    bloc = InsightsCommentsBloc(repository, localStore);
  });

  tearDown(() async {
    await bloc.close();
  });

  blocTest<InsightsCommentsBloc, InsightsCommentsState>(
    'fetch emits loading then loaded comments',
    build: () {
      repository.getCommentsHandler = ({
        required String postId,
        int limit = 30,
      }) async =>
          Right(<InsightComment>[comment]);
      return bloc;
    },
    act: (InsightsCommentsBloc bloc) =>
        bloc.add(const InsightsCommentsEvent.fetch('post-1')),
    expect: () => <InsightsCommentsState>[
      const InsightsCommentsState.loading(),
      InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[comment],
      ),
    ],
  );

  blocTest<InsightsCommentsBloc, InsightsCommentsState>(
    'submit validates blank comment locally',
    build: () => bloc,
    seed: () => const InsightsCommentsState.loaded(
      postId: 'post-1',
      comments: <InsightComment>[],
    ),
    act: (InsightsCommentsBloc bloc) => bloc.add(
      const InsightsCommentsEvent.submit(
        postId: 'post-1',
        text: '   ',
        displayName: 'Alex',
      ),
    ),
    expect: () => const <InsightsCommentsState>[
      InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[],
        actionMessage: 'Comment cannot be empty',
      ),
    ],
  );

  blocTest<InsightsCommentsBloc, InsightsCommentsState>(
    'submit stores comment and display name on success',
    build: () {
      repository.addCommentHandler = ({
        required String postId,
        required String deviceId,
        required String displayName,
        required String text,
      }) async =>
          Right(
            InsightCommentSubmissionResult(
              comment: comment,
              commentsCount: 1,
            ),
          );
      return bloc;
    },
    seed: () => const InsightsCommentsState.loaded(
      postId: 'post-1',
      comments: <InsightComment>[],
    ),
    act: (InsightsCommentsBloc bloc) => bloc.add(
      const InsightsCommentsEvent.submit(
        postId: 'post-1',
        text: 'Great post',
        displayName: 'Alex',
      ),
    ),
    expect: () => <InsightsCommentsState>[
      const InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[],
        isSubmitting: true,
      ),
      InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[comment],
        lastSubmittedCommentId: 'comment-1',
      ),
    ],
    verify: (_) {
      expect(cache.getString(StorageKeys.insightsDisplayName), 'Alex');
    },
  );

  blocTest<InsightsCommentsBloc, InsightsCommentsState>(
    'submit surfaces repository failures',
    build: () {
      repository.addCommentHandler = ({
        required String postId,
        required String deviceId,
        required String displayName,
        required String text,
      }) async =>
          const Left(Failure.serverError());
      return bloc;
    },
    seed: () => const InsightsCommentsState.loaded(
      postId: 'post-1',
      comments: <InsightComment>[],
    ),
    act: (InsightsCommentsBloc bloc) => bloc.add(
      const InsightsCommentsEvent.submit(
        postId: 'post-1',
        text: 'Great post',
        displayName: 'Alex',
      ),
    ),
    expect: () => const <InsightsCommentsState>[
      InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[],
        isSubmitting: true,
      ),
      InsightsCommentsState.loaded(
        postId: 'post-1',
        comments: <InsightComment>[],
        actionMessage:
            'Server error. Please check your internet connection and try again.',
      ),
    ],
  );
}
