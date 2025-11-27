part of 'feedback_bloc.dart';

@freezed
class FeedbackState with _$FeedbackState {
  const factory FeedbackState.initial() = FeedbackInitial;
  const factory FeedbackState.loading() = FeedbackLoadingState;
  const factory FeedbackState.getFeedbackListSuccess(
      List<FeedbackModel> feedbacks) = GetFeedbackListSuccessState;
  const factory FeedbackState.error(String message) = FeedbackErrorState;
}
