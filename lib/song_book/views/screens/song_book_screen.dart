import 'dart:io';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:icoc/song_book/logic/services/data_search.dart';
import 'package:icoc/song_book/views/widgets/android_app_bar_song_book_screen.dart';
import 'package:icoc/song_book/views/widgets/ios_app_bar_song_book_screen.dart';
import 'package:icoc/song_book/views/widgets/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongBookScreen extends StatelessWidget {
  final controller = Get.put(SongsController());
  final DataSearch dataSearch = DataSearch();
  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        Platform.isIOS
            ? iosAppbar(context, controller)
            //in case its android platform
            : AndroidAppBar(),
        Obx(
          () => controller.query.value == ''
              ? SongList()
              : dataSearch.searchResults(controller.query.value),
        ),
      ],
    ));
  }
}
