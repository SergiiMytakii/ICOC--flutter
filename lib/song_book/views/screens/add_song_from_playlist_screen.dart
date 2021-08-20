import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/playlists_controller.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/add_songs_from_playlist.dart';
import 'package:icoc/song_book/views/widgets/ios_app_bar_song_book_screen.dart';

class AddSongFromPlaylistScreen extends StatelessWidget {
  final String playlistName = Get.arguments;

  final controller = Get.put(PlaylistsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          Platform.isIOS
              ? iosAppbar(context, controller, 'add sons to $playlistName')
              : showSearch(
                  context: context,
                  delegate: DataSearchFromPlaylists(playlistName)) as Widget,
          Obx(
            () => DataSearchFromPlaylists(playlistName)
                .searchResults(controller.query.value),
          )
        ],
      ),
    );
  }
}
