import 'package:flutter/cupertino.dart';
import 'package:icoc/song_book/logic/services/youtube_service.dart';

import '../../../index.dart';

class MyYoutubePlayer extends StatefulWidget {
  final Resources video;

  MyYoutubePlayer({
    Key? key,
    required this.video,
  }) : super(key: key);
  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  String videoId = '';
  //late YoutubePlayerController youtubePlayerController;
  final VideoPlayerController controller = Get.find();

  @override
  void initState() {
    if (widget.video.link.isNotEmpty && widget.video.link.contains('yout')) {
      try {
        videoId = YoutubePlayer.convertUrlToId(widget.video.link) ?? '';
      } on Exception catch (e) {
        showSnackbar('Error'.tr, 'Can not play video'.tr);
        print(e);
      }
    } else {
      videoId = widget.video.link;
      //showSnackbar('Error'.tr, 'Can not play video'.tr);
    }
    controller.youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        disableDragSeek: true,
        autoPlay: true,
        mute: false,
        hideControls: true,
      ),
    );
    controller.youtubePlayerController.play();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp
    // ]);
    log.i(videoId);
    controller.fetchRelatedVideos(videoId);
    super.initState();
  }

  @override
  void dispose() {
    controller.youtubePlayerController.dispose();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.isPortrait ? ThemeData.dark().canvasColor : Colors.black,
        child: Column(
          children: [
            SizedBox(
              // height: context.isLandscape ? Get.height : null,
              //width: context.isLandscape ? Get.height * 1.6 : null,
              child: YoutubePlayerBuilder(
                  onEnterFullScreen: () {
                    // kTabBarHeight = 0;
                    // youtubePlayerController.pause();
                    // Get.to(() => FullScreenMode(
                    //     youtubePlayerController: youtubePlayerController));
                  },
                  onExitFullScreen: () {
                    // kTabBarHeight = 50;
                    // youtubePlayerController.fitHeight(Get.size);
                  },
                  player: YoutubePlayer(
                      onEnded: (v) => controller.playNext(),
                      showVideoProgressIndicator: true,
                      progressColors: ProgressBarColors(
                          backgroundColor: Colors.red,
                          handleColor: Colors.amberAccent,
                          playedColor: Colors.amberAccent),
                      controller: controller.youtubePlayerController,
                      progressIndicatorColor: screensColors['songBook']),
                  builder: (context, player) {
                    //log.i(youtubePlayerController.value.position);
                    return FittedBox(
                      child: player,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
