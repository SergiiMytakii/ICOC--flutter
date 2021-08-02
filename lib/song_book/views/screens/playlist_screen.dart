import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:Projects/song_book/views/widgets/playlist_song_card.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class PlaylistScreen extends GetView<SongsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());
    final playlist = Get.arguments;
    if (playlist != null) {
      int playlistId = playlist['id'];
      controller.getSongsInPlaylist(playlistId);

      int i = 0;

      return Scaffold(
          appBar: AppBar(
            title: Text(playlist['playlistName']),
            centerTitle: true,
            backgroundColor:
                Constants.screensColors['songBook']!.withOpacity(0.8),
          ),
          body: Obx(() => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.songsInPlaylist.length,
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
                      return PlaylistSongCard(
                          song: controller.songsInPlaylist[index],
                          orderLang: orLangController.orderLang,
                          dividerColor: Constants.dividerColors[i],
                          playlistId: playlistId);
                    },
                  );
                },
              )));
    } else
      return Scaffold(
        body: Center(
          child: Text('Ooops...can\'t load data'),
        ),
      );
  }
}