import '/index.dart';

class SongsController extends GetxController {
  var songs = <Song>[].obs;
  var loaded = false.obs;
  var log = Logger();
  RxString updateLoadingProgress = 'Loading songs'.tr.obs;
  RxString query = ''.obs;
  RxBool isSelected = true.obs;
  DatabaseHelperFTS4 databaseService = DatabaseHelperFTS4();
  DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();

  Future fetchDataFromFirebase() async {
    log.i('start to fetch data from FB');
    //update local SQL database from firebase
    databaseServiceFirebase.songs.listen((songs) async {
      if (songs.isNotEmpty) {
        await databaseService.insertAllSongs(songs);
        await fetchSongsList();
      } else {
        Future.delayed(Duration(seconds: 5)).then((value) {
          updateLoadingProgress.value =
              'Сannot load data ... Check your internet connection and click to refresh the page'
                  .tr;
          isSelected.value = true;
        });
      }
    });
  }

  Future<void> fetchSongsList() async {
    databaseService.getListSongs().listen((event) {
      log.i('got songs from SQL, ' + event.length.toString());
      songs.value = event;
      if (songs.length != 0) {
        loaded.value = true;
      } else {
        Future.delayed(Duration(seconds: 5)).then((value) =>
            updateLoadingProgress.value =
                ' Нажмите, чтобы \nобновить страницу'.tr);
      }
    }, onDone: () {
      log.i('fetch songs done');
      checkDatabaseChanged();
    });
  }

  Future<void> checkDatabaseChanged() async {
    databaseServiceFirebase.songs.listen((songsFromFB) async {
      if (songs.length != songsFromFB.length) {
        log.i('databases are different  ' +
            songs.length.toString() +
            ' vs ' +
            songsFromFB.length.toString());

        await databaseService.insertAllSongs(songsFromFB);
        fetchSongsList();
      } else
        log.i('Databases are equal');
    });
  }
}
