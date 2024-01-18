import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:icoc/data/repository_impl/songs_repository_impl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';

class FavoriteSongStatusBloc
    extends Bloc<FavoriteSongStatusEvent, FavoriteSongStatusState> {
  FavoriteSongStatusBloc() : super(FavoriteSongStatusInitial()) {
    final log = Logger();
    on<FavoriteSongStatusEvent>((event, emit) {
      return emit.forEach<FavoriteSongStatusState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return FavoriteSongStatusErrorState(error.toString());
        },
      );
    });
  }
}
