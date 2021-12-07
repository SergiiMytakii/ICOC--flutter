import 'package:icoc/song_book/models/resour%D1%81es.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '/index.dart';

class SongScreenController extends GetxController {
  GetStorage box = GetStorage();
  RxDouble fontSize = 18.0.obs;
  var log = Logger();
  DatabaseHelperFTS4 databaseService = DatabaseHelperFTS4();
  final songDetail =
      SongDetail(id: 0, title: {}, description: {}, text: {}, chords: {}).obs;
  List<dynamic> resources = [];
  RxList<Resources> resourcesIds = <Resources>[].obs;
  int songId;
  SongScreenController({
    required this.songId,
  });

  final tabItemsSongs = [].obs;
  final tabItemsChords = [].obs;
  final OrderLangController orderLangController = Get
      .find(); //try to use instead final orderLangController = Get.find<OrderLangController>();
  List<String> orderLang = [];
  RxInt amountOfTabs = 0.obs;

  @override
  void onInit() async {
    orderLang = orderLangController.orderLang;
    await fetchSongdetail(songId);
    getTitlesForTabs();
    fetchResources(songId);
    countTabs();
    loadFontSize();
    super.onInit();
  }

  Future fetchSongdetail(int songId) async {
    songDetail.value = await databaseService.getSongDetail(songId);
  }

//take resources directly from fireBase
  Future fetchResources(int songId) async {
    print('start to get resources');
    resources = await DatabaseServiceFirebase().resources(songId);
    String? videoId;
    for (Map item in resources) {
      try {
        videoId = YoutubePlayer.convertUrlToId(item['link']);
      } on Exception catch (e) {
        showSnackbar('Error'.tr, 'Can not play video'.tr);
        print(e);
      }
      resourcesIds.add(
          Resources(lang: item['lang'], title: item['title'], link: videoId!));
    }
    print(resourcesIds.first.lang); //
    print(resourcesIds.first.title); //
    print(resourcesIds.first.link); //
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
