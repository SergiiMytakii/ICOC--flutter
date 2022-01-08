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
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    if (widget.video.link.isNotEmpty) {
      try {
        videoId = YoutubePlayer.convertUrlToId(widget.video.link) ?? '';
      } on Exception catch (e) {
        showSnackbar('Error'.tr, 'Can not play video'.tr);
        print(e);
      }
    } else {
      showSnackbar('Error'.tr, 'Can not play video'.tr);
    }
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //log.e('run build ' + widget.video.title + '  ');
    return Scaffold(
      // appBar: context.isPortrait
      //     ? AppBar(
      //         title: Text(widget.video.title),
      //         backgroundColor: screensColors['songBook'],
      //         centerTitle: true,
      //       )
      //     : null,
      body: Container(
        color: context.isPortrait ? ThemeData.dark().canvasColor : Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: context.isLandscape
                  ? MediaQuery.of(context).size.height
                  : null,
              width: context.isLandscape
                  ? (MediaQuery.of(context).size.height * 1.6)
                  : null,
              child: YoutubePlayerBuilder(
                  onEnterFullScreen: () {
                    log.e(MediaQuery.of(context).size.height.toString() +
                        ' x ' +
                        MediaQuery.of(context).size.width.toString());
                  },
                  player: YoutubePlayer(
                      controller: youtubePlayerController,
                      progressIndicatorColor: screensColors['songBook']),
                  builder: (context, player) {
                    //log.i(youtubePlayerController.value.position);
                    return Column(
                      children: [
                        player,
                      ],
                    );
                  }),
            ),
            //Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
