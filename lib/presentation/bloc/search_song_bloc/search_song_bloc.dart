import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:icoc/injection.dart';
import 'package:injectable/injectable.dart';

part 'search_song_bloc.freezed.dart';
part 'search_song_event.dart';
part 'search_song_state.dart';

@singleton
class SearchSongBloc extends Bloc<SearchSongEvent, SearchSongState> {
  final SongsRepository songsRepositoryImpl;
  SearchSongBloc(this.songsRepositoryImpl)
      : super(const SearchSongState.initial()) {
    on<SearchSongEvent>((event, emit) async {
      await event.map(
        searchByNumber: (e) async => await _onSearchByNumber(e, emit),
        searchByText: (e) async => await _onSearchByText(e, emit),
        clearSearch: (e) async => await _onClearSearch(e, emit),
      );
    });
  }

  Future<void> _onSearchByNumber(
      _SearchSongByNumber event, Emitter<SearchSongState> emit) async {
    emit(const SearchSongState.loading());
    try {
      final songs = await songsRepositoryImpl.getSongs();
      final searchResults = songs
          .where((song) => song.id.toString() == event.query.trim())
          .toList();

      emit(SearchSongState.success(searchResults));
    } catch (e) {
      emit(SearchSongState.error(e.toString()));
    }
  }

  Future<void> _onClearSearch(
      _SearchSongClear event, Emitter<SearchSongState> emit) async {
    emit(const SearchSongState.initial());
  }

  Future<List<SongVersionLocal>> _onSearchByText(
      _SearchSongByText event, Emitter<SearchSongState> emit) async {
    final List<String> orderLang = await _getListOrderLangs();
    final List<SongVersionLocal> searchResult = await songsRepositoryImpl
        .getSearchResult(event.query.trim(), orderLang);
    return searchResult;
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
