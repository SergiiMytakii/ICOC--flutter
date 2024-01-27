import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../data/repository_impl/songs_repository_impl.dart';
import '../../helpers/shared_preferences_helper.dart';
import '../../model/song_detail.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc() : super(SongsInitial()) {
    on<SongsEvent>((event, emit) {
      return emit.forEach<SongsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return SongsErrorState(error.toString());
        },
      );
    });
  }
}
