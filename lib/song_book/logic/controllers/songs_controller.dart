import '/index.dart';

class SongsController extends GetxController {
  var songs = <Song>[].obs;
  var songsInLocalDB = 0;
  var loaded = false.obs;
  var log = Logger();
  RxString updateLoadingProgress = 'Loading songs'.tr.obs;
  RxString query = ''.obs;
  RxBool isSelected = true.obs;
  DatabaseHelperFTS4 databaseService = DatabaseHelperFTS4();
  DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();
  final GetStorage box = GetStorage();
  OrderLangController controller = Get.put(OrderLangController());

  Future fetchDataFromFirebase() async {
    log.i('start to fetch data from FB');
    //update local SQL database from firebase
    databaseServiceFirebase.songs.then((songs) async {
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
      _orderSongs();
      log.i('fetch songs done');
      checkDatabaseChanged();
    });
  }

  void _orderSongs() {
    bool byNumber = box.read('sortByNumber') ?? true;
    if (byNumber)
      songs.sort((a, b) => a.id.compareTo(b.id));
    else
      songs.sort((a, b) => controller
          .chooseCardLang(a)![0]!
          .compareTo(controller.chooseCardLang(b)![0]!));
  }

  Future<void> checkDatabaseChanged() async {
    databaseServiceFirebase.songs.then((songsFromFB) async {
      songsInLocalDB = await databaseService.songsInLocalDB;
      if (songsInLocalDB != songsFromFB.length) {
        log.i(
            'databases are different  $songsInLocalDB  vs  ${songsFromFB.length}');

        await databaseService.insertAllSongs(songsFromFB);
        fetchSongsList();
      } else
        log.i('Databases are equal');
    });
  }
}
