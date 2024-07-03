import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:icoc/core/model/song_detail.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';

@singleton
class FavoriteSongsListBloc
    extends Bloc<FavoriteSongsListEvent, FavoriteSongsState> {
  final SongsRepository songsRepositoryImpl;

  FavoriteSongsListBloc(this.songsRepositoryImpl)
      : super(FavoriteSongsInitial()) {
    on<FavoriteSongsListRequested>(_onFavoriteSongsListRequested);
  }

  Future<void> _onFavoriteSongsListRequested(
    FavoriteSongsListRequested event,
    Emitter<FavoriteSongsState> emit,
  ) async {
    emit(FavoriteSongsLoadingState());
    try {
      final List<int> favoriteSongsIds =
          await songsRepositoryImpl.getFavoriteSongs();
      if (favoriteSongsIds.isNotEmpty) {
        final List<SongDetail> songs = await songsRepositoryImpl.getSongs();
        final favoriteSongs =
            songs.where((song) => favoriteSongsIds.contains(song.id)).toList();
        final filteredSongs = await filterSongsByLang(favoriteSongs);
        final orderedSongs = await orderSongs(filteredSongs);
        emit(GetFavoriteSongsListSuccessState(orderedSongs));
      } else {
        emit(GetFavoriteSongsListSuccessState([]));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongsErrorState(error.toString()));
    }
  }
}
