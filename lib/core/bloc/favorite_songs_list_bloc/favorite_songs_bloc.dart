import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

import 'package:icoc/data/repository_impl/songs_repository_impl.dart';
import 'package:meta/meta.dart';

import '../../model/song_detail.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';

class FavoriteSongsListBloc
    extends Bloc<FavoriteSongsListEvent, FavoriteSongsState> {
  FavoriteSongsListBloc() : super(FavoriteSongsInitial()) {
    on<FavoriteSongsListEvent>((event, emit) {
      return emit.forEach<FavoriteSongsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return FavoriteSongsErrorState(error.toString());
        },
      );
    });
  }
}
