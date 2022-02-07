import 'dart:io';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../index.dart';

//we use it in wideoplayer tab and in every song to show videos for this song
class VideoPlayerScreen extends StatefulWidget {
  final SongDetail? song;
  VideoPlayerScreen({Key? key, this.song}) : super(key: key) {
    Wakelock.enable();
  }

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final VideoPlayerController controller = Get.put(VideoPlayerController());

  double controlsBarHeight = 50;

  double minHeight = 60;
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              widget.song != null ? 'Video & audio'.tr : 'Favorite video'.tr),
          backgroundColor: screensColors['songBook'],
          leading: IconButton(
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
              ),
              tooltip: 'icon_button_actions_app_bar_filter'.tr,
              onPressed: () {
                Get.back();
              }),
        ),
        body: Obx(() {
          int length = controller.favoritesVideos.length;
          return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: ListView.builder(
              itemBuilder: (context, index) => VideoCard(
                withToLyrics: widget.song != null ? true : false,
                resources: widget.song != null
                    ? widget.song!.resources![index]
                    : controller.favoritesVideos[index],
              ),
              itemCount:
                  widget.song != null ? widget.song!.resources!.length : length,
            ),
          );
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
                  maxHeight: MediaQuery.of(context).size.height - 80,
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
                        if (height > Get.height / 2)
                          controlsPanel(height, fullSizePlayerHeight),
                        if (height > Get.height / 2 + 100)
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
    return AnimatedContainer(
      height: height > Get.height - fullSizePlayerHeight ? 50 : 0,
      duration: Duration(milliseconds: 400),
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
                isFavorite = !isFavorite;
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

  AnimatedContainer controlsPanel(double height, double fullSizePlayerHeight) {
    log.i(controller.youtubePlayerController.value.playerState ==
        PlayerState.playing);
    return AnimatedContainer(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey, width: 1))),
      height: height > Get.height - fullSizePlayerHeight ? 50 : 0,
      duration: Duration(milliseconds: 400),
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
          controller.youtubePlayerController.value.playerState ==
                  PlayerState.playing
              ? IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () async {
                    controller.youtubePlayerController.pause();
                    setState(() {});
                    //    controller.miniplayerController.animateToHeight(height:
                    //     + 15,
                    // );
                    // await Future.delayed(Duration(milliseconds: 100));
                    // controller.miniplayerController.animateToHeight(
                    //   height: minHeight,
                    // );
                  },
                  color: screensColors['songBook'],
                )
              : IconButton(
                  onPressed: () {
                    controller.youtubePlayerController.play();
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
              controller.waitingList.shuffle();
              controller.waitingList.forEach((element) {
                print(element.title);
              });
            },
            icon: Icon(
              Icons.shuffle,
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
        controller.youtubePlayerController.value.playerState ==
                PlayerState.playing
            ? IconButton(
                icon: Icon(Icons.pause),
                onPressed: () async {
                  controller.youtubePlayerController.pause();
                  controller.miniplayerController.animateToHeight(
                    height: minHeight + 15,
                  );
                  await Future.delayed(Duration(milliseconds: 100));
                  controller.miniplayerController.animateToHeight(
                    height: minHeight,
                  );
                },
                color: screensColors['songBook'],
              )
            : IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  controller.youtubePlayerController.play();
                  controller.miniplayerController
                      .animateToHeight(height: minHeight + 15);
                  await Future.delayed(Duration(milliseconds: 100));
                  controller.miniplayerController
                      .animateToHeight(height: minHeight);
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

  Widget _relatedVideosList(double height, double fullSizePlayerHeight) {
    double countControlsHeight = 0;
    if (height > Get.height / 2) {
      countControlsHeight = 100;
    }
    double listViewHeight = height - fullSizePlayerHeight - countControlsHeight;
    listViewHeight = listViewHeight < 0 ? 0 : listViewHeight;

    return Container(
      height: listViewHeight,
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
