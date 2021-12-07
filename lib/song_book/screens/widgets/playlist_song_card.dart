import '/index.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class PlaylistSongCard extends GetView<OrderLangController> {
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  final PlaylistsController playlistsController =
      Get.put(PlaylistsController());
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
  Widget build(BuildContext context) {
    Get.put(OrderLangController());
    String text = controller.chooseCardLang(song)?[1] ?? '';
    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'to favorite'.tr,
              color: screensColors['songBook']!.withOpacity(0.5),
              icon: Icons.favorite_border,
              onTap: () => favoritesController.addToFavorites(song.id),
            ),
            IconSlideAction(
              caption: 'to playlist'.tr,
              color: screensColors['songBook']!.withOpacity(0.7),
              icon: Icons.playlist_play_outlined,
              onTap: () {
                showModalBottomSheet(
                  context: Get.context!,
                  isScrollControlled: true,
                  enableDrag: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.black.withOpacity(0.2),
                  builder: (context) => ModalBottomSheet(
                    child: AddSongToPlaylistsScreen(song.id),
                  ),
                );
              },
            ),
            IconSlideAction(
                caption: 'remove from playlist'.tr,
                color: screensColors['songBook'],
                icon: Icons.remove_circle_outline_outlined,
                onTap: () =>
                    playlistsController.removeFromPlaylist(playlistId, song.id))
          ],
          child: ListTile(
            onTap: (() => Get.toNamed(Routes.SONG_SCREEN,
                arguments: [song.id, controller])),
            horizontalTitleGap: 0,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.headline6),
            title: Text(
              //show title and text language accordingly to app lang
              controller.chooseCardLang(song)?[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: text.startsWith('<')
                ? html.Html(
                    data: text.startsWith('<p>1')
                        ? text.substring(10, 90)
                        : text.substring(0, 80),
                  )
                : Text(
                    controller.chooseCardLang(song)?[1] ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
          ),
        ),
        Divider(
          indent: 50,
          color: dividerColor,
          thickness: 1.2,
        ),
      ],
    );
  }
}

// return to the title of card title of song on the preferred language if it exist,
// or on the second language, or on third
