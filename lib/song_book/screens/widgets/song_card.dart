import 'package:flutter/cupertino.dart';

import '/index.dart';

class SongCard extends StatelessWidget {
  final SongDetail song;
  final List<Widget>? slideActions;
  final Color dividerColor;
  final int? playlistId;
  final OrderLangController controller = Get.find();

  SongCard(
      {required this.song,
      required this.dividerColor,
      this.slideActions,
      this.playlistId});

  @override
  Widget build(BuildContext context) {
    String text = controller.chooseCardLang(song)?[1] ?? '';
    //если получаем html, то удаляем все теги
    if (text.startsWith('<')) {
      var document = parse(text);
      text = parse(document.body!.text).documentElement!.text;
    }

    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: slideActions,
          child: ListTile(
            onTap: (() {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return SongScreen(song);
                },
              ));
            }),
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
