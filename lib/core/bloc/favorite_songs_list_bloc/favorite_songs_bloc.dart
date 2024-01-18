import 'package:bloc/bloc.dart';
import 'package:icoc/core/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/data/repository_impl/songs_repository_impl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../model/song_detail.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';

class FavoriteSongsListBloc
    extends Bloc<FavoriteSongsListEvent, FavoriteSongsState> {
  FavoriteSongsListBloc() : super(FavoriteSongsInitial()) {
    final log = Logger();
    on<FavoriteSongsListEvent>((event, emit) {
      return emit.forEach<FavoriteSongsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return FavoriteSongsErrorState(error.toString());
        },
      );
    });
  }
}
