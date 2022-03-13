import 'package:icoc/index.dart';

class PlaylistPlayerController extends GetxController {
  YoutubeService youtubeService = YoutubeService();
  RxList<Resources> videos = <Resources>[].obs;
  final MiniplayerController miniplayerController = MiniplayerController();

  YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(initialVideoId: '');
  final Rx<Resources> selectedVideo =
      Resources(lang: '', title: '', link: '').obs;

  Future fetchVideosFromPlaylist(String playlistId) async {
    videos.value = await youtubeService.fetchVideosFromPlaylist(playlistId);
  }

  void onClose() {
    miniplayerController.dispose();
    super.onClose();
  }
}
