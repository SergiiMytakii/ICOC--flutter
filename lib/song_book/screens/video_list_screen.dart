import 'package:icoc/song_book/models/resources.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../index.dart';

class VideoListScreen extends StatelessWidget {
  final log = Logger();
  final SongScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: Text('Video & audio'.tr),
              backgroundColor: screensColors['songBook'],
            )
          : null,
      body: Obx(
        () => SingleChildScrollView(
            child: Column(
          children: [
            ...List.generate(
              controller.resourcesIds.length,
              (index) => _youtubePlayer(
                context,
                controller.resourcesIds[index],
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget _youtubePlayer(BuildContext context, Resources video) {
    log.e(context.isLandscape);
    YoutubePlayerController youtubePlayerController = YoutubePlayerController(
      initialVideoId: video.link,
      flags: YoutubePlayerFlags(
        forceHD: context.isPortrait ? false : true,
        //controlsVisibleAtStart: true,
        autoPlay: false,
        mute: false,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
              onEnded: (metaData) {
                if (MediaQuery.of(context).orientation == Orientation.landscape)
                  youtubePlayerController.toggleFullScreenMode();
              },
              controller: youtubePlayerController,
              //showVideoProgressIndicator: true,
              progressIndicatorColor: screensColors['songBook']),
          builder: (context, player) {
            return context.isPortrait
                ? Column(
                    children: [
                      player,
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
                          Expanded(
                            child: Text(
                              video.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: screensColors['songBook']),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Container();
          }),
    );
  }
}
