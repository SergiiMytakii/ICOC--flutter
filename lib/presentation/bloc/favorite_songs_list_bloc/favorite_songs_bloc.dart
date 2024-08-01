import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:icoc/core/model/song_detail.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';
part 'favorite_songs_bloc.freezed.dart';

@singleton
class FavoriteSongsListBloc
    extends Bloc<FavoriteSongsEvent, FavoriteSongsState> {
  final SongsRepository songsRepositoryImpl;

  FavoriteSongsListBloc(this.songsRepositoryImpl)
      : super(const FavoriteSongsState.initial()) {
    on<FavoriteSongsEvent>((event, emit) async {
      await event.map(
        getRequested: (event) => _onFavoriteSongsListRequested(event, emit),
      );
    });
  }

  Future<void> _onFavoriteSongsListRequested(
    FavoriteSongsListRequested event,
    Emitter<FavoriteSongsState> emit,
  ) async {
    emit(const FavoriteSongsState.loading());

    try {
      final List<int> favoriteSongsIds =
          await songsRepositoryImpl.getFavoriteSongs();
      if (favoriteSongsIds.isNotEmpty) {
        final List<SongModel> songs = await songsRepositoryImpl.getSongs();
        final favoriteSongs =
            songs.where((song) => favoriteSongsIds.contains(song.id)).toList();
        final filteredSongs = await filterSongsByLang(favoriteSongs);
        final orderedSongs = await orderSongs(filteredSongs);
        emit(FavoriteSongsState.success(orderedSongs));
      } else {
        emit(const FavoriteSongsState.success([]));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongsState.error(error.toString()));
    }
  }
}
