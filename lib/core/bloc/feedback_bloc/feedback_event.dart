part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {
  Stream<FeedbackState> applyAsync(
      {FeedbackState currentState, FeedbackBloc bloc});
}

class FeedbackListRequested extends FeedbackEvent {
  final FeedbackRepositoryImpl feedbackRepositoryImpl =
      FeedbackRepositoryImpl();
  @override
  Stream<FeedbackState> applyAsync(
      {FeedbackState? currentState, FeedbackBloc? bloc}) async* {
    try {
      yield FeedbackLoadingState();
      final List<Feedback> feedbacks =
          await feedbackRepositoryImpl.getFeedbackList();
      // we need all languages  for filtering

      yield GetFeedbackListSuccessState(feedbacks);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield FeedbackErrorState(_.toString());
    }
  }
}

class InsertFeedbackRequested extends FeedbackEvent {
  final String feedback;
  final String name;
  final FeedbackRepositoryImpl feedbackRepositoryImpl =
      FeedbackRepositoryImpl();

  InsertFeedbackRequested(this.feedback, this.name);
  @override
  Stream<FeedbackState> applyAsync(
      {FeedbackState? currentState, FeedbackBloc? bloc}) async* {
    try {
      final List<Feedback> feedbacks =
          await feedbackRepositoryImpl.insertFeedback(name, feedback);
      // we need all languages  for filtering

      yield GetFeedbackListSuccessState(feedbacks);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield FeedbackErrorState(_.toString());
    }
  }
}
