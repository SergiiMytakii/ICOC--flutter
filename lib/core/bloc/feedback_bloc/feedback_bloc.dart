import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/feedback.dart';
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<FeedbackEvent>((event, emit) {
      return emit.forEach<FeedbackState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return FeedbackErrorState(error.toString());
        },
      );
    });
  }
}
