import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'bible_study_event.dart';
part 'bible_study_state.dart';

class BibleStudyBloc extends Bloc<BibleStudyEvent, BibleStudyState> {
  BibleStudyBloc() : super(BibleStudyInitial()) {
    final log = Logger();

    on<BibleStudyEvent>((event, emit) {
      return emit.forEach<BibleStudyState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return BibleStudyErrorState(error.toString());
        },
      );
    });
  }
}
