import 'package:icoc/song_book/logic/services/database_firebase_service.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:icoc/song_book/models/song.dart';
import 'package:getxfire/getxfire.dart';
import 'package:logger/logger.dart';

class SongsController extends GetxController {
  var songs = <Song>[].obs;
  var loaded = false.obs;
  var log = Logger();
  RxString updateLoadingProgress = 'Загружаем песни'.obs;
  RxString query = ''.obs;
  RxBool isSelected = true.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future fetchDataFromFirebase() async {
    log.i('start to fetch data from FB');
    //update local SQL database from firebase

    DatabaseServiceFirebase().songs.listen((songs) async {
      if (songs.isNotEmpty) {
        await DatabaseHelperFTS4().insertAllSongs(songs);
        log.i('inserted  data from FB to SQL');
        await fetchSongsList();
      } else {
        Future.delayed(Duration(seconds: 3)).then((value) {
          updateLoadingProgress.value =
              'Не можем загрузить данные... Проверьте интернет соединение и нажмите, чтобы обновить страницу';
          isSelected.value = true;
        });
      }
    });
  }

  Future<void> fetchSongsList() async {
    log.i('start to fetch songs from SQL');
    DatabaseHelperFTS4().getListSongs().listen((event) {
      log.i('got songs from SQL, ' + event.length.toString());
      songs.value = event;
      if (songs.length != 0) {
        loaded.value = true;
        checkDatabaseChanged();
      } else {
        Future.delayed(Duration(seconds: 5)).then((value) =>
            updateLoadingProgress.value =
                ' Нажмите, чтобы \nобновить страницу');
      }
    }, onDone: () {
      log.i('fetch songs done');
    });
  }

  Future<void> checkDatabaseChanged() async {
    log.i('start to compare DB\'s');
    DatabaseServiceFirebase().songs.listen((songsFromFB) async {
      if (songs.length != songsFromFB.length) {
        log.i('databases are different  ' +
            songs.length.toString() +
            ' vs ' +
            songsFromFB.length.toString());

        await DatabaseHelperFTS4().insertAllSongs(songsFromFB);
        fetchSongsList();
      } else
        log.i('Databases are equal');
    });
  }
}
