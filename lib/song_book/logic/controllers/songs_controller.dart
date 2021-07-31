import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:flutter/material.dart';
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

  void addToFavorites(int songId) async {
    await DatabaseHelperFTS4().addToFavorites(songId);
    fetchFavoritesList();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  void deleteFromFavorites(int songId) async {
    await DatabaseHelperFTS4().deleteFromFavorites(songId);
    fetchFavoritesList();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Deleted from favorite list'.tr,
    ));
  }

  void fetchFavoritesList() async {
    DatabaseHelperFTS4().getListFavorites().listen((songsFromDb) {
      favSongs.value = songsFromDb;
    });
  }

// playlists
  RxBool isReadOnly = true.obs;
  var playlists = <Map<String, Object?>>[].obs;
  RxBool showList = false.obs;
  final textController = TextEditingController().obs;

  Future getPlaylists() async {
    DatabaseHelperFTS4().getPlaylists().listen((event) {
      playlists.value = event;
      if (playlists.isNotEmpty) showList.value = true;
      playlists.forEach((element) {
        print(element);
      });
    });
  }

  void removePlaylist(Map<String, Object?> playlist) async {
    DatabaseHelperFTS4()
        .deleteFromPlaylists(int.parse(playlist['id'].toString()));
  }

  void renamePlaylist(Map<String, Object?> playlist, String newName) async {
    if (newName.isEmpty) return;
    await DatabaseHelperFTS4()
        .renamePlaylists(int.parse(playlist['id'].toString()), newName);
    await getPlaylists();
    isReadOnly.value = true;
  }

  Future createNewPlaylist() async {
    await Get.defaultDialog(
      title: 'name of playlist'.tr,
      content: TextField(
        controller: textController.value,
        autofocus: true,
        onSubmitted: (value) async {
          if (value.isNotEmpty) {
            await DatabaseHelperFTS4().createPlaylist(value);
            getPlaylists();
            Get.back();
          }
          textController.value.clear();
        },
      ),
    );
  }
}
