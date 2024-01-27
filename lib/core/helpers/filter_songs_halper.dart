import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/song_detail.dart';

Future<List<SongDetail>> filterSongs(List<SongDetail> songs) async {
  //keys represent languages
  //values show should lang be displayed or not
  Map<String, dynamic> allLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};

  // SharedPreferencesHelper.removeValue('orderLanguages');
  final Map<String, dynamic> newMap = Map.from(allLanguages);
  newMap.removeWhere((key, value) => value == false);

  List<SongDetail> filteredAndOrderedSongs = songs
      .map((song) => song.filterAndOrderLanguages(newMap.keys.toList()))
      .toList();
  final result = filteredAndOrderedSongs
      .where((song) => song.title.isNotEmpty && song.text.isNotEmpty)
      .toList();
  return result;
}
