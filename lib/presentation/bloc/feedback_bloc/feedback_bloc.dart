import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/feedback.dart';
import 'package:icoc/core/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

@singleton
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository feedbackRepository;

  FeedbackBloc(this.feedbackRepository) : super(FeedbackInitial()) {
    on<FeedbackListRequested>(_onFeedbackListRequested);
    on<InsertFeedbackRequested>(_onInsertFeedbackRequested);
  }

  Future<void> _onFeedbackListRequested(
    FeedbackListRequested event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoadingState());
      final List<Feedback> feedbacks =
          await feedbackRepository.getFeedbackList();
      emit(GetFeedbackListSuccessState(feedbacks));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FeedbackErrorState(error.toString()));
    }
  }

  Future<void> _onInsertFeedbackRequested(
    InsertFeedbackRequested event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      final List<Feedback> feedbacks =
          await feedbackRepository.insertFeedback(event.name, event.feedback);
      emit(GetFeedbackListSuccessState(feedbacks));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FeedbackErrorState(error.toString()));
    }
  }
}
