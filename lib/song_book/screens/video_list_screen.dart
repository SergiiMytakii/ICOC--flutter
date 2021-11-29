import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../index.dart';

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SongScreenController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Video & audio'.tr),
        backgroundColor: screensColors['songBook'],
      ),
      body: Obx(
        () => SingleChildScrollView(
            child: Column(
          children: [
            ...List.generate(
              controller.resourcesIds.length,
              (index) =>
                  _youtubePlayer(context, controller.resourcesIds[index]),
            )
          ],
        )),
      ),
    );
  }

  Widget _youtubePlayer(BuildContext context, String id) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          YoutubePlayer(
              // thumbnail: Text(YoutubePlayer.getThumbnail(videoId: id)),

              controller: YoutubePlayerController(
                initialVideoId: id,
                flags: YoutubePlayerFlags(
                  hideThumbnail: true,
                  hideControls: true,
                  controlsVisibleAtStart: true,
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: screensColors['songBook']),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: screensColors['songBook'],
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Get.back(result: id);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ),
              Expanded(
                  child: Text(
                'To lyrics'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: screensColors['songBook']),
              ))
            ],
          )
        ],
      ),
    );
  }
}
