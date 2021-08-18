import 'package:icoc/routes/routes.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/slides_controller.dart';
import 'package:icoc/song_book/logic/controllers/song_screen_controller.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:icoc/song_book/views/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:share_plus/share_plus.dart';

class SongScreen extends GetView<SongScreenController> {
  final SongsController songsController = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    Get.put(SongScreenController(songId: Get.arguments[0]));
    final SlidesController slidesController = Get.put(SlidesController());

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
            elevation: 0,
            actions: [
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
                  controller.favStatus.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () => controller.toggleFavStatus(songsController),
              ),
              IconButton(
                icon: Icon(
                  Icons.text_fields_outlined,
                ),
                onPressed: () => fontSizeAdjust(context),
              ),
              IconButton(
                icon: Icon(Icons.slideshow_outlined),
                onPressed: () => Get.toNamed(
                  Routes.SLIDES_SCREEN,
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              for (final item in controller.tabItemsSongs)
                SongTextOnSongScreen(
                  title:
                      controller.songDetail.value.title[item.substring(0, 2)] ??
                          '',
                  textVersion: controller.songDetail.value.text[item] ?? '',
                  description: controller
                          .songDetail.value.description[item.substring(0, 2)] ??
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
        ),
      ),
    );
  }

  void fontSizeAdjust(BuildContext context) {
    Get.bottomSheet(Container(
        padding: EdgeInsets.all(16),
        height: 200,
        color: Theme.of(context)
            .bottomSheetTheme
            .backgroundColor!
            .withOpacity(0.8),
        child: Column(children: [
          Text(
            'Font size'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => Row(
                  children: [
                    Icon(
                      Icons.text_fields,
                      color: Colors.black38,
                    ),
                    Slider(
                      activeColor: Theme.of(context).primaryColorDark,
                      inactiveColor: Theme.of(context).primaryColorDark,
                      label: 'Font size',
                      value: controller.fontSize.value,
                      min: 14,
                      max: 48,
                      divisions: 34,
                      onChanged: (val) => controller.altFontSize(val),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'aA',
                      style: TextStyle(fontSize: controller.fontSize.value),
                    )
                  ],
                )),
          ),
        ])));
  }
}
