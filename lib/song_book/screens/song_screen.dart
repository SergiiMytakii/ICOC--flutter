import 'package:flutter/cupertino.dart';

import '../../index.dart';

class SongScreen extends GetView<SongScreenController> {
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  SongScreen() {
    Wakelock.enable();
  }
  @override
  Widget build(BuildContext context) {
    final songId = Get.arguments != null ? Get.arguments[0] : 1;
    favoritesController.getFavoriteStatus(songId);
    Get.put(SongScreenController(songId: songId));
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
}
