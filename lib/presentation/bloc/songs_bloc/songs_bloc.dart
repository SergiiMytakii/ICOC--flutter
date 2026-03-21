import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/core/user_state/new_items_local_store.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/repository/songs_repository.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'songs_event.dart';
part 'songs_state.dart';
part 'songs_bloc.freezed.dart';

@singleton
class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc(
    this.songsRepositoryImpl,
    this.songsUserLanguagesHandler,
    this._newItemsStore,
  ) : super(const SongsState.initial()) {
    on<SongsEvent>((event, emit) async {
      await event.map(
        songsRequested: (e) => _onSongsRequested(e, emit),
        searchByNumber: (e) => _onSearchByNumber(e, emit),
        searchByText: (e) => _onSearchByText(e, emit),
        clearSearch: (e) => _onClearSearch(e, emit),
        screenOpened: (e) => _onScreenOpened(emit),
        songOpened: (e) => _onSongOpened(e.songId, emit),
      );
    });
  }

  final SongsRepository songsRepositoryImpl;
  final SongsUserLanguagesHandler songsUserLanguagesHandler;
  final NewItemsLocalStore _newItemsStore;
  List<SongModel> allSongs = [];
  List<SongModel> rawSongs = [];

  Future<void> _onSongsRequested(
    _SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(const SongsState.loading());
    final result = await _fetchSongs();
    return result.fold(
      (failure) {
        emit(SongsState.error(failure.toUserFriendlyMessage()));
      },
      (songs) {
        if (songs.isNotEmpty) {
          allSongs = songs;
          songsRepositoryImpl.insertAllSongsToLocalTable(songs);
          final currentIds = songs.map((s) => s.id).toSet();
          final newSongIds = _newItemsStore.computeNewSongIds(currentIds);
          emit(SongsState.success(
            songs: songs,
            unreadCount: newSongIds.length,
            newSongIds: newSongIds,
          ));
        } else {
          emit(const SongsState.empty());
        }
      },
    );
  }

  Future<void> _onSearchByNumber(
      _SearchSongByNumber event, Emitter<SongsState> emit) async {
    final (int prevUnread, Set<int> prevNewIds) = state.maybeWhen(
      success: (songs, unreadCount, newSongIds) => (unreadCount, newSongIds),
      orElse: () => (0, const <int>{}),
    );
    emit(const SongsState.loading());
    if (allSongs.isNotEmpty) {
      final searchResults = allSongs
          .where((song) => song.id.toString() == event.query.trim())
          .toList();
      emit(SongsState.success(
        songs: searchResults,
        unreadCount: prevUnread,
        newSongIds: prevNewIds,
      ));
    } else {
      final result = await songsRepositoryImpl.getSongs();
      return result.fold(
        (failure) {
          emit(SongsState.error(failure.toUserFriendlyMessage()));
        },
        (songs) {
          final searchResults = songs
              .where((song) => song.id.toString() == event.query.trim())
              .toList();
          emit(SongsState.success(
            songs: searchResults,
            unreadCount: prevUnread,
            newSongIds: prevNewIds,
          ));
        },
      );
    }
  }

  Future<void> _onClearSearch(
      _SearchSongClear event, Emitter<SongsState> emit) async {
    emit(const SongsState.initial());
  }

  Future<void> _onSearchByText(
      _SearchSongByText event, Emitter<SongsState> emit) async {
    emit(const SongsState.loading());
    final result =
        await songsRepositoryImpl.getSearchResult(event.query.trim());
    return result.fold(
      (failure) {
        emit(SongsState.error(failure.toUserFriendlyMessage()));
      },
      (searchResult) {
        emit(SongsState.searchSuccess(searchResult));
      },
    );
  }

  Future<void> _onSongOpened(int songId, Emitter<SongsState> emit) async {
    final loadedState = state.maybeMap(
      success: (s) => s,
      orElse: () => null,
    );
    if (loadedState == null) return;
    if (!loadedState.newSongIds.contains(songId)) return;

    final updatedNewIds = Set<int>.from(loadedState.newSongIds)..remove(songId);
    final known = _newItemsStore.getKnownSongIds()..add(songId);
    await _newItemsStore.saveKnownSongIds(known);
    emit(loadedState.copyWith(
      unreadCount: updatedNewIds.length,
      newSongIds: updatedNewIds,
    ));
  }

  Future<void> _onScreenOpened(Emitter<SongsState> emit) async {
    final loadedState = state.maybeMap(
      success: (s) => s,
      orElse: () => null,
    );
    if (loadedState == null) return;

    final allIds = loadedState.songs.map((s) => s.id).toSet();
    await _newItemsStore.saveKnownSongIds(allIds);

    if (loadedState.unreadCount == 0) return;
    emit(loadedState.copyWith(unreadCount: 0));
  }

  Future<Either<Failure, List<SongModel>>> _fetchSongs() async {
    final result = await songsRepositoryImpl.getSongs();
    return result.fold(
      (failure) => Left(failure),
      (songs) async {
        rawSongs = songs;
        await updateStoredLanguages(rawSongs, songsUserLanguagesHandler);
        final filteredSongs =
            await filterSongsByLang(rawSongs, songsUserLanguagesHandler);
        final orderedSongs =
            await orderSongs(filteredSongs, songsUserLanguagesHandler);
        return Right(orderedSongs);
      },
    );
  }
}

Future<void> updateStoredLanguages(List<SongModel> songs,
    SongsUserLanguagesHandler songsUserLanguagesHandler) async {
  final List<Languages> allLangsFromSongs = findAllLangs(songs);

  for (final lang in allLangsFromSongs) {
    if (!songsUserLanguagesHandler.languages.containsKey(lang.name)) {
      await songsUserLanguagesHandler.addLanguage(
          lang.name, lang.name == locale);
    }
  }
}

List<Languages> findAllLangs(List<SongModel> songs) {
  final Set<Languages> allLangs = {};

  for (final song in songs) {
    allLangs.addAll(song.getAllLangs());
  }
  return allLangs.toList();
}
