import 'package:bloc/bloc.dart';
import 'package:icoc/domain/model/feedback/feedback_model.dart';
import 'package:icoc/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

@singleton
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository feedbackRepository;

  FeedbackBloc(this.feedbackRepository) : super(const FeedbackState.initial()) {
    on<FeedbackEvent>((event, emit) async {
      await event.when(
        listRequested: () => _onFeedbackListRequested(emit),
        insertRequested: (feedback, name) =>
            _onInsertFeedbackRequested(feedback, name, emit),
      );
    });
  }

  Future<void> _onFeedbackListRequested(Emitter<FeedbackState> emit) async {
    emit(const FeedbackState.loading());
    final result = await feedbackRepository.getFeedbackList();
    return result.fold(
      (failure) => emit(FeedbackState.error(failure.toUserFriendlyMessage())),
      (feedbacks) => emit(FeedbackState.getFeedbackListSuccess(feedbacks)),
    );
  }

  Future<void> _onInsertFeedbackRequested(
      String feedback, String name, Emitter<FeedbackState> emit) async {
    final result = await feedbackRepository.insertFeedback(name, feedback);
    return result.fold(
      (failure) => emit(FeedbackState.error(failure.toUserFriendlyMessage())),
      (feedbacks) => emit(FeedbackState.getFeedbackListSuccess(feedbacks)),
    );
  }
}
