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

    // controller.youtubePlayerController.listen((event) {
    //   if (event.metaData.title.isNotEmpty) {
    //     if (!controller.selectedVideo.value.link
    //         .contains(event.metaData.videoId)) {
    //       controller.selectedVideo.value = Resources(
    //           lang: '',
    //           title: event.metaData.title,
    //           link: event.metaData.videoId);
    //     }
    //   }
    // });

    super.initState();
  }

  @override
  void dispose() {
    log.w('player dispose');
    //controller.getPlaylist();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
        controller: controller.youtubePlayerController,
        builder: (context, player) {
          return Scaffold(
            body: Container(
                width: double.infinity,
                color: context.isPortrait
                    ? ThemeData.dark().canvasColor
                    : Colors.black,
                child: player),
          );
        });
  }
}
