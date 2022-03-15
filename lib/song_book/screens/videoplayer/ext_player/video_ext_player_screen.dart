import 'dart:io';
import 'package:icoc/song_book/screens/videoplayer/ext_player/my_ext_player.dart';

import '../../../../index.dart';

//use with ext_player
class VideoPlayerScreen extends StatefulWidget {
  final SongDetail? song;
  final bool withControlPanel;
  final bool playNextOn;
  VideoPlayerScreen(
      {Key? key,
      this.song,
      this.withControlPanel = true,
      this.playNextOn = true})
      : super(key: key) {
    Wakelock.enable();
  }

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final GetxVideoPlayerController controller =
      Get.put(GetxVideoPlayerController());

  double minHeight = 60;
  bool isFavorite = true;
  bool isShuffleOn = false;
  double controlsPanelHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withControlPanel) {
      controlsPanelHeight = 50;
    }
    return Stack(children: [
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
                  maxHeight: MediaQuery.of(context).size.height -
                      80 -
                      (Platform.isIOS ? 47 : 0),
                  builder: (height, percentage) {
                    if (controller.selectedVideo.value.link.isEmpty)
                      return SizedBox.shrink();
                    double fullSizePlayerHeight = Get.width / 16 * 9;
                    double currentPlayerWidth = height * 16 / 9;

                    return Column(
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
                              child:
                                  controller.selectedVideo.value.link.isNotEmpty
                                      ? MyExtPlayer(
                                          playNextOn: widget.playNextOn,
                                          // ? MyYoutubePlayer(
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
                        if (height > Get.height / 1.5 &&
                            widget.withControlPanel)
                          controlsPanel(context, height, fullSizePlayerHeight),
                        if (height > Get.height / 1.5)
                          currentVideoInfo(
                              context, height, fullSizePlayerHeight),
                        if (height > fullSizePlayerHeight)
                          _relatedVideosList(height, fullSizePlayerHeight)
                      ],
                    );
                  }),
            )),
      ),
    ]);
  }

  AnimatedContainer currentVideoInfo(
      BuildContext context, double height, double fullSizePlayerHeight) {
    isFavorite =
        controller.getFavoriteStatus(controller.selectedVideo.value.link);
    return AnimatedContainer(
      height: height > Get.height - fullSizePlayerHeight ? 50 : 0,
      duration: Duration(milliseconds: 800),
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
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                color: screensColors['songBook']),
          ),
        ],
      ),
    );
  }

  AnimatedContainer controlsPanel(
      BuildContext ctx, double height, double fullSizePlayerHeight) {
    //log.i(controller.myVideoExtPlayerController.value.isPlaying);
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Theme.of(ctx).scaffoldBackgroundColor,
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey, width: 1))),
      height:
          height > Get.height - fullSizePlayerHeight ? controlsPanelHeight : 0,
      duration: Duration(milliseconds: 800),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              controller.playPrevios();
            },
            icon: Icon(
              Icons.skip_previous,
              color: screensColors['songBook'],
            ),
          ),
          controller.myVideoExtPlayerController.value.isPlaying
              ? IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () async {
                    controller.myVideoExtPlayerController.pause();
                    setState(() {});
                  },
                  color: screensColors['songBook'],
                )
              : IconButton(
                  onPressed: () {
                    controller.myVideoExtPlayerController.play();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: screensColors['songBook'],
                  ),
                ),
          IconButton(
            onPressed: () {
              controller.playNext();
            },
            icon: Icon(
              Icons.skip_next,
              color: screensColors['songBook'],
            ),
          ),
          IconButton(
            onPressed: () {
              isShuffleOn
                  ? controller.waitingList = controller.favoritesVideos
                  : controller.waitingList.shuffle();
              setState(() {
                isShuffleOn = !isShuffleOn;
              });
              controller.waitingList.forEach((element) {
                print(element.title);
              });
            },
            icon: Icon(
              isShuffleOn ? Icons.shuffle_on_outlined : Icons.shuffle,
              color: screensColors['songBook'],
            ),
          ),
        ],
      ),
    );
  }

  Widget miniplayerControls() {
    return Row(
      children: [
        controller.myVideoExtPlayerController.value.isPlaying
            ? IconButton(
                icon: Icon(Icons.pause),
                onPressed: () async {
                  controller.myVideoExtPlayerController.pause();
                  await runAnimation();
                },
                color: screensColors['songBook'],
              )
            : IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  controller.myVideoExtPlayerController.play();
                  runAnimation();
                },
                color: screensColors['songBook'],
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

  Widget _relatedVideosList(double height, double fullSizePlayerHeight) {
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
