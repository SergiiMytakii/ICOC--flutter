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
      );
    });
  }

  final SongsRepository songsRepositoryImpl;
  bool sqliteBDisUpdated = false;

  Future<void> _onSongsRequested(
    SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(const SongsState.loading());
    try {
      final songs = await _fetchSongs();
      // await songsRepositoryImpl.insertAllSongsToLocalTable(songs);
      emit(SongsState.success(songs));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(SongsState.error(error.toString()));
    }
  }

  Future<List<SongModel>> _fetchSongs() async {
    List<SongModel> songs = [];

    songs = await songsRepositoryImpl.getSongs();
    await updateStoredLanguages(songs);
    songs = await filterSongsByLang(songs);

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
