import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';

@injectable
class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  InsightsBloc(
    this._insightsRepository,
    this._userLanguagesHandler,
    this._localStore,
  ) : super(const InsightsState.initial()) {
    on<InsightsEvent>((InsightsEvent event, Emitter<InsightsState> emit) async {
      await event.when(
        fetchAvailableLanguagesAndPosts: () =>
            _onFetchAvailableLanguagesAndPosts(emit),
        languagesChanged: (Map<String, bool> selectedLanguages) =>
            _onLanguagesChanged(selectedLanguages, emit),
        toggleLike: (String postId) => _onToggleLike(postId, emit),
        shareTapped: (String postId) => _onShareTapped(postId, emit),
        refreshSinglePost: (String postId) =>
            _onRefreshSinglePost(postId, emit),
      );
    });
  }

  final InsightsRepository _insightsRepository;
  final InsightsUserLanguagesHandler _userLanguagesHandler;
  final InsightsInteractionLocalStore _localStore;

  Future<void> _onFetchAvailableLanguagesAndPosts(
    Emitter<InsightsState> emit,
  ) async {
    emit(const InsightsState.loading());

    final availableLanguagesResult =
        await _insightsRepository.getAvailableLanguages();
    await availableLanguagesResult.fold(
      (failure) async {
        emit(InsightsState.error(failure.toUserFriendlyMessage()));
      },
      (List<String> availableLanguages) async {
        final Map<String, dynamic> initializedMap = await _userLanguagesHandler
            .initializeFromAvailableLanguages(availableLanguages);
        final Set<String> activeLanguages = initializedMap.entries
            .where((MapEntry<String, dynamic> entry) => entry.value == true)
            .map((MapEntry<String, dynamic> entry) => entry.key)
            .toSet();

        final postsResult =
            await _insightsRepository.getPosts(languages: activeLanguages);
        await postsResult.fold(
          (failure) async =>
              emit(InsightsState.error(failure.toUserFriendlyMessage())),
          (List<Post> posts) async {
            final String deviceId = _localStore.getOrCreateDeviceId();
            final likedRemote = await _insightsRepository.getLikedPosts(
              deviceId: deviceId,
            );

            Set<String> likedIds = _localStore.getLikedPostIds();
            likedRemote.fold(
              (_) {},
              (remoteIds) {
                likedIds = remoteIds.toSet();
              },
            );
            await _localStore.setLikedPostIds(likedIds);

            emit(
              InsightsState.loaded(
                posts: posts,
                availableLanguages: availableLanguages,
                selectedLanguages: <String, bool>{
                  for (final MapEntry<String, dynamic> entry
                      in initializedMap.entries)
                    entry.key: entry.value == true,
                },
                likedPostIds: likedIds,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onLanguagesChanged(
    Map<String, bool> selectedLanguages,
    Emitter<InsightsState> emit,
  ) async {
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    if (loadedState == null) {
      add(const InsightsEvent.fetchAvailableLanguagesAndPosts());
      return;
    }

    final Map<String, bool> nextSelected = Map<String, bool>.from(
      selectedLanguages,
    );
    if (nextSelected.isNotEmpty &&
        !nextSelected.values.any((bool value) => value)) {
      nextSelected[nextSelected.keys.first] = true;
    }

    await _userLanguagesHandler.saveAllLanguages(nextSelected);
    await Future.delayed(Duration.zero);
    emit(loadedState.copyWith(
        selectedLanguages: nextSelected, actionMessage: null));

    final postsResult = await _insightsRepository.getPosts(
      languages: nextSelected.entries
          .where((MapEntry<String, bool> entry) => entry.value)
          .map((MapEntry<String, bool> entry) => entry.key)
          .toSet(),
    );

    postsResult.fold(
      (failure) => emit(
        InsightsState.error(failure.toUserFriendlyMessage()),
      ),
      (List<Post> posts) => emit(
        loadedState.copyWith(
          posts: posts,
          selectedLanguages: nextSelected,
          actionMessage: null,
        ),
      ),
    );
  }

  Future<void> _onToggleLike(
    String postId,
    Emitter<InsightsState> emit,
  ) async {
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    if (loadedState == null || loadedState.busyPostIds.contains(postId)) {
      return;
    }

    final Set<String> busy = Set<String>.from(loadedState.busyPostIds)
      ..add(postId);
    emit(loadedState.copyWith(busyPostIds: busy, actionMessage: null));

    final result = await _insightsRepository.toggleLike(
      postId: postId,
      deviceId: _localStore.getOrCreateDeviceId(),
    );

    await result.fold(
      (failure) async {
        final currentState = state.maybeMap(
          loaded: (value) => value,
          orElse: () => null,
        );
        if (currentState == null) return;
        final Set<String> nextBusy = Set<String>.from(currentState.busyPostIds)
          ..remove(postId);
        emit(
          currentState.copyWith(
            busyPostIds: nextBusy,
            actionMessage: failure.toUserFriendlyMessage(),
          ),
        );
      },
      (likeResult) async {
        await _localStore.setLikedPostState(postId, likeResult.liked);
        final currentState = state.maybeMap(
          loaded: (value) => value,
          orElse: () => null,
        );
        if (currentState == null) return;
        final Set<String> nextBusy = Set<String>.from(currentState.busyPostIds)
          ..remove(postId);
        final Set<String> likedPostIds =
            Set<String>.from(currentState.likedPostIds);
        if (likeResult.liked) {
          likedPostIds.add(postId);
        } else {
          likedPostIds.remove(postId);
        }

        emit(
          currentState.copyWith(
            posts: currentState.posts.map((Post post) {
              if (post.id != postId) {
                return post;
              }
              return post.copyWith(likes: likeResult.likes);
            }).toList(),
            likedPostIds: likedPostIds,
            busyPostIds: nextBusy,
            actionMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _onShareTapped(
    String postId,
    Emitter<InsightsState> emit,
  ) async {
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    if (loadedState == null || loadedState.busyPostIds.contains(postId)) {
      return;
    }

    final Set<String> busy = Set<String>.from(loadedState.busyPostIds)
      ..add(postId);
    emit(loadedState.copyWith(busyPostIds: busy, actionMessage: null));

    final result = await _insightsRepository.incrementShare(
      postId: postId,
      deviceId: _localStore.getOrCreateDeviceId(),
    );

    result.fold(
      (failure) {
        final currentState = state.maybeMap(
          loaded: (value) => value,
          orElse: () => null,
        );
        if (currentState == null) return;
        final Set<String> nextBusy = Set<String>.from(currentState.busyPostIds)
          ..remove(postId);
        emit(
          currentState.copyWith(
            busyPostIds: nextBusy,
            actionMessage: failure.toUserFriendlyMessage(),
          ),
        );
      },
      (int shares) {
        final currentState = state.maybeMap(
          loaded: (value) => value,
          orElse: () => null,
        );
        if (currentState == null) return;
        final Set<String> nextBusy = Set<String>.from(currentState.busyPostIds)
          ..remove(postId);
        emit(
          currentState.copyWith(
            posts: currentState.posts.map((Post post) {
              if (post.id != postId) {
                return post;
              }
              return post.copyWith(shares: shares);
            }).toList(),
            busyPostIds: nextBusy,
            actionMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshSinglePost(
    String postId,
    Emitter<InsightsState> emit,
  ) async {
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    if (loadedState == null) {
      return;
    }

    final result = await _insightsRepository.getPostById(postId);
    result.fold(
      (_) {},
      (Post? post) {
        final currentState = state.maybeMap(
          loaded: (value) => value,
          orElse: () => null,
        );
        if (currentState == null || post == null) {
          return;
        }
        final List<Post> nextPosts = List<Post>.from(currentState.posts);
        final int index =
            nextPosts.indexWhere((Post item) => item.id == postId);
        if (index >= 0) {
          nextPosts[index] = post;
        } else {
          nextPosts.insert(0, post);
        }
        emit(
          currentState.copyWith(
            posts: nextPosts,
            actionMessage: null,
          ),
        );
      },
    );
  }
}
