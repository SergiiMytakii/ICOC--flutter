import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../index.dart';

class SongScreen extends StatefulWidget {
  SongScreen() {
    Wakelock.enable();
  }

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  bool showVideos = false;
  @override
  Widget build(BuildContext context) {
    final songId = Get.arguments != null ? Get.arguments[0] : 1;
    final controller = Get.put(SongScreenController(songId: songId));

    favoritesController.getFavoriteStatus(songId);
    final SlidesController slidesController = Get.put(SlidesController());
    var fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context, controller: controller, color: 'songBook');
    return Obx(
      () => DefaultTabController(
        length: controller.amountOfTabs.value,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: screensColors['songBook'],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (final item in controller.tabItemsSongs) Tab(text: item),
                for (final item in controller.tabItemsChords) Tab(text: item),
              ],
            ),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.video_collection,
                ),
                onPressed: () {
                  setState(() {
                    showVideos = !showVideos;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () {
                  String song = slidesController.slideTitle.value +
                      '\n\n' +
                      slidesController.slideText.value;
                  Share.share(song);
                },
              ),
              IconButton(
                icon: Icon(
                  favoritesController.favStatus.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () => favoritesController.toggleFavStatus(songId),
              ),
              IconButton(
                  icon: Icon(
                    Icons.text_fields_outlined,
                  ),
                  onPressed: () => fontSozeAdjust.bottomSheet()),
              IconButton(
                icon: Icon(Icons.slideshow_outlined),
                onPressed: () {
                  slidesController.getFirstSlide();
                  Get.toNamed(
                    Routes.SLIDES_SCREEN,
                  );
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  for (final item in controller.tabItemsSongs)
                    SongTextOnSongScreen(
                      title: controller
                              .songDetail.value.title[item.substring(0, 2)] ??
                          '',
                      textVersion: controller.songDetail.value.text[item] ?? '',
                      description: controller.songDetail.value
                              .description[item.substring(0, 2)] ??
                          '',
                      controller: controller,
                    ),
                  for (final item in controller.tabItemsChords)
                    SongTextOnSongScreen(
                      title: '',
                      description: '',
                      textVersion: controller.songDetail.value.chords[item],
                      controller: controller,
                    ),
                ],
              ),
              if (showVideos)
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 300,
                      width: Get.size.width,
                      child: Obx(
                        () => SingleChildScrollView(
                            child: Column(
                          children: [
                            ...List.generate(
                              controller.resourcesIds.length,
                              (index) => _youtubePlayer(
                                  context, controller.resourcesIds[index]),
                            )
                          ],
                        )),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _youtubePlayer(BuildContext context, String id) {
    return Miniplayer(
        backgroundColor: Colors.transparent,
        minHeight: 70,
        maxHeight: 300,
        builder: (height, percentage) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: YoutubePlayer(
                  thumbnail: Text(YoutubePlayer.getThumbnail(videoId: id)),
                  controller: YoutubePlayerController(
                    initialVideoId: id,
                    flags: YoutubePlayerFlags(
                      hideThumbnail: true,
                      //hideControls: true,
                      controlsVisibleAtStart: true,
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: screensColors['songBook']),
            ));
  }
}
