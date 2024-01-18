import 'package:bloc/bloc.dart';

import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../data/repository_impl/songs_repository_impl.dart';
import '../../helpers/shared_preferences_helper.dart';
import '../../model/song_detail.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc() : super(SongsInitial()) {
    final log = Logger();
    on<SongsEvent>((event, emit) {
      return emit.forEach<SongsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return SongsErrorState(error.toString());
        },
      );
    });
  }
}
