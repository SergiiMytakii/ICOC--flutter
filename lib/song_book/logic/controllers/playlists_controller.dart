import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:icoc/song_book/models/song.dart';

class PlaylistsController extends GetxController {
  RxString query = ''.obs;
  RxBool isReadOnly = true.obs;
  var playlists = <Map<String, Object?>>[].obs;
  RxBool showList = false.obs;
  final textController = TextEditingController().obs;
  final songsInPlaylist = <Song>[].obs;
  final TextEditingController textEditingController = TextEditingController();

  Future getPlaylists() async {
    DatabaseHelperFTS4().getPlaylists().listen((event) {
      playlists.value = event;
      if (playlists.isNotEmpty) showList.value = true;
    });
  }

  void deletePlaylist(Map<String, Object?> playlist) async {
    DatabaseHelperFTS4().deletePlaylist(int.parse(playlist['id'].toString()));
  }

  void renamePlaylist(Map<String, Object?> playlist, String newName) async {
    if (newName.isEmpty) return;
    await DatabaseHelperFTS4()
        .renamePlaylists(int.parse(playlist['id'].toString()), newName);
    await getPlaylists();
    isReadOnly.value = true;
  }

  Future createNewPlaylist() async {
    if (textController.value.text.isEmpty) return;
    if (textController.value.text.isNotEmpty) {
      await DatabaseHelperFTS4().createPlaylist(textController.value.text);
      getPlaylists();
    }
    textController.value.clear();
  }

  addToPlaylist(String name, int id) async {
    await DatabaseHelperFTS4().insertIntoPlaylist(name, id);
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to playlist'.tr,
    ));
  }

  void getSongsInPlaylist(int playlistId) async {
    DatabaseHelperFTS4().getSongsInPlaylist(playlistId).listen((songsFromDb) {
      songsInPlaylist.value = songsFromDb;
    });
  }

  void removeFromPlaylist(int playlistId, int id) {
    DatabaseHelperFTS4().removeFromPlaylist(playlistId, id);
    getSongsInPlaylist(playlistId);
  }
}
