import 'package:icoc/song_book/logic/services/database_firebase_service.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:icoc/song_book/models/song.dart';
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
      log.i('fetching songs from firebase');
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
}
