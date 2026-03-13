import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_event.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_state.dart';

@injectable
class InsightsCommentsBloc
    extends Bloc<InsightsCommentsEvent, InsightsCommentsState> {
  InsightsCommentsBloc(this._repository, this._localStore)
      : super(const InsightsCommentsState.initial()) {
    on<InsightsCommentsEvent>(
      (InsightsCommentsEvent event, Emitter<InsightsCommentsState> emit) async {
        await event.when(
          fetch: (String postId) => _onFetch(postId, emit),
          refresh: (String postId) => _onRefresh(postId, emit),
          submit: (String postId, String text, String displayName) => _onSubmit(
            postId: postId,
            text: text,
            displayName: displayName,
            emit: emit,
          ),
        );
      },
    );
  }

  final InsightsRepository _repository;
  final InsightsInteractionLocalStore _localStore;

  Future<void> _onFetch(
    String postId,
    Emitter<InsightsCommentsState> emit,
  ) async {
    emit(const InsightsCommentsState.loading());
    final result = await _repository.getComments(postId: postId);
    result.fold(
      (failure) =>
          emit(InsightsCommentsState.error(failure.toUserFriendlyMessage())),
      (List<InsightComment> comments) => emit(
        InsightsCommentsState.loaded(
          postId: postId,
          comments: comments,
        ),
      ),
    );
  }

  Future<void> _onRefresh(
    String postId,
    Emitter<InsightsCommentsState> emit,
  ) async {
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    final result = await _repository.getComments(postId: postId);
    result.fold(
      (failure) {
        if (loadedState != null) {
          emit(loadedState.copyWith(
              actionMessage: failure.toUserFriendlyMessage()));
        } else {
          emit(InsightsCommentsState.error(failure.toUserFriendlyMessage()));
        }
      },
      (List<InsightComment> comments) {
        emit(
          InsightsCommentsState.loaded(
            postId: postId,
            comments: comments,
          ),
        );
      },
    );
  }

  Future<void> _onSubmit({
    required String postId,
    required String text,
    required String displayName,
    required Emitter<InsightsCommentsState> emit,
  }) async {
    final String trimmedText = text.trim();
    final String trimmedDisplayName = displayName.trim();
    final loadedState = state.maybeMap(
      loaded: (value) => value,
      orElse: () => null,
    );
    if (loadedState == null) {
      return;
    }

    if (trimmedDisplayName.isEmpty) {
      emit(loadedState.copyWith(actionMessage: 'Enter your name'));
      return;
    }
    if (trimmedText.isEmpty) {
      emit(loadedState.copyWith(actionMessage: 'Comment cannot be empty'));
      return;
    }

    emit(
      loadedState.copyWith(
        isSubmitting: true,
        actionMessage: null,
        lastSubmittedCommentId: null,
      ),
    );

    final result = await _repository.addComment(
      postId: postId,
      deviceId: _localStore.getOrCreateDeviceId(),
      displayName: trimmedDisplayName,
      text: trimmedText,
    );

    await result.fold(
      (failure) async {
        emit(
          loadedState.copyWith(
            isSubmitting: false,
            actionMessage: failure.toUserFriendlyMessage(),
            lastSubmittedCommentId: null,
          ),
        );
      },
      (InsightCommentSubmissionResult submissionResult) async {
        await _localStore.saveDisplayName(trimmedDisplayName);
        emit(
          loadedState.copyWith(
            comments: <InsightComment>[
              submissionResult.comment,
              ...loadedState.comments,
            ],
            isSubmitting: false,
            actionMessage: null,
            lastSubmittedCommentId: submissionResult.comment.id,
          ),
        );
      },
    );
  }
}
