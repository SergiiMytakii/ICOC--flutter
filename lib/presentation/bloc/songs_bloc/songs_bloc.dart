import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
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
  SongsBloc(this.songsRepositoryImpl, this.songsUserLanguagesHandler)
      : super(const SongsState.initial()) {
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
  final SongsUserLanguagesHandler songsUserLanguagesHandler;
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
          emit(SongsState.success(songs));
        } else {
          emit(const SongsState.empty());
        }
      },
    );
  }

  Future<void> _onSearchByNumber(
      _SearchSongByNumber event, Emitter<SongsState> emit) async {
    emit(const SongsState.loading());
    if (allSongs.isNotEmpty) {
      final searchResults = allSongs
          .where((song) => song.id.toString() == event.query.trim())
          .toList();
      emit(SongsState.success(searchResults));
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
          emit(SongsState.success(searchResults));
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
