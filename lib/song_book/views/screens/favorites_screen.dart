import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/order_lang_controller.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:icoc/song_book/views/widgets/favorites_song_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class FavoritesScreen extends GetView<SongsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());
    int i = 0;

    final pageBody = Obx(
      () => SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.favSongs.length,
          itemBuilder: (BuildContext context, int index) {
            //change i for making different colors of divider
            if (i < 4) {
              i++;
            } else {
              i = 0;
            }
            return GetBuilder<OrderLangController>(
              init: OrderLangController(),
              builder: (orLangController) {
                return FavoritesSongCard(
                  song: controller.favSongs[index],
                  orderLang: orLangController.orderLang,
                  dividerColor: Constants.dividerColors[i],
                );
              },
            );
          },
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: CupertinoNavigationBar(
              middle: Text('bottom_navigation_bar_favorites'.tr),
              backgroundColor: Constants.screensColors['songBook'],
            ))
        : Scaffold(
            appBar: AppBar(
              title: Text('bottom_navigation_bar_favorites'.tr),
              centerTitle: true,
              backgroundColor: Constants.screensColors['songBook'],
            ),
            body: pageBody);
  }
}
