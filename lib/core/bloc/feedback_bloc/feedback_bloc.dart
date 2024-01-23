import 'package:bloc/bloc.dart';
import 'package:icoc/core/model/feedback.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    final log = Logger();

    on<FeedbackEvent>((event, emit) {
      return emit.forEach<FeedbackState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return FeedbackErrorState(error.toString());
        },
      );
    });
  }
}
