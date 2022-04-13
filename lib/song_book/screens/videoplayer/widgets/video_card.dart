import '../../../../index.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.resources, this.withToLyrics = true})
      : super(key: key);

  final Resources resources;
  final bool withToLyrics;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final GetxVideoPlayerController controller = Get.find();

  late bool isFavorite;
  String videoId = '';
  @override
  void initState() {
    isFavorite = controller.getFavoriteStatus(widget.resources.link);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    videoId = getVideoId(widget.resources.link);
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return Column(
      children: [
        InkWell(
          onTap: () async {
            log.e('card tapped' + controller.selectedVideo.value.title);
            if (controller.selectedVideo.value.link.isEmpty) {
              controller.miniplayerController.animateToHeight(
                  state: PanelState.MAX, duration: Duration(milliseconds: 700));
            } else {
              controller.youtubePlayerController.reset();
              controller.selectedVideo.value =
                  Resources(lang: '', title: '', link: '');
              Get.appUpdate();
              await Future.delayed(Duration(milliseconds: 300));
            }
            controller.selectedVideo.value = widget.resources;
            controller.fetchRelatedVideos(videoId);
            controller.playlist
                .insert(0, getVideoId(controller.selectedVideo.value.link));

            log.e(controller.playlist);
          },
          child: Container(
            width: double.maxFinite,
            child: Image.network(
              widget.resources.thumbnail ??
                  YoutubePlayerController.getThumbnail(
                    videoId: videoId,
                  ),
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: myDarkTheme.scaffoldBackgroundColor,
                  child: Image.asset('assets/images/logo_icoc_drawer.png',
                      fit: BoxFit.fitWidth),
                );
              },
              height: Get.width / 16 * 9,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.withToLyrics
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context, [videoId]);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: screensColors['songBook'],
                        ),
                        Text(
                          'To lyrics'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: screensColors['songBook']),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 16,
                  ),
            Expanded(
              child: Text(widget.resources.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!),
            ),
            IconButton(
              onPressed: () async {
                isFavorite
                    ? await controller.deleteFromFavorites(widget.resources)
                    : await controller.addToFavorites(widget.resources);

                // if (widget.withToLyrics) {
                setState(() {
                  isFavorite = !isFavorite;
                  // log.i(widget.resources.title + " " + isFavorite.toString());
                });
                // }
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: screensColors['songBook']

                  //: Theme.of(context).canvasColor,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

String getVideoId(String link) {
  //if you use Youtube_player or youtube iFrame player
  if (link.isNotEmpty && link.contains('yout')) {
    try {
      return YoutubePlayerController.convertUrlToId(link) ?? '';
    } on Exception catch (e) {
      showSnackbar('Error'.tr, 'Can not play video'.tr);
      print(e);
      return '';
    }
  } else {
    return link;
    // log.v(videoId);
  }
}
