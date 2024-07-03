part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class FeedbackListRequested extends FeedbackEvent {}

class InsertFeedbackRequested extends FeedbackEvent {
  final String feedback;
  final String name;

  InsertFeedbackRequested(this.feedback, this.name);
}
