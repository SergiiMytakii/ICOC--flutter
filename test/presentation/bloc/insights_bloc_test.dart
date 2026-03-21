import 'dart:ui' as ui;

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/core/user_state/new_items_local_store.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_author.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/main.dart' as app;
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';

class _FakeInsightsRepository implements InsightsRepository {
  Future<Either<Failure, List<Post>>> Function(
      {required Set<String> languages})? getPostsHandler;
  Future<Either<Failure, List<String>>> Function()?
      getAvailableLanguagesHandler;
  Future<Either<Failure, Post?>> Function(String postId)? getPostByIdHandler;
  Future<Either<Failure, InsightLikeResult>> Function({
    required String postId,
    required String deviceId,
  })? toggleLikeHandler;
  Future<Either<Failure, List<String>>> Function({
    required String deviceId,
  })? getLikedPostsHandler;
  Future<Either<Failure, int>> Function({
    required String postId,
    required String deviceId,
  })? incrementShareHandler;

  @override
  Future<Either<Failure, InsightCommentSubmissionResult>> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  }) async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, List<String>>> getAvailableLanguages() {
    final handler = getAvailableLanguagesHandler;
    if (handler == null) {
      throw StateError('getAvailableLanguagesHandler is not configured');
    }
    return handler();
  }

  @override
  Future<Either<Failure, List<InsightComment>>> getComments({
    required String postId,
    int limit = 30,
  }) async =>
      const Right(<InsightComment>[]);

  @override
  Future<Either<Failure, Post?>> getPostById(String postId) {
    final handler = getPostByIdHandler;
    if (handler == null) {
      return Future.value(const Right(null));
    }
    return handler(postId);
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts({
    Set<String> languages = const {},
  }) {
    final handler = getPostsHandler;
    if (handler == null) {
      throw StateError('getPostsHandler is not configured');
    }
    return handler(languages: languages);
  }

  @override
  Future<Either<Failure, int>> incrementShare({
    required String postId,
    required String deviceId,
  }) {
    final handler = incrementShareHandler;
    if (handler == null) {
      throw StateError('incrementShareHandler is not configured');
    }
    return handler(postId: postId, deviceId: deviceId);
  }

  @override
  Future<Either<Failure, InsightLikeResult>> toggleLike({
    required String postId,
    required String deviceId,
  }) {
    final handler = toggleLikeHandler;
    if (handler == null) {
      throw StateError('toggleLikeHandler is not configured');
    }
    return handler(postId: postId, deviceId: deviceId);
  }

  @override
  Future<Either<Failure, List<String>>> getLikedPosts({
    required String deviceId,
  }) {
    final handler = getLikedPostsHandler;
    if (handler == null) {
      throw StateError('getLikedPostsHandler is not configured');
    }
    return handler(deviceId: deviceId);
  }
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
  TestWidgetsFlutterBinding.ensureInitialized();

  late InsightsBloc bloc;
  late _FakeInsightsRepository repository;
  late _MemoryLocalCache cache;
  late InsightsUserLanguagesHandler userLanguagesHandler;
  late InsightsInteractionLocalStore localStore;
  late String originalLocale;
  late String expectedFallbackLanguage;

  final Post post = Post(
    id: '1',
    type: PostType.image,
    language: 'en',
    content: 'Test post',
    mediaUrls: const <String>['https://example.com/image.jpg'],
    author: const PostAuthor(name: 'Test', avatarUrl: ''),
    createdAt: DateTime(2025, 1, 1),
    likes: 2,
    shares: 1,
  );
  final Post olderPost = Post(
    id: 'older',
    type: PostType.image,
    language: 'en',
    content: 'Older post',
    mediaUrls: const <String>['https://example.com/older.jpg'],
    author: const PostAuthor(name: 'Test', avatarUrl: ''),
    createdAt: DateTime(2024, 1, 1),
  );
  final Post newerPost = Post(
    id: 'newer',
    type: PostType.image,
    language: 'en',
    content: 'Newer post',
    mediaUrls: const <String>['https://example.com/newer.jpg'],
    author: const PostAuthor(name: 'Test', avatarUrl: ''),
    createdAt: DateTime(2025, 2, 1),
  );

  setUp(() async {
    originalLocale = app.locale;
    repository = _FakeInsightsRepository();
    repository.getLikedPostsHandler = ({
      required String deviceId,
    }) async =>
        const Right(<String>[]);
    cache = _MemoryLocalCache();
    await cache.saveString(StorageKeys.deviceId, 'device-1');
    userLanguagesHandler = InsightsUserLanguagesHandler(cache);
    localStore = InsightsInteractionLocalStore(cache);
    final newItemsStore = NewItemsLocalStore(cache);
    bloc = InsightsBloc(
        repository, userLanguagesHandler, localStore, newItemsStore);
  });

  tearDown(() async {
    app.locale = originalLocale;
    await bloc.close();
  });

  test('initial state is correct', () {
    expect(bloc.state, const InsightsState.initial());
  });

  blocTest<InsightsBloc, InsightsState>(
    'keeps newest posts first after initial fetch',
    build: () {
      repository.getAvailableLanguagesHandler =
          () async => const Right(<String>['en']);
      repository.getPostsHandler = ({
        required Set<String> languages,
      }) async =>
          Right(<Post>[olderPost, newerPost]);
      repository.getLikedPostsHandler = ({
        required String deviceId,
      }) async =>
          const Right(<String>[]);
      return bloc;
    },
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.fetchAvailableLanguagesAndPosts(),
    ),
    expect: () => <dynamic>[
      const InsightsState.loading(),
      isA<InsightsState>().having(
        (InsightsState state) => state.maybeWhen(
          loaded: (
            List<Post> posts,
            List<String> _,
            Map<String, bool> __,
            Set<String> ___,
            Set<String> ____,
            int _____,
            String? ______,
          ) =>
              posts.map((Post post) => post.id).toList(),
          orElse: () => const <String>[],
        ),
        'posts ordered from newest to oldest',
        <String>['newer', 'older'],
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'selects app locale by default when it exists in available languages',
    build: () {
      app.locale = 'uk';
      repository.getAvailableLanguagesHandler =
          () async => const Right(<String>['en', 'uk']);
      repository.getPostsHandler = ({
        required Set<String> languages,
      }) async =>
          const Right(<Post>[]);
      return bloc;
    },
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.fetchAvailableLanguagesAndPosts(),
    ),
    expect: () => <InsightsState>[
      const InsightsState.loading(),
      const InsightsState.loaded(
        posts: <Post>[],
        availableLanguages: <String>['en', 'uk'],
        selectedLanguages: <String, bool>{'en': false, 'uk': true},
        likedPostIds: <String>{},
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'falls back to device locale when app locale is unavailable',
    build: () {
      final String deviceLocale =
          ui.PlatformDispatcher.instance.locale.languageCode;
      app.locale = deviceLocale == 'uk' ? 'fr' : 'uk';
      repository.getAvailableLanguagesHandler =
          () async => Right(<String>[deviceLocale, 'en']);
      repository.getPostsHandler = ({
        required Set<String> languages,
      }) async =>
          const Right(<Post>[]);
      return bloc;
    },
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.fetchAvailableLanguagesAndPosts(),
    ),
    expect: () => <dynamic>[
      const InsightsState.loading(),
      isA<InsightsState>().having(
        (InsightsState state) => state.maybeWhen(
          loaded: (
            List<Post> _,
            List<String> __,
            Map<String, bool> selectedLanguages,
            Set<String> ___,
            Set<String> ____,
            int _____,
            String? ______,
          ) =>
              selectedLanguages.values.where((bool enabled) => enabled).single,
          orElse: () => false,
        ),
        'one selected language',
        true,
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'falls back to the first available language when app and device locales are unavailable',
    build: () {
      final String deviceLocale =
          ui.PlatformDispatcher.instance.locale.languageCode;
      final List<String> fallbackLanguages = <String>[
        'es',
        'it',
        'pt',
        'nl',
      ].where((String code) => code != deviceLocale).take(2).toList();
      expectedFallbackLanguage = fallbackLanguages.first;
      app.locale = deviceLocale == 'fr' ? 'uk' : 'fr';
      repository.getAvailableLanguagesHandler =
          () async => Right(fallbackLanguages);
      repository.getPostsHandler = ({
        required Set<String> languages,
      }) async =>
          const Right(<Post>[]);
      return bloc;
    },
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.fetchAvailableLanguagesAndPosts(),
    ),
    expect: () => <dynamic>[
      const InsightsState.loading(),
      isA<InsightsState>().having(
        (InsightsState state) => state.maybeWhen(
          loaded: (
            List<Post> _,
            List<String> __,
            Map<String, bool> selectedLanguages,
            Set<String> ___,
            Set<String> ____,
            int _____,
            String? ______,
          ) =>
              selectedLanguages.entries
                  .firstWhere((MapEntry<String, bool> entry) => entry.value)
                  .key,
          orElse: () => null,
        ),
        'selected language',
        expectedFallbackLanguage,
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'changes selected languages and reloads posts',
    build: () {
      repository.getPostsHandler = ({
        required Set<String> languages,
      }) async =>
          Right(<Post>[post]);
      return bloc;
    },
    seed: () => InsightsState.loaded(
      posts: const <Post>[],
      availableLanguages: const <String>['en', 'uk'],
      selectedLanguages: const <String, bool>{'en': true, 'uk': false},
      likedPostIds: const <String>{},
    ),
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.languagesChanged(
          <String, bool>{'en': true, 'uk': true}),
    ),
    wait: const Duration(milliseconds: 1),
    expect: () => <InsightsState>[
      const InsightsState.loaded(
        posts: <Post>[],
        availableLanguages: <String>['en', 'uk'],
        selectedLanguages: <String, bool>{'en': true, 'uk': true},
        likedPostIds: <String>{},
      ),
      InsightsState.loaded(
        posts: <Post>[post],
        availableLanguages: const <String>['en', 'uk'],
        selectedLanguages: const <String, bool>{'en': true, 'uk': true},
        likedPostIds: const <String>{},
      ),
    ],
    verify: (_) {
      expect(
        userLanguagesHandler.languages,
        <String, dynamic>{'en': true, 'uk': true},
      );
    },
  );

  blocTest<InsightsBloc, InsightsState>(
    're-sorts posts after refreshing a single older post',
    build: () {
      repository.getPostByIdHandler = (String postId) async => Right(olderPost);
      return bloc;
    },
    seed: () => InsightsState.loaded(
      posts: <Post>[newerPost],
      availableLanguages: const <String>['en'],
      selectedLanguages: const <String, bool>{'en': true},
      likedPostIds: const <String>{},
    ),
    act: (InsightsBloc bloc) =>
        bloc.add(const InsightsEvent.refreshSinglePost('older')),
    expect: () => <InsightsState>[
      InsightsState.loaded(
        posts: <Post>[newerPost, olderPost],
        availableLanguages: const <String>['en'],
        selectedLanguages: const <String, bool>{'en': true},
        likedPostIds: const <String>{},
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'toggleLike updates likes counter and local liked ids',
    build: () {
      repository.toggleLikeHandler = ({
        required String postId,
        required String deviceId,
      }) async =>
          const Right(InsightLikeResult(liked: true, likes: 3));
      return bloc;
    },
    seed: () => InsightsState.loaded(
      posts: <Post>[post],
      availableLanguages: const <String>['en'],
      selectedLanguages: const <String, bool>{'en': true},
      likedPostIds: const <String>{},
    ),
    act: (InsightsBloc bloc) => bloc.add(const InsightsEvent.toggleLike('1')),
    expect: () => <InsightsState>[
      InsightsState.loaded(
        posts: <Post>[post],
        availableLanguages: const <String>['en'],
        selectedLanguages: const <String, bool>{'en': true},
        likedPostIds: const <String>{},
        busyPostIds: const <String>{'1'},
      ),
      InsightsState.loaded(
        posts: <Post>[post.copyWith(likes: 3)],
        availableLanguages: const <String>['en'],
        selectedLanguages: const <String, bool>{'en': true},
        likedPostIds: const <String>{'1'},
      ),
    ],
    verify: (_) {
      expect(localStore.getLikedPostIds(), <String>{'1'});
    },
  );

  blocTest<InsightsBloc, InsightsState>(
    'shareTapped updates share counter',
    build: () {
      repository.incrementShareHandler = ({
        required String postId,
        required String deviceId,
      }) async =>
          const Right(2);
      return bloc;
    },
    seed: () => InsightsState.loaded(
      posts: <Post>[post],
      availableLanguages: const <String>['en'],
      selectedLanguages: const <String, bool>{'en': true},
      likedPostIds: const <String>{},
    ),
    act: (InsightsBloc bloc) => bloc.add(const InsightsEvent.shareTapped('1')),
    expect: () => <InsightsState>[
      InsightsState.loaded(
        posts: <Post>[post],
        availableLanguages: const <String>['en'],
        selectedLanguages: const <String, bool>{'en': true},
        likedPostIds: const <String>{},
        busyPostIds: const <String>{'1'},
      ),
      InsightsState.loaded(
        posts: <Post>[post.copyWith(shares: 2)],
        availableLanguages: const <String>['en'],
        selectedLanguages: const <String, bool>{'en': true},
        likedPostIds: const <String>{},
      ),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'emits error when feed load fails',
    build: () {
      repository.getAvailableLanguagesHandler =
          () async => const Left(Failure.serverError());
      return bloc;
    },
    act: (InsightsBloc bloc) => bloc.add(
      const InsightsEvent.fetchAvailableLanguagesAndPosts(),
    ),
    expect: () => <InsightsState>[
      const InsightsState.loading(),
      const InsightsState.error(
        'Server error. Please check your internet connection and try again.',
      ),
    ],
  );
}
