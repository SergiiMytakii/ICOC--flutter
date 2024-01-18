import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/model/song_detail.dart';
import 'widget/slide_actions.dart';
import 'widget/song_card.dart';

class FavoritesScreen extends StatelessWidget {
  // final FavoritesController controller = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites'.tr()),
          centerTitle: true,
          backgroundColor: screensColors['songBook'],
          leading: IconButton(
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
              ),
              tooltip: 'icon_button_actions_app_bar_filter'.tr(),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            //change i to make different colors of divider
            if (i < 4) {
              i++;
            } else {
              i = 0;
            }

            return SongCard(
              song: SongDetail.defaultSong(),
              dividerColor: dividerColors[i],
              slideActions: [
                DeleteFromFavorites(songId: 0),
              ],
            );
          },
        ));
  }
}
