part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackLoadingState extends FeedbackState {}

final class GetFeedbackListSuccessState extends FeedbackState {
  final List<Feedback> feedbacks;

  GetFeedbackListSuccessState(this.feedbacks);
}

final class GetFeedbacksFromPlaylistSuccessState extends FeedbackState {
  final List<Resources> resources;

  GetFeedbacksFromPlaylistSuccessState(this.resources);
}

final class FeedbackErrorState extends FeedbackState {
  final String message;

  FeedbackErrorState(this.message);
}
