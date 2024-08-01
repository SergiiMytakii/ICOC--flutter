//order songs by id or by title
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/injection.dart';

Future<List<SongModel>> orderSongs(List<SongModel> songs) async {
  final bool orderByTitle =
      await getIt<LocalCache>().getBool(StorageKeys.orderByTitle) ?? true;
  if (orderByTitle) {
    songs.sort((a, b) {
      final String a1 = a.songVersions.first.title;
      final String b1 = b.songVersions.first.title;
      if (a1.toLowerCase().startsWith('і') &&
          !b1.toLowerCase().startsWith('і')) {
        //todo trying to handle ukranian 'i'... needs to be improved
        return 1;
      } else if (!a1.toLowerCase().startsWith('і') &&
          b1.toLowerCase().startsWith('і')) {
        return -1;
      } else {
        return a1.compareTo(b1);
      }
    });
  } else {
    songs.sort((a, b) => a.id.compareTo(b.id));
  }

  return songs;
}
