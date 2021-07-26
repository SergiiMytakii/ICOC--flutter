import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/presentation/widgets/song_card.dart';

import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Song> songs = [];
  final SlideActions slideAction = SlideActions.Favorites;

  @override
  void initState() {
    super.initState();

    DatabaseHelperFTS4().getListFavorites().then((songsFromDb) => setState(() {
          songs = songsFromDb;
        }));
  }

  //rebuild UI when song deleted from favorites
  void deleteFromFavoriteList(int id) {
    setState(() {
      songs.removeWhere((song) => song.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites'.tr),
          centerTitle: true,
          backgroundColor: Constants.screensColors['songBook'],
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: songs.length,
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
                  song: songs[index],
                  orderLang: controller.orderLang,
                  slideAction: slideAction,
                  deleteFromFavorites: deleteFromFavoriteList,
                  dividerColor: Constants.dividerColors[i],
                );
              },
            );
          },
        ));
  }
}
