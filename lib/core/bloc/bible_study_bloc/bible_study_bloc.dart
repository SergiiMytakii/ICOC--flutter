import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart';
import 'package:meta/meta.dart';

part 'bible_study_event.dart';
part 'bible_study_state.dart';

class BibleStudyBloc extends Bloc<BibleStudyEvent, BibleStudyState> {
  BibleStudyBloc() : super(BibleStudyInitial()) {
    on<BibleStudyEvent>((event, emit) {
      return emit.forEach<BibleStudyState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return BibleStudyErrorState(error.toString());
        },
      );
    });
  }
}
