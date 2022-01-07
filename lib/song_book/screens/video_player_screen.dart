import 'dart:io';

import 'package:icoc/song_book/logic/controllers/video_player_controller.dart';

import '../../index.dart';

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);
  final VideoPlayerController controller = Get.put(VideoPlayerController());
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Favorite video'.tr),
          backgroundColor: screensColors['songBook'],
          leading: IconButton(
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
              ),
              tooltip: 'icon_button_actions_app_bar_filter'.tr,
              onPressed: () {
                Get.back();
              }),
        ),
        body: Obx(() => ListView.builder(
              itemBuilder: (context, index) => VideoCard(
                withToLyrics: false,
                resources: controller.favoritesVideos[index],
              ),
              itemCount: controller.favoritesVideos.length,
            )),
      ),
      Positioned(
        width: Get.size.width,
        bottom: 50,
        child: Miniplayer(
            minHeight: 80,
            maxHeight: MediaQuery.of(context).size.height,
            builder: (height, percentage) {
              return Container(
                width: Get.size.width,
                color: Colors.amber,
              );
            }),
      ),
    ]);
  }
}
