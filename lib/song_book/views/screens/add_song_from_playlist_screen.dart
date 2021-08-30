import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/playlists_controller.dart';
import 'package:icoc/song_book/logic/services/data_search_from_playlist.dart';
import 'package:icoc/song_book/views/widgets/ios_app_bar_song_book_screen.dart';

class AddSongFromPlaylistScreen extends StatelessWidget {
  final playlist = Get.arguments;

  final controller = Get.put(PlaylistsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isIOS
          ? CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                iosAppbar(context, controller, 'add to playlist'.tr),
                Obx(
                  () => DataSearchFromPlaylists(playlist)
                      .searchResults(controller.query.value),
                ),
              ],
            )
          : Column(children: [
              searchCustomAppBar(),
              Container(
                height: Get.size.height -
                    MediaQuery.of(context).viewInsets.bottom -
                    80,
                width: Get.size.width,
                child: Obx(
                  () => DataSearchFromPlaylists(playlist)
                      .searchResults(controller.query.value),
                ),
              ),
            ]),
    );
  }

  searchCustomAppBar() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        height: 80,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'add to playlist'.tr),
                  controller: controller.textEditingController,
                  onChanged: (val) => controller.query.value = val,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.textEditingController.clear();
                  controller.query.value = '';
                },
                icon: Icon(
                  Icons.clear_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}
