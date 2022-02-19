import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
  final GetxVideoPlayerController controller = Get.find();

  @override
  void initState() {
    if (widget.video.link.isNotEmpty && widget.video.link.contains('yout')) {
      try {
        videoId =
            YoutubePlayerController.convertUrlToId(widget.video.link) ?? '';
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
      params: YoutubePlayerParams(
        strictRelatedVideos: true,
        autoPlay: true,
        mute: false,
        showControls: true,
        playlist: controller.playlist,
        showFullscreenButton: false,
      ),
    );

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp
    // ]);
    log.i(videoId);
    controller.youtubePlayerController.cue(videoId);
    controller.youtubePlayerController.play();
    controller.fetchRelatedVideos(videoId);
    super.initState();
  }

  @override
  void dispose() {
    //controller.youtubePlayerController.dispose();
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
              child: YoutubePlayerIFrame(
                //onEnded: (v) => controller.playNext(),
                controller: controller.youtubePlayerController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
