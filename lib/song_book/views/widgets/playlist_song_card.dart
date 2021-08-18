import 'package:icoc/routes/routes.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:icoc/song_book/models/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class PlaylistSongCard extends GetView<SongsController> {
  final Song song;
  final orderLang;
  final Color dividerColor;
  final playlistId;

  PlaylistSongCard(
      {required this.song,
      required this.orderLang,
      required this.dividerColor,
      this.playlistId});

  @override
  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());
    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'to favorite'.tr,
              color: Constants.screensColors['songBook']!.withOpacity(0.5),
              icon: Icons.favorite_border,
              onTap: () => controller.addToFavorites(song.id),
            ),
            IconSlideAction(
              caption: 'to playlist'.tr,
              color: Constants.screensColors['songBook']!.withOpacity(0.7),
              icon: Icons.playlist_play_outlined,
              onTap: () =>
                  Get.toNamed(Routes.ADD_TO_PLAYLIST, arguments: song.id),
            ),
            IconSlideAction(
                caption: 'remove from playlist'.tr,
                color: Constants.screensColors['songBook'],
                icon: Icons.remove_circle_outline_outlined,
                onTap: () => controller.removeFromPlaylist(playlistId, song.id))
          ],
          child: ListTile(
            onTap: (() => Get.toNamed(Routes.SONG_SCREEN,
                arguments: [song.id, controller])),
            horizontalTitleGap: 0,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.headline6),
            title: Text(
              //show title and text language accordingly to app lang
              controller.chooseCardLang(song, orderLang)?[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              controller.chooseCardLang(song, orderLang)?[1] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
        Divider(
          indent: 50,
          color: dividerColor,
        ),
      ],
    );
  }
}

// return to the title of card title of song on the preferred language if it exist,
// or on the second language, or on third
