import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/find_save_all_text_keys.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/helpers/set_device_lang_as_primary.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:icoc/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'songs_event.dart';
part 'songs_state.dart';
part 'songs_bloc.freezed.dart';

@singleton
class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc(this.songsRepositoryImpl) : super(const SongsState.initial()) {
    on<SongsEvent>((event, emit) async {
      await event.map(
        songsRequested: (e) => _onSongsRequested(e, emit),
        searchSongRequested: (e) => _onSearchSongRequested(e, emit),
      );
    });
  }

  final SongsRepository songsRepositoryImpl;
  bool sqliteBDisUpdated = false;
  List<SongDetail> cache = [];

  Future<void> _onSongsRequested(
    SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(const SongsState.loading());
    try {
      final songs = await _fetchSongs(event.useCache);
      await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
      emit(SongsState.success(songs));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsState.error(error.toString()));
    }
  }

  Future<void> _onSearchSongRequested(
    SearchSongRequested event,
    Emitter<SongsState> emit,
  ) async {
    try {
      emit(const SongsState.loading());
      final searchResults = await _searchSongs(event.query);
      emit(SongsState.success(searchResults));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsState.error(error.toString()));
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

    await findAndSaveAllTextKeys(songs);
    final filteredSongs = await filterSongsByLang(songs);
    return await orderSongs(filteredSongs);
  }

  Future<List<SongDetail>> _searchSongs(String query) async {
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r'[^a-zA-Zа-яА-Яёієї0-9]+'), ' ');
    final List<SongDetail> searchResult = [];
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
    final List<String> orderLang = await _getListOrderLangs();
    searchResult =
        await songsRepositoryImpl.getSearchResult(trimmedQuery, orderLang);

    final List<SongDetail> songs = searchResult.map((song) {
      final SongDetail matchingSong = allSongs.firstWhere(
        (element) => element.id == song.id,
        orElse: () => SongDetail.defaultSong(),
      );
      return SongDetail(
        id: matchingSong.id,
        description: matchingSong.description,
        title: matchingSong.title,
        text: matchingSong.text,
        chords: matchingSong.chords,
        youtubeVideos: matchingSong.youtubeVideos,
        searchTitle: song.searchTitle,
        searchLang: song.searchLang,
        searchText: song.searchText,
      );
    }).toList();
    final List<SongDetail> filteredSongs = await filterSongsByLang(songs);
    return filteredSongs;
  }

  Future<List<String>> _getListOrderLangs() async {
    final allLanguages =
        getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};
    final filtered =
        allLanguages.entries.where((element) => element.value == true);
    final List<String> orderLang = filtered.map((e) => e.key).toList();
    return orderLang;
  }
}

Future<void> updateStoredLanguages(List<SongDetail> songs) async {
  final locale = await getIt<LocalCache>().getString(
        StorageKeys.locale,
      ) ??
      'en';
  final List<String> allTitleKeys = findAllTitleKeys(songs);

  putDeviceLangToFirstPlace(allTitleKeys, locale);

  final Map<String, dynamic> orderedAllLanguages =
      getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};

  allTitleKeys.forEach((String lang) {
    if (!orderedAllLanguages.containsKey(lang)) {
      orderedAllLanguages[lang] = lang == locale;
    }
  });
  await getIt<LocalCache>()
      .saveMap(StorageKeys.allSongsLanguages, orderedAllLanguages);
}

List<String> findAllTitleKeys(List<SongDetail> songs) {
  final Set<String> allTitleKeys = {};

  songs.forEach((song) {
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
