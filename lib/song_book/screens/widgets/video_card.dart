import '../../../index.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.resources, this.withToLyrics = true})
      : super(key: key);

  final Resources resources;
  final bool withToLyrics;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final VideoPlayerController controller = Get.find();
  late bool isFavorite;
  String videoId = '';
  @override
  void initState() {
    isFavorite = controller.getFavoriteStatus(widget.resources.link);
    if (widget.resources.link.isNotEmpty) {
      try {
        videoId = YoutubePlayer.convertUrlToId(widget.resources.link) ?? '';
      } on Exception catch (e) {
        showSnackbar('Error'.tr, 'Can not play video'.tr);
        print(e);
      }
    } else {
      showSnackbar('Error'.tr, 'Can not play video'.tr);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.width,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => MyYoutubePlayer(video: widget.resources),
                  transition: Transition.downToUp, fullscreenDialog: true);
            },
            child: Image.network(
              YoutubePlayer.getThumbnail(
                videoId: videoId,
              ),
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator.adaptive(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
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
                  child: Text(widget.resources.title,
                      style: Theme.of(context).textTheme.bodyText1!),
                ),
              ),
              IconButton(
                onPressed: () async {
                  isFavorite
                      ? await controller.deleteFromFavorites(widget.resources)
                      : await controller.addToFavorites(widget.resources);
                  if (widget.withToLyrics)
                    setState(() {
                      isFavorite = !isFavorite;
                      log.i(
                          widget.resources.title + " " + isFavorite.toString());
                    });
                },
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
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
      ),
    );
  }
}
