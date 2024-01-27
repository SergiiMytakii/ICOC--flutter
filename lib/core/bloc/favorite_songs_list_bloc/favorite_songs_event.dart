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
    List<SongDetail> favoriteSongs = [];
    try {
      yield FavoriteSongsLoadingState();
      final List<int> favoriteSongsIds =
          await songsRepositoryImpl.getFavoriteSongs();
      if (favoriteSongsIds.isNotEmpty) {
        List<SongDetail> songs = await songsRepositoryImpl.getSongs();

        favoriteSongs =
            songs.where((song) => favoriteSongsIds.contains(song.id)).toList();
        favoriteSongs = await filterFavoriteSongs(favoriteSongs);
        favoriteSongs = await orderSongs(favoriteSongs);
      }
      yield GetFavoriteSongsListSuccessState(favoriteSongs);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield FavoriteSongsErrorState(_.toString());
    }
  }
}

Future<List<SongDetail>> filterFavoriteSongs(List<SongDetail> songs) async {
  //orderLanguages store languages what user has chosen to show and their order
  final List<String> orderLanguages =
      await SharedPreferencesHelper.getList(StorageKeys.orderLanguages) ?? [];
  List<SongDetail> filteredAndOrderedSongs = songs
      .map((song) => song.filterAndOrderLanguages(orderLanguages))
      .toList();
  final result = filteredAndOrderedSongs
      .where((song) => song.title.isNotEmpty && song.text.isNotEmpty)
      .toList();
  return result;
}
