import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/feedback.dart';
import 'package:icoc/core/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

@singleton
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository feedbackRepository;

  FeedbackBloc(this.feedbackRepository) : super(const FeedbackState.initial()) {
    on<FeedbackEvent>((event, emit) {
      event.when(
        listRequested: () => _onFeedbackListRequested(emit),
        insertRequested: (feedback, name) =>
            _onInsertFeedbackRequested(feedback, name, emit),
      );
    });
  }

  Future<void> _onFeedbackListRequested(Emitter<FeedbackState> emit) async {
    try {
      emit(const FeedbackState.loading());
      final List<Feedback> feedbacks =
          await feedbackRepository.getFeedbackList();
      emit(FeedbackState.getFeedbackListSuccess(feedbacks));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FeedbackState.error(error.toString()));
    }
  }

  Future<void> _onInsertFeedbackRequested(
      String feedback, String name, Emitter<FeedbackState> emit) async {
    try {
      final List<Feedback> feedbacks =
          await feedbackRepository.insertFeedback(name, feedback);
      emit(FeedbackState.getFeedbackListSuccess(feedbacks));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FeedbackState.error(error.toString()));
    }
  }
}
