import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:icoc/song_book/screens/video_list_screen.dart';
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
  String videoId = '';
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
              Obx(
                () => controller.resources.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.video_collection,
                        ),
                        onPressed: () async {
                          await Get.to(VideoListScreen())?.then((value) {
                            setState(() {
                              videoId = value;
                              showVideos = !showVideos;
                            });
                          });
                        },
                      )
                    : Container(),
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
            alignment: Alignment.bottomCenter,
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
                  width: Get.width,
                  //bottom: 0,
                  child: Stack(children: [
                    Miniplayer(
                        minHeight: 80,
                        maxHeight: Get.size.height / 3,
                        builder: (height, percentage) {
                          print(videoId);
                          return YoutubePlayer(
                            width: Get.width,
                            controller: YoutubePlayerController(
                              initialVideoId: videoId,
                              flags: YoutubePlayerFlags(
                                hideControls: true,
                                controlsVisibleAtStart: true,
                                mute: false,
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      right: 0,
                      child: IconButton(
                          color: screensColors['songBook'],
                          onPressed: () {
                            setState(() {
                              showVideos = false;
                            });
                          },
                          icon: Icon(Icons.close_outlined)),
                    )
                  ]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
