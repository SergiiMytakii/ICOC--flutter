import 'package:icoc/song_book/logic/controllers/video_player_controller.dart';

import '../../index.dart';

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);
  final VideoPlayerController controller = Get.put(VideoPlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favorite video'.tr),
        backgroundColor: screensColors['songBook'],
      ),
      body: Obx(() => ListView.builder(
            itemBuilder: (context, index) => MyYoutubePlayer(
              withToLyrics: false,
              video: controller.favoritesVideos[index],
            ),
            itemCount: controller.favoritesVideos.length,
          )),
    );
  }
}
