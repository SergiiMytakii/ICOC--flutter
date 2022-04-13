import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../../index.dart';

class MyExtPlayer extends StatefulWidget {
  final Resources video;
  final bool playNextOn;
  const MyExtPlayer({Key? key, required this.video, this.playNextOn = true})
      : super(key: key);
  @override
  MyExtPlayerState createState() => MyExtPlayerState();
}

class MyExtPlayerState extends State<MyExtPlayer> {
  //late VideoPlayerController _controller;
  final GetxVideoPlayerController getxController = Get.find();
  String videoId = '';

  @override
  void initState() {
    super.initState();
    videoId = VideoPlayerController.getIdFromUrl(widget.video.link);
    log.d(videoId);

    init();
  }

  void init() {
    getxController.fetchRelatedVideos(videoId);
    getxController.myVideoExtPlayerController = VideoPlayerController.network(
      widget.video.link,
      youtubeVideoQuality: VideoQuality.high1440,
    );

    getxController.myVideoExtPlayerController.addListener(() {
      playNextAfterEnd();
      //setState(() {});
    });
    getxController.myVideoExtPlayerController.setPlaybackSpeed(20);
    getxController.myVideoExtPlayerController.initialize();
    getxController.myVideoExtPlayerController.play();
  }

  @override
  void dispose() {
    //WidgetsBinding.instance.
    getxController.myVideoExtPlayerController.dispose();
    log.i('dispose video controller');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: getxController.myVideoExtPlayerController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(getxController.myVideoExtPlayerController),
          _playPauseOverlay(),
          VideoProgressIndicator(
            getxController.myVideoExtPlayerController,
            allowScrubbing: true,
          ),
        ],
      ),
    );
  }

  void playNextAfterEnd() async {
    if (getxController.myVideoExtPlayerController.value.duration != null) {
      if (getxController.myVideoExtPlayerController.value.position ==
          getxController.myVideoExtPlayerController.value.duration!) {
        log.w('end');
        getxController.end.value = true;
        await Future.delayed(Duration(seconds: 1));
        if (getxController.waitingList.length > 1 && widget.playNextOn) {
          log.w(getxController.myVideoExtPlayerController.dataSource);
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
          child: getxController.myVideoExtPlayerController.value.isPlaying
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
              getxController.myVideoExtPlayerController.value.isPlaying
                  ? getxController.myVideoExtPlayerController.pause()
                  : getxController.myVideoExtPlayerController.play();
            }
          },
        ),
      ],
    );
  }
}
