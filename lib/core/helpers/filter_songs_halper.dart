import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/injection.dart';

Future<List<SongDetail>> filterSongsByLang(List<SongDetail> songs) async {
  //keys represent languages
  //values show should lang be displayed or not
  final Map<String, dynamic> allLanguages =
      await getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};

  // SharedPreferencesHelper.removeValue('orderLanguages');
  final Map<String, dynamic> newMap = Map.from(allLanguages);
  newMap.removeWhere((key, value) => value == false);

  final List<SongDetail> filteredAndOrderedSongs = songs
      .map((song) => song.filterAndOrderLanguages(newMap.keys.toList()))
      .toList();
  final result = filteredAndOrderedSongs
      .where((song) => song.title.isNotEmpty && song.text.isNotEmpty)
      .toList();
  return result;
}
