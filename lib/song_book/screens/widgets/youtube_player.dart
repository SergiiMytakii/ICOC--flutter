import 'package:icoc/song_book/screens/widgets/full_screen_mode.dart';

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
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log.e('run build ' + isFavorite.toString() + widget.video.title);
    return YoutubePlayerBuilder(
        onEnterFullScreen: () => Get.to(() =>
            FullScreenMode(youtubePlayerController: youtubePlayerController)),
        player: YoutubePlayer(
            controller: youtubePlayerController,
            progressIndicatorColor: screensColors['songBook']),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.withToLyrics)
                    Row(
                      children: [
                        IconButton(
                            iconSize: 20,
                            color: screensColors['songBook'],
                            onPressed: () {
                              Get.back(result: videoId);
                            },
                            icon: Icon(Icons.arrow_back)),
                        GestureDetector(
                          onTap: () {
                            Get.back(result: videoId);
                          },
                          child: Text(
                            'To lyrics'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: screensColors['songBook']),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  Expanded(
                    child: Center(
                      child: Text(widget.video.title,
                          style: Theme.of(context).textTheme.bodyText1!),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      isFavorite
                          ? await controller.deleteFromFavorites(widget.video)
                          : await controller.addToFavorites(widget.video);
                      if (widget.withToLyrics)
                        setState(() {
                          isFavorite = !isFavorite;
                          log.i(
                              widget.video.title + " " + isFavorite.toString());
                        });
                    },
                    icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: screensColors['songBook']

                        //: Theme.of(context).canvasColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              )
            ],
          );
        });
  }
}
