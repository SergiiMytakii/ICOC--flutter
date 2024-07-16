import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/find_save_all_text_keys.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/helpers/set_device_lang_as_primary.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'songs_event.dart';
part 'songs_state.dart';

@singleton
class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc(this.songsRepositoryImpl) : super(SongsInitial()) {
    on<SongsRequested>(_onSongsRequested);
    on<SearchSongRequested>(_onSearchSongRequested);
  }
  final SongsRepository songsRepositoryImpl;
  bool sqliteBDisUpdated = false;
  List<SongDetail> cache = [];

  Future<void> _onSongsRequested(
    SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(SongsLoadingState());
    try {
      final songs = await _fetchSongs(event.useCache);
      await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
      emit(GetSongsSuccessState(songs));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsErrorState(error.toString()));
    }
  }

  Future<void> _onSearchSongRequested(
    SearchSongRequested event,
    Emitter<SongsState> emit,
  ) async {
    try {
      emit(SongsLoadingState());
      final searchResults = await _searchSongs(event.query);
      emit(GetSongsSuccessState(searchResults));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsErrorState(error.toString()));
    }
  }

  Future<List<SongDetail>> _fetchSongs(bool useCache) async {
    List<SongDetail> songs = [];

    if (cache.isEmpty || useCache == false) {
      songs = await songsRepositoryImpl.getSongs();
      if (songs.isNotEmpty) await updateStoredLanguages(songs);
      cache = songs;
    } else {
      songs = cache;
    }

    //save all keys of text (ru1, ru2, en1 ets..).  We need them to store data in SQL table
    await findAndSaveAllTextKeys(songs);
    final filteredSongs = await filterSongsByLang(songs);
    return await orderSongs(filteredSongs);
  }

  Future<List<SongDetail>> _searchSongs(String query) async {
    //delete all specific symbols
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r'[^a-zA-Zа-яА-Яёієї0-9]+'), ' ');
    final List<SongDetail> searchResult = [];
    //get all songs from firebase (we will need full versions with all fields)
    final allSongs =
        cache.isEmpty ? await songsRepositoryImpl.getSongs() : cache;

    if (trimmedQuery.contains(RegExp(r'[0-9]')) && trimmedQuery.length <= 3) {
      return await _searchByNumber(allSongs, trimmedQuery);
    } else {
      return await _searchByText(searchResult, trimmedQuery, allSongs);
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
    final List<String> orderLang = _getListOrderLangs();
    //get results from full text search (only id, title and text)
    searchResult =
        await songsRepositoryImpl.getSearchResult(trimmedQuery, orderLang);

    //combine searchResults with songs
    final List<SongDetail> songs = searchResult.map((song) {
      // Find the matching song in allSongs based on id
      final SongDetail matchingSong = allSongs.firstWhere(
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
  final locale = SharedPreferencesHelper.getString(
        StorageKeys.locale,
      ) ??
      'en';
  final List<String> allTitleKeys = findAllTitleKeys(songs);

  putDeviceLangToFirstPlace(allTitleKeys, locale);

  //get stored all languages (ordered)
  final Map<String, dynamic> orderedAllLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};

  //iterate languages from Firebase songs and add them to the Map
  allTitleKeys.forEach((String lang) {
    if (!orderedAllLanguages.containsKey(lang)) {
      // print('insert $lang');
      orderedAllLanguages[lang] = lang == locale;
    }
  });
  await SharedPreferencesHelper.saveMap(
      StorageKeys.allSongsLanguages, orderedAllLanguages);
}

List<String> findAllTitleKeys(List<SongDetail> songs) {
  final Set<String> allTitleKeys = {};

  songs.forEach((song) {
    //chek if some keys in text are corrupted i.e. without number in the end (we meed it for search)
    final keys = song.title.keys;
    keys.forEach((key) {
      if (key.toString().length > 2) {
        Logger().e('Wrong key in title, songId ${song.id}');
        FirebaseAnalytics.instance
            .logEvent(name: 'Wrong key in title, songId ${song.id}');
      }
    });
    allTitleKeys.addAll(song.getAllTitleKeys());
  });
  return allTitleKeys.toList();
}
