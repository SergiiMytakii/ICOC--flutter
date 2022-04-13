import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../../index.dart';

//uses IframeYoutubePlayer
class MyYoutubePlayer extends StatefulWidget {
  final Resources video;

  MyYoutubePlayer({
    Key? key,
    required this.video,
  }) : super(key: key);
  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer>
    with WidgetsBindingObserver {
  String videoId = '';
  //late YoutubePlayerController youtubePlayerController;
  final GetxVideoPlayerController controller = Get.find();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log.e('state = $state');
    if (state == AppLifecycleState.paused) {
      controller.youtubePlayerController.play();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
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
    //log.d('youtube player init $videoId');

    controller.youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      params: YoutubePlayerParams(
          strictRelatedVideos: true,
          playlist: controller.playlist,
          autoPlay: true,
          loop: true,
          mute: false,
          desktopMode: true,
          showControls: true,
          showFullscreenButton: true,
          enableCaption: false),
    );

    //log.i(videoId);
    controller.youtubePlayerController.cue(videoId);
    controller.youtubePlayerController.play();

    //what this does?
    controller.youtubePlayerController.listen((event) {
      if (event.metaData.title.isNotEmpty) {
        if (!controller.selectedVideo.value.link
            .contains(event.metaData.videoId)) {
          // controller.title.value = event.metaData.title;
          // controller.videoIdforFavoriteStatus.value = event.metaData.videoId;
          controller.selectedVideo.value = Resources(
              lang: '',
              title: event.metaData.title,
              link: event.metaData.videoId);

          //print(controller.selectedVideo.value.title);
        }
      }
    });

    // controller.youtubePlayerController.value
    //     .copyWith(playerState: PlayerState.playing);
    // log.e(controller.youtubePlayerController.value.playerState);

    super.initState();
  }

  @override
  void dispose() {
    log.e('player dispose');
    controller.youtubePlayerController.close();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                controller: controller.youtubePlayerController,
                gestureRecognizers:
                    <Factory<OneSequenceGestureRecognizer>>[].toSet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
