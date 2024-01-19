part of 'songs_bloc.dart';

@immutable
sealed class SongsEvent {
  Stream<SongsState> applyAsync({SongsState currentState, SongsBloc bloc});
}

class SongsRequested extends SongsEvent {
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();
  @override
  Stream<SongsState> applyAsync(
      {SongsState? currentState, SongsBloc? bloc}) async* {
    final log = Logger();
    try {
      yield SongsLoadingState();
      List<SongDetail> songs = await songsRepositoryImpl.getSongs();
      songsRepositoryImpl.insertAllSongsToLocalTable(songs);
      songs = await filterSongs(songs);
      songs = await orderSongs(songs);
      yield GetSongsSuccessState(songs);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield SongsErrorState(_.toString());
    }
  }
}

class SearchSongRequested extends SongsEvent {
  SearchSongRequested(this.query);
  final String query;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();
  final log = Logger();
  //trim query and delete dots, comas, ets.
  @override
  Stream<SongsState> applyAsync(
      {SongsState? currentState, SongsBloc? bloc}) async* {
    final List<String> orderLang = await SharedPreferencesHelper.getList(
            SharedPreferencesKeys.orderLanguages) ??
        [];
    //delete all specific symbols
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r"[^a-zA-Zа-яА-Яёієї0-9]+"), ' ');
    List<SongDetail> songs = [];
    try {
      yield SongsLoadingState();
      //get all songs from firebase (we will need full versions with all fields)
      final allSongs = await songsRepositoryImpl.getSongs();

      //search by number
      if (trimmedQuery.contains(RegExp(r'[0-9]'))) {
        List<SongDetail> filteredByNumber = allSongs
            .where((song) => song.id.toString() == trimmedQuery)
            .toList();
        filteredByNumber = await filterSongs(filteredByNumber);
        filteredByNumber.forEach((song) {
          song.searchText = song.text.values.first;
          song.searchTitle = song.text.values.first;
        });
        yield SearchSongsSuccessState(filteredByNumber);
      } else {
        //get results from full text search (only id, title and text)
        songs =
            await songsRepositoryImpl.getSearchResult(trimmedQuery, orderLang);

        //combine searchResults with songs
        List<SongDetail> filteredSongs = songs.map((song) {
          // Find the matching song in allSongs based on id
          SongDetail? matchingSong = allSongs.firstWhere(
            (element) => element.id == song.id,
            orElse: () => SongDetail.defaultSong(),
          );
          // Create a new instance of SongDetail with updated values
          return SongDetail(
            id: matchingSong.id,
            description: matchingSong.description,
            title: matchingSong.title,
            text: matchingSong.text,
            chords: matchingSong.chords,
            resources: matchingSong.resources,
            searchTitle: song.searchTitle,
            searchLang: song.searchLang,
            searchText: song.searchText,
          );
        }).toList();

        yield SearchSongsSuccessState(filteredSongs);
      }
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield SongsErrorState(_.toString());
    }
  }
}

Future<List<SongDetail>> filterSongs(List<SongDetail> songs) async {
  //keys represent languages
  //suppose all languages of songs are list of keys if titles
  List<String> allTitleKeys = findAllTitleKeys(songs);
  SharedPreferencesHelper.saveList(
      SharedPreferencesKeys.allSongsTitleKeys, allTitleKeys);

  //save all keys of text (ru1, ru2, en1 ets..).  We will need them to store data in SQL table
  List<String> allTextKeys = findAllTextKeys(songs);
  SharedPreferencesHelper.saveList(
      SharedPreferencesKeys.allSongsTextKeys, allTextKeys);
  // SharedPreferencesHelper.removeValue('orderLanguages');

  //orderLanguages store languages what user has chosen to show and their order
  final List<String> orderLanguages = await SharedPreferencesHelper.getList(
          SharedPreferencesKeys.orderLanguages) ??
      [];
  if (orderLanguages
      .isEmpty) //if this a first run we not filter and save all languages to the sharedPrefs
  {
    SharedPreferencesHelper.saveList(
        SharedPreferencesKeys.orderLanguages, allTitleKeys);
    return songs;
  }
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

List<String> findAllTitleKeys(List<SongDetail> songs) {
  Set<String> allTitleKeys = {};
  songs.forEach((song) => allTitleKeys.addAll(song.getAllTitleKeys()));
  return allTitleKeys.toList();
}

List<String> findAllTextKeys(List<SongDetail> songs) {
  Set<String> allTitleKeys = {};
  songs.forEach((song) => allTitleKeys.addAll(song.getAllTextKeys()));
  return allTitleKeys.toList();
}
