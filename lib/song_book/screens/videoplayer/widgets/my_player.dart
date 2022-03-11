import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../../index.dart';

class YoutubeVideo extends StatefulWidget {
  final Resources video;
  final bool playNextOn;
  const YoutubeVideo({Key? key, required this.video, this.playNextOn = true})
      : super(key: key);
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
    init();
  }

  void init() {
    getxController.fetchRelatedVideos(videoId);
    getxController.myVideoPlayerController = VideoPlayerController.network(
      widget.video.link,
      youtubeVideoQuality: VideoQuality.high1440,
    );

    getxController.myVideoPlayerController.addListener(() {
      playNextAfterEnd();
      //setState(() {});
    });
    getxController.myVideoPlayerController.initialize();
    getxController.myVideoPlayerController.play();
  }

  @override
  void dispose() {
    getxController.myVideoPlayerController.dispose();
    log.i('dispose video controller');
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
          _playPauseOverlay(),
          VideoProgressIndicator(
            getxController.myVideoPlayerController,
            allowScrubbing: true,
          ),
        ],
      ),
    );
  }

  void playNextAfterEnd() async {
    if (getxController.myVideoPlayerController.value.duration != null) {
      if (getxController.myVideoPlayerController.value.position ==
          getxController.myVideoPlayerController.value.duration!) {
        log.w('end');
        getxController.end.value = true;
        await Future.delayed(Duration(seconds: 3));
        if (getxController.waitingList.length > 1 && widget.playNextOn) {
          getxController.playNext();
          getxController.end.value = false;
        }
      }
    }
  }

  _playPauseOverlay() {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          reverseDuration: Duration(milliseconds: 200),
          child: getxController.myVideoPlayerController.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      getxController.end.value
                          ? Icons.repeat
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            if (getxController.end.value) {
              init();
            } else {
              getxController.myVideoPlayerController.value.isPlaying
                  ? getxController.myVideoPlayerController.pause()
                  : getxController.myVideoPlayerController.play();
            }
          },
        ),
      ],
    );
  }
}
