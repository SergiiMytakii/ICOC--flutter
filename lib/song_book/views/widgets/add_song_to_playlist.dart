import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class AddSongToPlaylistsScreen extends GetView<SongsController> {
  int id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getPlaylists();
    Get.put(SongsController());
    int i = 0;
    final size = Get.size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add to playlist'.tr),
        centerTitle: true,
        backgroundColor: Constants.screensColors['songBook'],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Create new playlist'.tr,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.playlist_play_outlined,
              color: Constants.dividerColors[0],
            ),
            title: TextFormField(
              autofocus: true,
              decoration: InputDecoration(border: InputBorder.none),
              controller: controller.textController.value,
              style: Theme.of(context).textTheme.headline6,
              onFieldSubmitted: (value) {
                controller.createNewPlaylist();
                controller.addToPlaylist(value, id);
                Get.back();
              },
            ),
          ),
          Divider(
            indent: 50,
            color: Constants.dividerColors[0],
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Or choose from existing playlists'.tr,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: 400,
            child: Obx(() => ListView.builder(
                itemCount: controller.playlists.length,
                itemBuilder: (BuildContext context, index) {
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }

                  return _playlistCard(controller.playlists[index], i);
                })),
          )
        ]),
      ),
    );
  }

  Widget _playlistCard(Map<String, Object?> playlist, int i) {
    return ListTile(
        leading: Icon(
          Icons.playlist_play_outlined,
          color: Constants.dividerColors[i],
        ),
        title: Text(
          playlist['playlistName'].toString(),
        ),
        onTap: () {
          controller.addToPlaylist(
            playlist['playlistName'].toString(),
            id,
          );
          Get.back();
        });
  }
}
