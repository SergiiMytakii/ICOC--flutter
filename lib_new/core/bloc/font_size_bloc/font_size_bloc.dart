import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../helpers/shared_preferences_helper.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(FontSizeInitial()) {
    final log = Logger();
    on<FontSizeEvent>((event, emit) {
      return emit.forEach<FontSizeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return FontSizeErrorState(error.toString());
        },
      );
    });
  }
}
