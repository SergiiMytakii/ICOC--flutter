import 'package:icoc/song_book/logic/services/database_firebase_service.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:icoc/song_book/models/song.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:logger/logger.dart';

class SongsController extends GetxController {
  final songs = <Song>[].obs;
  var loaded = false.obs;
  var log = Logger();
  RxString updateLoadingProgress = 'Загружаем песни'.obs;
  RxString query = ''.obs;

  @override
  void onInit() async {
    await fetchSongsList();
    super.onInit();
  }

  Future fetchDataFromFirebase() async {
    //update local SQL database from firebase
    DatabaseServiceFirebase().songs.listen((songs) async {
      await DatabaseHelperFTS4().insertAllSongs(songs);
      fetchSongsList();
    });
  }

  Future<void> fetchSongsList() async {
    DatabaseHelperFTS4().getListSongs().listen((event) {
      songs.value = event;
      if (songs.length != 0) {
        loaded.value = true;
      } else {
        //if we can't load data for 5 ces - show warning
        Future.delayed(Duration(seconds: 5)).then((value) {
          if (songs.length == 0) {
            updateLoadingProgress.value =
                'При первой загрузке приложения \nнужно немножко больше времени';
          }
        });
        Future.delayed(Duration(seconds: 10)).then((value) {
          if (songs.length == 0) {
            updateLoadingProgress.value = 'Почти готово...';
          }
        });

        Future.delayed(Duration(seconds: 15)).then((value) {
          if (songs.length == 0) {
            updateLoadingProgress.value =
                'Загрузка медленне, чем обычно... \nВернитесь на главный экран \nи затем опять зайдите в песни';
          }
        });
      }
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

// playlists
  RxBool isReadOnly = true.obs;
  var playlists = <Map<String, Object?>>[].obs;
  RxBool showList = false.obs;
  final textController = TextEditingController().obs;
  final songsInPlaylist = <Song>[].obs;

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

  void addToPlaylist(String name, int id) async {
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

  // void showSearch(String val) {}
}
