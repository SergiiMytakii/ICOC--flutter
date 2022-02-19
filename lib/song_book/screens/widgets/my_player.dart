import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../index.dart';

class YoutubeVideo extends StatefulWidget {
  final Resources video;

  const YoutubeVideo({Key? key, required this.video}) : super(key: key);
  @override
  YoutubeVideoState createState() => YoutubeVideoState();
}

class YoutubeVideoState extends State<YoutubeVideo> {
  //late VideoPlayerController _controller;
  final GetxVideoPlayerController getxController = Get.find();
  String videoId = '';
  @override
  void initState() {
    super.initState();

    videoId = VideoPlayerController.getIdFromUrl(widget.video.link);

    getxController.fetchRelatedVideos(videoId);
    getxController.myVideoPlayerController = VideoPlayerController.network(
      widget.video.link,
      youtubeVideoQuality: VideoQuality.high1440,
    );

    getxController.myVideoPlayerController.addListener(() {
      playNextAfterEnd();
      setState(() {});
    });

    // getxController.myVideoPlayerController.setLooping(true);
    getxController.myVideoPlayerController.initialize();
    getxController.myVideoPlayerController.play();
  }

  @override
  void dispose() {
    getxController.myVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: getxController.myVideoPlayerController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(getxController.myVideoPlayerController),
          _PlayPauseOverlay(controller: getxController.myVideoPlayerController),
          VideoProgressIndicator(
            getxController.myVideoPlayerController,
            allowScrubbing: true,
          ),
        ],
      ),
    );
  }

  void playNextAfterEnd() {
    if (getxController.myVideoPlayerController.value.duration != null) {
      if (getxController.myVideoPlayerController.value.position ==
          getxController.myVideoPlayerController.value.duration!) {
        log.w('end');
        if (getxController.waitingList.length > 1) getxController.playNext();
      }
    }
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  _PlayPauseOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
