import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
  void initState() {
    //WidgetsBinding.instance.addObserver(this);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp
    // ]);
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
    log.d('youtube player init ${widget.video.title}.  videoId $videoId');

    // controller.youtubePlayerController = YoutubePlayerController(
    //   params: YoutubePlayerParams(
    //       strictRelatedVideos: true,
    //       loop: true,
    //       mute: false,
    //       showControls: true,
    //       showFullscreenButton: true,
    //       enableCaption: false),
    // );

    log.i(videoId);

    // controller.youtubePlayerController.loadPlaylist(
    //   list: controller.playlist.value,
    //   listType: ListType.playlist,
    // );
    //controller.youtubePlayerController.loadVideoById(videoId: videoId);
    controller.youtubePlayerController.listen((event) {
      if (event.metaData.title.isNotEmpty) {
        if (!controller.selectedVideo.value.link
            .contains(event.metaData.videoId)) {
          controller.selectedVideo.value = Resources(
              lang: '',
              title: event.metaData.title,
              link: event.metaData.videoId);
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    log.w('player dispose');
    //controller.youtubePlayerController.close();
    controller.getPlaylist();
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
              child: YoutubePlayer(
                controller: controller.youtubePlayerController,
                // gestureRecognizers:
                //     <Factory<OneSequenceGestureRecognizer>>[].toSet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
