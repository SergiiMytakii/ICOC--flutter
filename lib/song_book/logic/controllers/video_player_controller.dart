import 'package:icoc/index.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GetxVideoPlayerController extends GetxController {
  YoutubeService youtubeService = YoutubeService();
  final RxList<Resources> favoritesVideos = <Resources>[].obs;
  final RxList<String> playlist = <String>[].obs;
  RxList<Resources> videos = <Resources>[].obs;
  final RxList<Resources> relatedVideos = <Resources>[].obs;
  final RxBool favoriteStatus = false.obs;
  final DatabaseHelperFTS4 databaseHelperFTS4 = DatabaseHelperFTS4();
  final Rx<Resources> selectedVideo =
      Resources(lang: '', title: '', link: '').obs;
  final MiniplayerController miniplayerController = MiniplayerController();
  RxList<Resources> waitingList = <Resources>[].obs;
  YoutubePlayerController youtubePlayerController = YoutubePlayerController();
  //for ext_player
  VideoPlayerController myVideoExtPlayerController =
      VideoPlayerController.network('');

  RxBool end = false.obs;
  RxString title = ''.obs;
  RxString videoIdforFavoriteStatus = ''.obs;
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
    getPlaylist();
    waitingList = favoritesVideos;
  }

  void getPlaylist() {
    playlist.clear();
    favoritesVideos.forEach((element) {
      playlist.add(getVideoId(element.link));
    });
    //log.d(playlist);
  }

  bool getFavoriteStatus(videoID) {
    Resources result = favoritesVideos.firstWhere(
        (element) => element.link.contains(getVideoId(videoID)),
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
    Get.showSnackbar(GetSnackBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  Future deleteFromFavorites(Resources video) async {
    await databaseHelperFTS4.deleteVideoFromFavorites(video);
    await fetchFavoritesVideos();
    Get.showSnackbar(GetSnackBar(
      duration: Duration(milliseconds: 800),
      message: 'Deleted from favorite list'.tr,
    ));
  }

//for ext_player
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
        print(element.title);
      });
    }
  }

  void fetchRelatedVideos(String videoId) async {
    relatedVideos.value = await YoutubeService().fetchRelatedVideos(videoId);

    //log.i(videoId + ' ' + relatedVideos.length.toString());
  }

//for ext_player
  void playNext() async {
    shiftWaitingList();
    selectedVideo.value = Resources(lang: '', title: '', link: '');
    Get.appUpdate();
    await Future.delayed(Duration(milliseconds: 300));
    selectedVideo.value = waitingList.first;
    log.e(myVideoExtPlayerController.dataSource + ' ' + 'playnext done');
    //myVideoExtPlayerController.play();
  }

//for ext_player
  void playPrevios() async {
    shiftWaitingListBack();

    selectedVideo.value = Resources(lang: '', title: '', link: '');
    Get.appUpdate();
    await Future.delayed(Duration(milliseconds: 300));
    selectedVideo.value = waitingList.first;
  }

//for ext_player
  void shiftWaitingListBack() {
    var temp = waitingList.removeLast();
    waitingList.insert(0, temp);
  }

  Future fetchVideosFromPlaylist(String playlistId) async {
    videos.value = await youtubeService.fetchVideosFromPlaylist(playlistId);
  }
}
