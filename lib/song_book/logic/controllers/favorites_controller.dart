import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:getxfire/getxfire.dart';

class FavoritesController extends GetxController {
  var songs = <Song>[].obs;

  @override
  void onInit() async {
    await DatabaseHelperFTS4().getListFavorites().then((songsFromDb) {
      songs.value = songsFromDb;
      print(songs);
    });

    super.onInit();
  }

  void deleteFromFavorites(int songId) {
    songs.removeWhere((song) => song.id == songId);
    update();
  }
}
