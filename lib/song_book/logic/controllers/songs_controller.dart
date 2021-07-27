import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:getxfire/getxfire.dart';

class SongsController extends GetxController {
  final songs = <Song>[].obs;
  var loaded = false.obs;

  @override
  void onInit() {
    fetchFavoritesList();
    fetchSongsList();
    super.onInit();
  }

  void fetchSongsList() {
    DatabaseHelperFTS4().getListSongs().listen((event) {
      songs.value = event;
      if (songs.length != 0) loaded.value = true;
    });
  }

  void addToFavorites(int songId) async {
    await DatabaseHelperFTS4().addToFavorites(songId);
    fetchFavoritesList();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  List<String?>? chooseCardLang(Song song, List<String> orderLang) {
    String? title;
    String? text;

    //check every key and if it fit to FIRST preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[0] && key != null) {
        title = song.title[orderLang[0]];
        text = song.text[orderLang[0]];
      }
    });
    if (title != null) return [title, text];

    //check every key and if it fit to SECOND preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[1] && key != null) {
        title = song.title[orderLang[1]];
        text = song.text[orderLang[1]];
      }
    });
    if (title != null) return [title, text];

    //check every key and if it fit to THIRD  preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[2] && key != null) {
        title = song.title[orderLang[2]];
        text = song.text[orderLang[2]];
      }
    });
    if (title != null) return [title, text];
  }

//favorites

  var favSongs = <Song>[].obs;
  void deleteFromFavorites(int songId) async {
    await DatabaseHelperFTS4().deleteFromFavorites(songId);
    fetchFavoritesList();
    //songs.removeWhere((song) => song.id == songId);
  }

  void fetchFavoritesList() async {
    DatabaseHelperFTS4().getListFavorites().listen((songsFromDb) {
      favSongs.value = songsFromDb;
    });
  }
}
