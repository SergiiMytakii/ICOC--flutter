import '../../../index.dart';

class MyYoutubePlayer extends StatefulWidget {
  final Resources video;
  final bool withToLyrics;
  MyYoutubePlayer({Key? key, required this.video, this.withToLyrics = true})
      : super(key: key);
  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  String videoId = '';
  late YoutubePlayerController youtubePlayerController;
  final VideoPlayerController controller = Get.find();
  late bool isFavorite;
  @override
  void initState() {
    isFavorite = controller.getFavoriteStatus(widget.video.link);
    log.e('run init state');
    if (widget.video.link.isNotEmpty && widget.video.link.contains('youtu')) {
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
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log.e('run build ' + isFavorite.toString() + widget.video.title);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
              onEnded: (metaData) {
                if (MediaQuery.of(context).orientation == Orientation.landscape)
                  youtubePlayerController.toggleFullScreenMode();
              },
              controller: youtubePlayerController,
              //showVideoProgressIndicator: true,
              progressIndicatorColor: screensColors['songBook']),
          builder: (context, player) {
            return context.isPortrait
                ? Column(
                    children: [
                      player,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.withToLyrics)
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: screensColors['songBook'],
                                    child: IconButton(
                                        iconSize: 16,
                                        color: Colors.white,
                                        onPressed: () {
                                          Get.back(result: videoId);
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                  ),
                                ),
                                Text(
                                  'To lyrics'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: screensColors['songBook']),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          Expanded(
                            child: Center(
                              child: Text(widget.video.title,
                                  style:
                                      Theme.of(context).textTheme.bodyText1!),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              isFavorite
                                  ? await controller
                                      .deleteFromFavorites(widget.video)
                                  : await controller
                                      .addToFavorites(widget.video);
                              if (widget.withToLyrics)
                                setState(() {
                                  isFavorite = !isFavorite;
                                  log.i(widget.video.title +
                                      " " +
                                      isFavorite.toString());
                                });
                            },
                            icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: screensColors['songBook']

                                //: Theme.of(context).canvasColor,
                                ),
                          ),
                        ],
                      )
                    ],
                  )
                : Container();
          }),
    );
  }
}
