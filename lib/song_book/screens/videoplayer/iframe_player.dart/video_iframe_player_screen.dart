import '../../../../index.dart';

//use with ext_player
class VideoIframePlayerScreen extends StatefulWidget {
  final SongDetail? song;

  final bool playNextOn;
  VideoIframePlayerScreen({Key? key, this.song, this.playNextOn = true})
      : super(key: key) {
    Wakelock.enable();
  }

  @override
  State<VideoIframePlayerScreen> createState() => _VideoIframePlayerState();
}

class _VideoIframePlayerState extends State<VideoIframePlayerScreen> {
  final GetxVideoPlayerController controller =
      Get.put(GetxVideoPlayerController());

  double minHeight = 60;
  bool isFavorite = true;
  bool isShuffleOn = false;
  double controlsPanelHeight = 0;
  String videoId = '';
  String title = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.youtubePlayerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                widget.song != null ? 'Video & audio'.tr : 'Favorite video'.tr),
            backgroundColor: screensColors['songBook'],
            //   leading: IconButton(
            //       icon: Icon(
            //         Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
            //       ),
            //       tooltip: 'icon_button_actions_app_bar_filter'.tr,
            //       onPressed: () {
            //         Get.back(canPop: false);
            //         // Navigator.pop(context);
            //         //Navigator.pop(context);
            //       }),
          ),
          body: Obx(() {
            int length = controller.favoritesVideos.length;
            return length > 0 || widget.song != null
                ? ListView.builder(
                    itemBuilder: (context, index) => VideoCard(
                      withToLyrics: widget.song != null ? true : false,
                      resources: widget.song != null
                          ? widget.song!.resources![index]
                          : controller.favoritesVideos[index],
                    ),
                    itemCount: widget.song != null
                        ? widget.song!.resources!.length
                        : length,
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Go to all songs and add some videos from there'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ));
          }),
        ),
        Positioned(
          width: Get.size.width,
          bottom: 0,
          child: Obx(() => Offstage(
                offstage: controller.selectedVideo.value.link.isEmpty,
                child: Miniplayer(
                    controller: controller.miniplayerController,
                    minHeight: minHeight,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    maxHeight: MediaQuery.of(context).size.height - 80 - 47,
                    // (Platform.isIOS ? 47 : 0),
                    builder: (height, percentage) {
                      if (controller.selectedVideo.value.link.isEmpty)
                        return SizedBox.shrink();
                      double fullSizePlayerHeight = Get.width / 16 * 9;
                      double currentPlayerWidth = height * 16 / 9;

                      return YoutubePlayerControllerProvider(
                        controller: controller.youtubePlayerController,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: fullSizePlayerHeight < height
                                      ? fullSizePlayerHeight
                                      : height,
                                  width: currentPlayerWidth < Get.width
                                      ? currentPlayerWidth
                                      : Get.width,
                                  child: controller
                                          .selectedVideo.value.link.isNotEmpty
                                      ? MyYoutubePlayer(
                                          video: controller.selectedVideo.value)
                                      : Container(),
                                ),
                                if (height < 150)
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Center(
                                      child: Text(
                                        controller.selectedVideo.value.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )),
                                if (height < 100) miniplayerControls(),
                              ],
                            ),
                            if (height > Get.height / 1.5)
                              currentVideoInfo(
                                  context, height, fullSizePlayerHeight),
                            if (height > fullSizePlayerHeight)
                              _relatedVideosList()
                          ],
                        ),
                      );
                    }),
              )),
        ),
      ]),
    );
  }

  AnimatedContainer currentVideoInfo(
      BuildContext context, double height, double fullSizePlayerHeight) {
    isFavorite =
        controller.getFavoriteStatus(controller.selectedVideo.value.link);
    // log.e(isFavorite);
    return AnimatedContainer(
      height: height > Get.height - fullSizePlayerHeight ? 65 : 0,
      duration: Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(controller.selectedVideo.value.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    isFavorite
                        ? await controller
                            .deleteFromFavorites(controller.selectedVideo.value)
                        : await controller
                            .addToFavorites(controller.selectedVideo.value);

                    setState(() {
                      // isFavorite = !isFavorite;
                      // log.i(widget.resources.title + " " + isFavorite.toString());
                    });
                  },
                  icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: screensColors['songBook']),
                ),
              ],
            ),
          ),
          if (controller.relatedVideos.isNotEmpty)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Related videos'.tr,
                  style: TextStyle(color: screensColors['songBook']),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget miniplayerControls() {
    return Row(
      children: [
        YoutubeValueBuilder(
          controller: controller
              .youtubePlayerController, // This can be omitted, if using `YoutubePlayerControllerProvider`
          builder: (context, value) {
            return IconButton(
              icon: Icon(
                  value.playerState == PlayerState.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: screensColors['songBook']),
              onPressed: value.isReady
                  ? () {
                      value.playerState == PlayerState.playing
                          ? context.ytController.pause()
                          : context.ytController.play();
                      runAnimation();
                    }
                  : null,
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.close),
          color: screensColors['songBook'],
          onPressed: () {
            controller.selectedVideo.value =
                Resources(lang: '', title: '', link: '');
          },
        )
      ],
    );
  }

  Future<void> runAnimation() async {
    controller.miniplayerController.animateToHeight(
      height: minHeight + 10,
    );
    await Future.delayed(Duration(milliseconds: 100));
    controller.miniplayerController.animateToHeight(
      height: minHeight,
    );
  }

  Widget _relatedVideosList() {
    return Expanded(
      child: Obx(() => ListView.builder(
          itemCount: controller.relatedVideos.length,
          itemBuilder: (context, index) {
            return VideoCard(
              withToLyrics: false,
              resources: controller.relatedVideos[index],
            );
          })),
    );
  }
}
