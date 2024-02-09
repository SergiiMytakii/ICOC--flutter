part of 'songs_bloc.dart';

@immutable
sealed class SongsEvent {
  Stream<SongsState> applyAsync({SongsState currentState, SongsBloc bloc});
}

bool sqliteBDisUpdated = false;
List<SongDetail>? cache;

class SongsRequested extends SongsEvent {
  SongsRequested({this.useCache = true});
  final bool? useCache;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();

  @override
  Stream<SongsState> applyAsync(
      {SongsState? currentState, SongsBloc? bloc}) async* {
    List<SongDetail> songs = [];
    try {
      yield SongsLoadingState();
      if (cache == null || useCache == false) {
        songs = await songsRepositoryImpl.getSongs();
        await updateStoredLanguages(songs);
        cache = songs;
      } else {
        songs = cache!;
      }
      if (!sqliteBDisUpdated) {
        //save all keys of text (ru1, ru2, en1 ets..).  We need them to store data in SQL table
        findAndSaveAllTextKeys(songs);
        await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
        sqliteBDisUpdated = true;
      }
      final filteredSongs = await filterSongsByLang(songs);
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
    //delete all specific symbols
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r"[^a-zA-Zа-яА-Яёієї0-9]+"), ' ');
    List<SongDetail> searchResult = [];
    try {
      yield SongsLoadingState();
      //get all songs from firebase (we will need full versions with all fields)
      final allSongs = cache ?? await songsRepositoryImpl.getSongs();
      //search by number
      //just simple filtering
      if (trimmedQuery.contains(RegExp(r'[0-9]'))) {
        List<SongDetail> filteredByNumber =
            await _searchByNumber(allSongs, trimmedQuery);
        yield SearchSongsSuccessState(filteredByNumber);
      } else {
        List<SongDetail> filteredSongs =
            await _searchByText(searchResult, trimmedQuery, allSongs);
        yield SearchSongsSuccessState(filteredSongs);
      }
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield SongsErrorState(_.toString());
    }
  }

  Future<List<SongDetail>> _searchByNumber(
      List<SongDetail> allSongs, String trimmedQuery) async {
    List<SongDetail> filteredByNumber =
        allSongs.where((song) => song.id.toString() == trimmedQuery).toList();
    filteredByNumber = await filterSongsByLang(filteredByNumber);
    filteredByNumber.forEach((song) {
      song.searchText = song.text.values.first;
      song.searchTitle = song.title.values.first;
    });
    return filteredByNumber;
  }

  Future<List<SongDetail>> _searchByText(List<SongDetail> searchResult,
      String trimmedQuery, List<SongDetail> allSongs) async {
    List<String> orderLang = _getListOrderLangs();
    //get results from full text search (only id, title and text)
    searchResult =
        await songsRepositoryImpl.getSearchResult(trimmedQuery, orderLang);

    //combine searchResults with songs
    final List<SongDetail> songs = searchResult.map((song) {
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
    final List<SongDetail> filteredSongs = await filterSongsByLang(songs);
    return filteredSongs;
  }

  List<String> _getListOrderLangs() {
    //convert map to a list with langs to show
    final allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};
    final filtered =
        allLanguages.entries.where((element) => element.value == true);
    final List<String> orderLang = filtered.map((e) => e.key).toList();
    return orderLang;
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

  songs.forEach((song) {
    //chek if some keys in text are corrupted i.e. without number in the end (we meed it for search)
    final keys = song.title.keys;
    keys.forEach((key) {
      if (key.toString().length > 2) {
        Logger().e("Wrong key in title, songId ${song.id}");
        FirebaseAnalytics.instance
            .logEvent(name: "Wrong key in title, songId ${song.id}");
      }
    });
    allTitleKeys.addAll(song.getAllTitleKeys());
  });
  return allTitleKeys.toList();
}
