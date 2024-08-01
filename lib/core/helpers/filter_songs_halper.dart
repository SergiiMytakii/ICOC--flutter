import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/injection.dart';

Future<List<SongModel>> filterSongsByLang(List<SongModel> songs) async {
  //keys represent languages
  //values show should lang be displayed or not
  final Map<String, dynamic> allLanguages =
      getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};

  // final Map<String, dynamic> newMap = Map.from(allLanguages);
  allLanguages.removeWhere((key, value) => value == false);

  songs = songs.map((song) {
    final mutableSongVersions = List<SongVersion>.from(song.songVersions);
    mutableSongVersions.removeWhere(
        (songVersion) => !allLanguages.keys.contains(songVersion.lang.name));
    return song.copyWith(songVersions: mutableSongVersions);
  }).toList();

  songs.removeWhere((song) => song.songVersions.isEmpty);
  return songs;
}
