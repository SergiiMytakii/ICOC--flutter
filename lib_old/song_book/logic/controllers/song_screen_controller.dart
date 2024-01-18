import '../../models/resources.dart';

import '../../../index.dart';

class SongScreenController extends GetxController {
  GetStorage box = GetStorage();
  RxDouble fontSize = 18.0.obs;
  DatabaseHelperFTS4 databaseService = DatabaseHelperFTS4();

  List<dynamic> resources = [];
  RxList<Resources> resourcesIds = <Resources>[].obs;

  final tabItemsSongs = [].obs;
  final tabItemsChords = [].obs;
  final OrderLangController orderLangController = Get.find();
  List<String> orderLang = [];
  RxInt amountOfTabs = 0.obs;

  void getData(SongDetail songDetail, String? prefferedLangFromSearch) async {
    orderLang = orderLangController.orderLang;

    countTabs(songDetail);
    getTitlesForTabs(songDetail, prefLangFromSearch: prefferedLangFromSearch);

    loadFontSize();
  }

  void getTitlesForTabs(SongDetail song, {String? prefLangFromSearch}) {
    //get the tabs titles
    tabItemsSongs.value = song.text.keys.toList();

    if (song.chords != null) tabItemsChords.value = song.chords!.keys.toList();

    //reorder tabs accordingly preferred  lang-s
    //if it's just 1 tab - return
    if (tabItemsSongs.length == 1) return;

    // count index of first lang

    // log.e(prefLangFromSearch);
    //log.v(tabItemsSongs);
    int index = tabItemsSongs.indexWhere(
        (key) => key.startsWith(prefLangFromSearch ?? orderLang[0]));
    //log.e(index);
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

  countTabs(SongDetail song) {
    amountOfTabs.value =
        song.text.length + (song.chords != null ? song.chords!.length : 0);
    return amountOfTabs;
  }

  void loadFontSize() {
    if (box.read('fontSize') != null) fontSize.value = box.read('fontSize');
  }

  altFontSize(double val) {
    fontSize.value = val;
    box.write('fontSize', val);
  }
}
