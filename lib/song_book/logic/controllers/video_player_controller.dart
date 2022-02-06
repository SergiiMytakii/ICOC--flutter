import 'dart:io';

import 'package:icoc/index.dart';
import 'package:icoc/song_book/logic/services/youtube_service.dart';

class VideoPlayerController extends GetxController {
  final RxList<Resources> favoritesVideos = <Resources>[].obs;
  final RxList<Resources> relatedVideos = <Resources>[].obs;
  final RxBool favoriteStatus = false.obs;
  final DatabaseHelperFTS4 databaseHelperFTS4 = DatabaseHelperFTS4();
  final Rx<Resources> selectedVideo =
      Resources(lang: '', title: '', link: '').obs;
  final MiniplayerController miniplayerController = MiniplayerController();
  RxList<Resources> waitingList = <Resources>[].obs;
  YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(initialVideoId: '');

  @override
  void onClose() {
    miniplayerController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    fetchFavoritesVideos();

    super.onInit();
  }

  Future fetchFavoritesVideos() async {
    favoritesVideos.value = await databaseHelperFTS4.fetchFavoritesVideos();
    waitingList = favoritesVideos;
  }

  bool getFavoriteStatus(videoID) {
    Resources result = favoritesVideos.firstWhere(
        (element) => element.link.contains(videoID),
        orElse: () => Resources(link: '', lang: '', title: ''));
    if (result.link.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future addToFavorites(Resources video) async {
    await databaseHelperFTS4.addVideoToFavorites(video);
    await fetchFavoritesVideos();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  Future deleteFromFavorites(Resources video) async {
    await databaseHelperFTS4.deleteVideoFromFavorites(video);
    await fetchFavoritesVideos();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Deleted from favorite list'.tr,
    ));
  }

  void shiftWaitingList({Resources? selectedV}) {
    bool shift = true;
    favoritesVideos.forEach((element) {
      if (selectedV != null && !element.link.contains(selectedV.link)) {
        shift = false;
      }
    });
    //log.e(shift);
    if (shift) {
      if (selectedV != null) {
        waitingList.removeWhere((element) => element.link == selectedV.link);
        waitingList.insert(waitingList.length, selectedV);
      } else {
        var temp = waitingList.removeAt(0);
        waitingList.insert(waitingList.length, temp);
      }
      waitingList.forEach((element) {
        // log.e(element.title);
      });
    }
  }

  void fetchRelatedVideos(String videoId) async {
    relatedVideos.value =
        await YoutubeService().fetchRelatedVideos(videoId) ?? [];
  }

  void playNext() {
    shiftWaitingList();
    // waitingList.shuffle();
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(waitingList[0].link) ?? '');
  }

  void playPrevios() {
    shiftWaitingListBack();
    // waitingList.shuffle();
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(waitingList[0].link) ?? '');
  }

  void shiftWaitingListBack() {
    var temp = waitingList.removeLast();
    waitingList.insert(0, temp);
  }
}
