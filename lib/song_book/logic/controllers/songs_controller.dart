import '/index.dart';

class SongsController extends GetxController {
  var songs = <SongDetail>[].obs;
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
  RxList<SongDetail> songsFromFB = <SongDetail>[].obs;

  Future fetchDataFromFirebase() async {
    log.i('start to fetch data from FB');
    //update local SQL database from firebase
    databaseServiceFirebase.songs.listen((songs) async {
      if (songs.isNotEmpty) {
        songsFromFB.value = songs;
        loaded.value = true;
        await databaseService.insertAllSongs(songs);
        _orderSongs();
        //await fetchSongsList();
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

  // Future<void> fetchSongsList() async {
  //   databaseService.getListSongs().listen((event) {
  //     log.i('got songs from SQL, ' + event.length.toString());
  //     songs.value = event;
  //     if (songs.length != 0) {
  //       loaded.value = true;
  //       songsInLocalDB = event.length;
  //     } else {
  //       Future.delayed(Duration(seconds: 5)).then((value) =>
  //           updateLoadingProgress.value =
  //               ' Нажмите, чтобы \nобновить страницу'.tr);
  //     }
  //   }, onDone: () {
  //     _orderSongs();
  //     log.i('fetch songs done');
  //     checkDatabaseChanged();
  //   });
  // }

  void _orderSongs() {
    bool byNumber = box.read('sortByNumber') ?? true;
    if (byNumber)
      songsFromFB.sort((a, b) => a.id.compareTo(b.id));
    else
      songsFromFB.sort((a, b) => controller
          .chooseCardLang(a)![0]!
          .compareTo(controller.chooseCardLang(b)![0]!));
  }

  // Future<void> checkDatabaseChanged() async {
  //   databaseServiceFirebase.songs.then((result) async {
  //     //songsInLocalDB = await databaseService.songsInLocalDB;
  //     songsFromFB.value = result;
  //     if (songsInLocalDB != songsFromFB.length) {
  //       log.i(
  //           'databases are different  $songsInLocalDB  vs  ${songsFromFB.length}');

  //       await databaseService.insertAllSongs(songsFromFB);
  //       fetchSongsList();
  //     } else
  //       log.i('Databases are equal' + songsInLocalDB.toString());
  //   });
  // }
}
