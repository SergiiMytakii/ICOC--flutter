import '/index.dart';

class SongsController extends GetxController {
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
    loaded.value = false;
    songsFromFB.value = [];
    log.i('start to fetch data from FB');
    //update local SQL database from firebase
    databaseServiceFirebase.songs.listen((songs) async {
      if (songs.isNotEmpty) {
        songsFromFB.value = songs;

        databaseService.insertAllSongs(songs);
        _orderSongs();
        loaded.value = true;
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

  void _orderSongs() {
    bool byNumber = box.read('sortByNumber') ?? true;
    if (byNumber)
      songsFromFB.sort((a, b) => a.id.compareTo(b.id));
    else
      songsFromFB.sort((a, b) => controller
          .chooseCardLang(a)![0]!
          .compareTo(controller.chooseCardLang(b)![0]!));
  }
}
