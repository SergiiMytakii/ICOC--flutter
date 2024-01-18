part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongsListEvent {
  Stream<FavoriteSongsState> applyAsync(
      {FavoriteSongsState currentState, FavoriteSongsListBloc bloc});
}

class FavoriteSongsListRequested extends FavoriteSongsListEvent {
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();
  @override
  Stream<FavoriteSongsState> applyAsync(
      {FavoriteSongsState? currentState, FavoriteSongsListBloc? bloc}) async* {
    final log = Logger();
    List<SongDetail> favoriteSongs = [];
    try {
      yield FavoriteSongsLoadingState();
      final List<int> favoriteSongsIds =
          await songsRepositoryImpl.getFavoriteSongs();
      if (favoriteSongsIds.isNotEmpty) {
        List<SongDetail> songs = await songsRepositoryImpl.getSongs();

        favoriteSongs =
            songs.where((song) => favoriteSongsIds.contains(song.id)).toList();
        favoriteSongs = await filterSongs(favoriteSongs);
        favoriteSongs = await orderSongs(favoriteSongs);
      }
      yield GetFavoriteSongsListSuccessState(favoriteSongs);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield FavoriteSongsErrorState(_.toString());
    }
  }
}
