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
        body: Obx(() => Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: ListView.builder(
                itemBuilder: (context, index) => VideoCard(
                  withToLyrics: false,
                  resources: controller.favoritesVideos[index],
                ),
                itemCount: controller.favoritesVideos.length,
              ),
            )),
      ),
      Positioned(
        width: Get.size.width,
        bottom: 0,
        child: Obx(() => Offstage(
              offstage: controller.selectedVideo.value.link.isEmpty,
              child: Miniplayer(
                  controller: controller.miniplayerController,
                  minHeight: 60,
                  maxHeight: MediaQuery.of(context).size.height,
                  builder: (height, percentage) {
                    if (controller.selectedVideo.value.link.isEmpty)
                      return SizedBox.shrink();
                    final videoId = YoutubePlayer.convertUrlToId(
                            controller.selectedVideo.value.link) ??
                        '';
                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Row(
                        children: [
                          SizedBox(
                            height: height,
                            width: height * 16 / 9 < Get.size.width
                                ? height * 16 / 9
                                : Get.size.width,
                            child: MyYoutubePlayer(
                                video: controller.selectedVideo.value),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Center(
                              child: Text(
                                controller.selectedVideo.value.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )),
                          if (height < 100)
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {},
                                  color: screensColors['songBook'],
                                ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  color: screensColors['songBook'],
                                  onPressed: () {
                                    controller.selectedVideo.value = Resources(
                                        lang: '', title: '', link: '');
                                  },
                                )
                              ],
                            ),
                        ],
                      ),
                    );
                  }),
            )),
      ),
    ]);
  }
}
