import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
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
        searchByNumber: (e) => _onSearchByNumber(e, emit),
        searchByText: (e) => _onSearchByText(e, emit),
        clearSearch: (e) => _onClearSearch(e, emit),
      );
    });
  }

  final SongsRepository songsRepositoryImpl;
  List<SongModel> allSongs = [];
  List<SongModel> rawSongs = [];

  Future<void> _onSongsRequested(
    _SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(const SongsState.loading());
    try {
      final songs = await _fetchSongs();
      if (songs.isNotEmpty) {
        await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
        allSongs = songs;
        emit(SongsState.success(songs));
      } else {
        emit(const SongsState.empty());
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsState.error(error.toString()));
    }
  }

  Future<void> _onSearchByNumber(
      _SearchSongByNumber event, Emitter<SongsState> emit) async {
    emit(const SongsState.loading());
    try {
      final songs =
          allSongs.isNotEmpty ? allSongs : await songsRepositoryImpl.getSongs();
      final searchResults = songs
          .where((song) => song.id.toString() == event.query.trim())
          .toList();

      emit(SongsState.success(searchResults));
    } catch (e, stackTrace) {
      emit(SongsState.error(e.toString()));
      logError(e, stackTrace);
    }
  }

  Future<void> _onClearSearch(
      _SearchSongClear event, Emitter<SongsState> emit) async {
    emit(const SongsState.initial());
  }

  Future<void> _onSearchByText(
      _SearchSongByText event, Emitter<SongsState> emit) async {
    emit(const SongsState.loading());
    try {
      final List<SongVersionLocal> searchResult =
          await songsRepositoryImpl.getSearchResult(event.query.trim());
      emit(SongsState.searchSuccess(searchResult));
    } catch (e, stackTrace) {
      emit(SongsState.error(e.toString()));
      logError(e, stackTrace);
    }
  }

  Future<List<SongModel>> _fetchSongs() async {
    List<SongModel> songs = [];
    rawSongs = await songsRepositoryImpl.getSongs();
    await updateStoredLanguages(rawSongs);
    songs = await filterSongsByLang(rawSongs);
    return await orderSongs(songs);
  }
}

Future<void> updateStoredLanguages(List<SongModel> songs) async {
  final List<Languages> allLangs = findAllLangs(songs);

  final Map<String, dynamic> orderedAllLanguages =
      getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};

  allLangs.forEach((Languages lang) {
    if (!orderedAllLanguages.containsKey(lang.name)) {
      orderedAllLanguages[lang.name] = lang.name == locale;
    }
  });
  await getIt<LocalCache>()
      .saveMap(StorageKeys.allSongsLanguages, orderedAllLanguages);
}

List<Languages> findAllLangs(List<SongModel> songs) {
  final Set<Languages> allLangs = {};

  songs.forEach((song) {
    allLangs.addAll(song.getAllLangs());
  });
  return allLangs.toList();
}
