import '../../../index.dart';

class FullScreenMode extends StatefulWidget {
  FullScreenMode({Key? key, required this.youtubePlayerController})
      : super(key: key);
  final YoutubePlayerController youtubePlayerController;
  @override
  State<FullScreenMode> createState() => _FullScreenModeState();
}

class _FullScreenModeState extends State<FullScreenMode> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
    widget.youtubePlayerController.play();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    //widget.youtubePlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    log.e(Get.height.toString() + ' x ' + Get.width.toString());
    log.i(widget.youtubePlayerController.value.position);
    //widget.youtubePlayerController.fitWidth(Get.size);
    widget.youtubePlayerController.fitHeight(Get.size);
    //log.i(widget.youtubePlayerController.initialVideoId);

    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          // Get.back();
          // youtubePlayerController.dispose();
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          log.i('dispose');
        },
        player: YoutubePlayer(
          controller: widget.youtubePlayerController,
        ),
        builder: (context, player) {
          return player;
        });
  }
}
