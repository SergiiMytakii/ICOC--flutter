import 'dart:io';

import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../../../index.dart';

class YotubePlaylistPlayerScreen extends StatefulWidget {
  YotubePlaylistPlayerScreen({
    Key? key,
  }) : super(key: key) {
    Wakelock.enable();
  }

  final String playlistId = Get.arguments[0] ?? '';
  final String title = Get.arguments[1] ?? '';
  final Color color = Get.arguments[2] ?? '';

  @override
  State<YotubePlaylistPlayerScreen> createState() =>
      _YotubePlaylistPlayerScreenState();
}

class _YotubePlaylistPlayerScreenState
    extends State<YotubePlaylistPlayerScreen> {
  final GetxVideoPlayerController controller =
      Get.put(GetxVideoPlayerController());

  double minHeight = 60;
  double controlsPanelHeight = 0;

  @override
  void initState() {
    controller.fetchVideosFromPlaylist(widget.playlistId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title.tr),
            backgroundColor: widget.color,
            // leading: IconButton(
            //     icon: Icon(
            //       Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
            //     ),
            //     onPressed: () {
            //       Navigator.pop(context);
            //       //Navigator.pop(context);
            //     }),
          ),
          body: Obx(() {
            int length = controller.videos.length;

            return length > 0
                ? ListView.builder(
                    itemBuilder: (context, index) => VideoCardTeaching(
                      resources: controller.videos[index],
                    ),
                    itemCount: length,
                  )
                : Loading();
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
                                            video:
                                                controller.selectedVideo.value)
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
                                currentVideoInfo(
                                  context,
                                ),
                            ],
                          ));
                    }),
              )),
        ),
      ]),
    );
  }

  Widget currentVideoInfo(BuildContext context) {
    var formatter = new DateFormat('dd MMMM yyyy');
    String formattedDate = formatter
        .format(DateTime.parse(controller.selectedVideo.value.publishedAt!));
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(controller.selectedVideo.value.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!),
            SizedBox(
              height: 16,
            ),
            if (controller.selectedVideo.value.publishedAt != null)
              Text(formattedDate,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!),
            SizedBox(
              height: 16,
            ),
            if (controller.selectedVideo.value.description != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(controller.selectedVideo.value.description!,
                      style: Theme.of(context).textTheme.bodyText1!),
                ),
              ),
          ],
        ),
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
                  color: widget.color),
              onPressed: () {
                value.playerState == PlayerState.playing
                    ? context.ytController.pauseVideo()
                    : context.ytController.playVideo();
                runAnimation();
              },
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.close),
          color: widget.color,
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
}
