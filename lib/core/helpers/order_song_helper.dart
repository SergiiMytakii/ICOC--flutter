//order songs by id or by title
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/injection.dart';

Future<List<SongModel>> orderSongs(
    List<SongModel> songs, SongsUserLanguagesHandler songsUserLanguages) async {
  final bool orderByTitle =
      getIt<LocalCache>().getBool(StorageKeys.orderByTitle) ?? true;
  final primaryLang = songsUserLanguages.primaryLang;
  if (orderByTitle) {
    songs.sort((a, b) {
      // Put songs with primary language version first
      if (a.songVersions.first.lang.name == primaryLang &&
          b.songVersions.first.lang.name != primaryLang) {
        return -1;
      } else if (a.songVersions.first.lang.name != primaryLang &&
          b.songVersions.first.lang.name == primaryLang) {
        return 1;
      }

      final String a1 = a.songVersions.first.title
          .toLowerCase()
          .replaceAll('і',
              'и') //replace ukrainian letters with russian to avoid incorrect sorting
          .replaceAll('є', 'е');
      final String b1 = b.songVersions.first.title
          .toLowerCase()
          .replaceAll('і', 'и')
          .replaceAll('є', 'е');

      return a1.compareTo(b1);
    });
  } else {
    songs.sort((a, b) => a.id.compareTo(b.id));
  }

  return songs;
}
