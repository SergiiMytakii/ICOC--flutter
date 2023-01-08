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

  YoutubePlayerController youtubePlayerController = YoutubePlayerController();

  RxBool end = false.obs;
  RxString title = ''.obs;
  RxString videoIdforFavoriteStatus = ''.obs;
  @override
  void onClose() {
    miniplayerController.dispose();
    youtubePlayerController.close();
    super.onClose();
  }

  @override
  void onInit() {
    fetchFavoritesVideos();
    youtubePlayerController = YoutubePlayerController(
      params: YoutubePlayerParams(
          strictRelatedVideos: true,
          loop: true,
          mute: false,
          showControls: true,
          showFullscreenButton: true,
          enableCaption: false),
    );

    super.onInit();
  }

  Future fetchFavoritesVideos() async {
    favoritesVideos.value = await databaseHelperFTS4.fetchFavoritesVideos();
    getPlaylist();
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

  Future<void> fetchRelatedVideos(String videoId) async {
    relatedVideos.value = await YoutubeService().fetchRelatedVideos(videoId);

    //log.i(videoId + ' ' + relatedVideos.length.toString());
  }

  Future fetchVideosFromPlaylist(String playlistId) async {
    videos.value = await youtubeService.fetchVideosFromPlaylist(playlistId);
  }
}
