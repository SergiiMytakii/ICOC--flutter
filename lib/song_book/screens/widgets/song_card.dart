import '../video_list_screen.dart';
import '/index.dart';

class SongCard extends StatelessWidget {
  final SongDetail song;
  final orderLang;
  final Color dividerColor;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  final log = Logger();

  SongCard(
      {required this.song,
      required this.orderLang,
      required this.dividerColor});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderLangController());

    String text = controller.chooseCardLang(song)?[1] ?? '';
    //если получаем html, то удаляем все теги
    if (text.startsWith('<')) {
      var document = parse(text);
      text = parse(document.body!.text).documentElement!.text;
    }
    //log.e(text);
    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'to favorite'.tr,
              color: screensColors['songBook']!.withOpacity(0.7),
              icon: Icons.favorite_border,
              onTap: () => favoritesController.addToFavorites(song.id),
            ),
            IconSlideAction(
              caption: 'to playlist'.tr,
              color: screensColors['songBook'],
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
          ],
          child: ListTile(
            onTap: (() => Get.toNamed(
                  Routes.SONG_SCREEN,
                  arguments: [song],
                )),
            horizontalTitleGap: 2,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.headline6),
            title: Text(
              //show title and text language accordingly to app lang
              controller.chooseCardLang(song)?[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: song.resources != null
                ? Icon(
                    Icons.library_music_outlined,
                  )
                : Container(
                    height: 1,
                    width: 1,
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
