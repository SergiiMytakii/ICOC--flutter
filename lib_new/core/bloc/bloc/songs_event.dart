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

  Future<List<SongDetail>> filterSongs(List<SongDetail> songs) async {
    //keys represent languages
    List<String> allKeys = findAllKeys(songs);
    // SharedPreferencesHelper.removeValue('orderLanguages');
    final List<String> orderLanguages =
        await SharedPreferencesHelper.getList('orderLanguages') ?? [];
    if (orderLanguages
        .isEmpty) //if this a first run we not filter and save all languages to the sharedPrefs
    {
      SharedPreferencesHelper.saveList('allLanguages', allKeys);
      SharedPreferencesHelper.saveList('orderLanguages', allKeys);
      return songs;
    }

    List<String> keysToRemove = Set<String>.from(allKeys)
        .difference(Set<String>.from(orderLanguages))
        .toList();

    songs.map((song) => song.removeKeys(keysToRemove)).toList();
    List<SongDetail> filteredSongs = songs
        .where((song) => song.title.isNotEmpty && song.text.isNotEmpty)
        .toList();

    if (orderLanguages.length > 1) {
      List<SongDetail> orderdedSongs = filteredSongs
          .map((song) => song.orderByLanguage(orderLanguages))
          .toList();
      return orderdedSongs;
    }
    return filteredSongs;
  }
}

Future<List<SongDetail>> orderSongs(List<SongDetail> songs) async {
  final bool orderByTitle =
      await SharedPreferencesHelper.getBool('orderByTitle') ?? false;
  if (orderByTitle) {
    songs.sort((a, b) {
      final String a1 = a.title.entries.first.value;
      final String b1 = b.title.entries.first.value;
      if (a1.toLowerCase().startsWith('і') &&
          !b1.toLowerCase().startsWith('і')) {
        //todo trying to handle ukranian i... needs to be improved
        return 1;
      } else if (!a1.toLowerCase().startsWith('і') &&
          b1.toLowerCase().startsWith('і')) {
        return -1;
      } else {
        return a1.compareTo(b1);
      }
    });
  } else
    songs.sort((a, b) => a.id.compareTo(b.id));

  return songs;
}

List<String> findAllKeys(List<SongDetail> songs) {
  Set<String> allKeys = {};
  songs.forEach((song) => allKeys.addAll(song.getAllKeys()));
  return allKeys.toList();
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
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r"[^a-zA-Zа-яА-Яёієї0-9]+"), ' ');
    List<SongDetail> songs = [];
    try {
      yield SongsLoadingState();
      if (trimmedQuery == '') {
        songs = await songsRepositoryImpl.getListSongs();
      } else {
        if (trimmedQuery.contains(RegExp(r'[0-9]'))) {
          songs =
              await songsRepositoryImpl.getSearchResultByNumber(trimmedQuery);
        } else
          songs = await songsRepositoryImpl.getSearchResult(trimmedQuery);
      }

      yield SearchSongsSuccessState(songs);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield SongsErrorState(_.toString());
    }
  }
}
