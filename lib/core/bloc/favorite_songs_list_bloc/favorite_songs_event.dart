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
  //keys represent languages
  //suppose all languages of songs are list of keys if titles
  List<String> allTitleKeys = await SharedPreferencesHelper.getList(
          SharedPreferencesKeys.allSongsTitleKeys) ??
      [];

  //orderLanguages store languages what user has chosen to show and their order
  final List<String> orderLanguages = await SharedPreferencesHelper.getList(
          SharedPreferencesKeys.orderLanguages) ??
      [];

  //remove languages what user does not want to show
  List<String> keysToRemove = Set<String>.from(allTitleKeys)
      .difference(Set<String>.from(orderLanguages))
      .toList();

  songs.map((song) => song.removeKeys(keysToRemove)).toList();
  List<SongDetail> filteredSongs = songs
      .where((song) => song.title.isNotEmpty && song.text.isNotEmpty)
      .toList();
  //put in first place preffered user language
  if (orderLanguages.length > 1) {
    List<SongDetail> orderdedSongs = filteredSongs
        .map((song) => song.orderByLanguage(orderLanguages))
        .toList();
    return orderdedSongs;
  }
  return filteredSongs;
}
