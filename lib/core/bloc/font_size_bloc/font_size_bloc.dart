import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../helpers/shared_preferences_helper.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(FontSizeInitial()) {
    on<FontSizeEvent>((event, emit) {
      return emit.forEach<FontSizeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return FontSizeErrorState(error.toString());
        },
      );
    });
  }
}
