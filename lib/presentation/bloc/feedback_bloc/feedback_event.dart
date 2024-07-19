part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.listRequested() = FeedbackListRequested;
  const factory FeedbackEvent.insertRequested({
    required String feedback,
    required String name,
  }) = InsertFeedbackRequested;
}
