import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:getxfire/getxfire.dart';

class SongListController extends GetxController {
  List<Song> songs = [];
  var loaded = false;

  @override
  void onInit() {
    fetchSongs();
    super.onInit();
  }

  void fetchSongs() {
    DatabaseHelperFTS4().getListSongs().listen((event) {
      songs = event;

      if (songs.length != 0) loaded = true;
      update();
    });
  }
}
