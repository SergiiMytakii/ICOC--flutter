part of 'songs_bloc.dart';

@immutable
sealed class SongsEvent {
  Stream<SongsState> applyAsync({SongsState currentState, SongsBloc bloc});
}

bool sqliteBDisUpdated = false;
List<SongDetail> cache = [];

class SongsRequested extends SongsEvent {
  final bool? useCache;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();

  SongsRequested({this.useCache = false});
  @override
  Stream<SongsState> applyAsync(
      {SongsState? currentState, SongsBloc? bloc}) async* {
    List<SongDetail> songs = [];
    try {
      yield SongsLoadingState();
      if (cache.isEmpty || useCache == true) {
        songs = await songsRepositoryImpl.getSongs();
        await updateStoredLanguages(songs);
        cache = songs;
      } else {
        songs = cache;
      }
      if (!sqliteBDisUpdated) {
        //save all keys of text (ru1, ru2, en1 ets..).  We need them to store data in SQL table
        List<String> allTextKeys = findAllTextKeys(songs);
        await SharedPreferencesHelper.saveList(
            StorageKeys.allSongsTextKeys, allTextKeys);
        await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
        sqliteBDisUpdated = true;
      }
      final filteredSongs = await filterSongs(songs);
      final orderedSongs = await orderSongs(filteredSongs);
      yield GetSongsSuccessState(orderedSongs);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield SongsErrorState(_.toString());
    }
  }
}

class SearchSongRequested extends SongsEvent {
  SearchSongRequested(this.query);
  final String query;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();
  //trim query and delete dots, comas, ets.
  @override
  Stream<SongsState> applyAsync(
      {SongsState? currentState, SongsBloc? bloc}) async* {
    final allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};
    final Map<String, dynamic> map = Map.from(allLanguages);
    map.removeWhere((key, value) => value == false);

    final List<String> orderLang = map.keys.toList();
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
          song.searchTitle = song.title.values.first;
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
      logError(_, stackTrace);
      yield SongsErrorState(_.toString());
    }
  }
}

Future<void> updateStoredLanguages(List<SongDetail> songs) async {
  List<String> allTitleKeys = findAllTitleKeys(songs);
  //get stored all languages (ordered)
  final Map<String, dynamic> orderedAllLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};

  //iterate languages from Firebase songs and add them to the Map
  allTitleKeys.forEach((String lang) {
    if (!orderedAllLanguages.containsKey(lang)) {
      print('insert $lang');
      orderedAllLanguages[lang] = true;
    }
  });
  await SharedPreferencesHelper.saveMap(
      StorageKeys.allSongsLanguages, orderedAllLanguages);
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
