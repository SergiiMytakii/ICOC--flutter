import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:getxfire/getxfire.dart';

import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song_detail.dart';

class SongScreenController extends GetxController {
  final songDetail =
      SongDetail(id: 0, title: {}, description: {}, text: {}, chords: {}).obs;
  int songId;
  SongScreenController({
    required this.songId,
  });
  final favStatus = false.obs;
  final tabItemsSongs = [].obs;
  final tabItemsChords = [].obs;
  OrderLangController orderLangController = Get.put(
      OrderLangController()); //try to use instead final orderLangController = Get.find<OrderLangController>();
  List<String> orderLang = [];
  RxInt amountOfTabs = 0.obs;

  @override
  void onInit() async {
    orderLang = orderLangController.orderLang;
    print('orderlang ' + orderLang.toString());
    await fetchSongdetail(songId);
    print(songDetail);
    favoriteStatus(songId);
    getTitlesForTabs();
    countTabs();
    super.onInit();
  }

  Future fetchSongdetail(int songId) async {
    await DatabaseHelperFTS4()
        .getSongDetail(songId)
        .then((value) => songDetail.value = value);
    print('got ' + songDetail.value.title.toString());
  }

  void favoriteStatus(songId) async {
    await DatabaseHelperFTS4().getFavoriteStatus(songId).then((value) {
      favStatus.value = value;
    });
  }

  void toggleFavStatus(SongsController? songsController) async {
    favStatus.value
        ? songsController!.deleteFromFavorites(songId)
        : songsController!.addToFavorites(songId);
    favStatus.toggle();
  }

  void getTitlesForTabs() {
    //get the tabs titles
    tabItemsSongs.value = songDetail.value.text.keys.toList();
    tabItemsChords.value = songDetail.value.chords.keys.toList();

    //reorder tabs accordingly preferred  lang-s
    //if it's just 1 tab - return
    if (tabItemsSongs.length == 1) return;

    // count index of first lang
    int index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[0]));

    // if tab in the first place and we have just 2 items - return
    if (index == 0 && tabItemsSongs.length == 2) return;

    //remove item and insert it in the first place
    if (index > 0) {
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);
    }
    if (index < 0) {
      index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[1]));
      if (index <= 0) return;
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);
    }

    //search for second preferred lang
    index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[1]));
    if (index <= 0) return;

    //remove item and insert it in the second place
    String secondTab = tabItemsSongs.removeAt(index);
    tabItemsSongs.insert(1, secondTab);
  }

  countTabs() {
    amountOfTabs.value =
        songDetail.value.text.length + songDetail.value.chords.length;
    print(' amount of tabs ' + amountOfTabs.toString());
    return amountOfTabs;
  }
}
