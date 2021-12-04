import 'package:icoc/song_book/models/resour%D1%81es.dart';
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

  Widget _youtubePlayer(BuildContext context, Resources video) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: video.link,
                flags: YoutubePlayerFlags(
                  hideThumbnail: true,
                  //hideControls: true,
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
                        Get.back(result: video.link);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ),
              Text(
                'To lyrics'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: screensColors['songBook']),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                video.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: screensColors['songBook']),
              ),
            ],
          )
        ],
      ),
    );
  }
}
