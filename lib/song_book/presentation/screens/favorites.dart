import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/favorites_controller.dart';
import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/presentation/widgets/song_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final SlideActions slideAction = SlideActions.Favorites;

  //rebuild UI when song deleted from favorites
  void deleteFromFavoriteList(int id) {
    // setState(() {
    //   songs.removeWhere((song) => song.id == id);
    // });
  }
  final favController = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites'.tr),
          centerTitle: true,
          backgroundColor: Constants.screensColors['songBook'],
        ),
        body: Obx(() => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: favController.songs.length,
              itemBuilder: (BuildContext context, int index) {
                //change i for making different colors of divider
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }
                return GetBuilder<OrderLangController>(
                  init: OrderLangController(),
                  builder: (controller) {
                    return SongCard(
                      song: favController.songs[index],
                      orderLang: controller.orderLang,
                      slideAction: slideAction,
                      favController: favController,
                      dividerColor: Constants.dividerColors[i],
                    );
                  },
                );
              },
            )));
  }
}
