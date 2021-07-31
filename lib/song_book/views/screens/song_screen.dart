import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/song_screen_controller.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:Projects/song_book/views/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class SongScreen extends GetView<SongScreenController> {
  final int songId;
  final SongsController songsController;

  SongScreen({required this.songId, required this.songsController});

  //get current favorite status

  @override
  Widget build(BuildContext context) {
    Get.put(SongScreenController(songId: songId));
    print('build');

    return Obx(
      () => DefaultTabController(
        length: controller.amountOfTabs.value,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.screensColors['songBook'],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (final item in controller.tabItemsSongs) Tab(text: item),
                for (final item in controller.tabItemsChords) Tab(text: item),
              ],
            ),
            elevation: 6,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle_outline,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  controller.favStatus.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () => controller.toggleFavStatus(songsController),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              for (final item in controller.tabItemsSongs)
                SongTextOnSongScreen(
                    title:
                        controller.songDetail.value.title[item.substring(0, 2)],
                    textVersion: controller.songDetail.value.text[item],
                    description: controller
                        .songDetail.value.description[item.substring(0, 2)]),
              for (final item in controller.tabItemsChords)
                SongTextOnSongScreen(
                    textVersion: controller.songDetail.value.chords[item]),
            ],
          ),
        ),
      ),
    );
  }
}
