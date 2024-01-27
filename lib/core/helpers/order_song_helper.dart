//order songs by id or by title
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/song_detail.dart';

Future<List<SongDetail>> orderSongs(List<SongDetail> songs) async {
  final bool orderByTitle =
      await SharedPreferencesHelper.getBool(StorageKeys.orderByTitle) ?? false;
  if (orderByTitle) {
    songs.sort((a, b) {
      final String a1 = a.title.entries.first.value;
      final String b1 = b.title.entries.first.value;
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
  } else
    songs.sort((a, b) => a.id.compareTo(b.id));

  return songs;
}
