import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:html/parser.dart';

import '../../../../constants.dart';
import '../../../../core/model/song_detail.dart';
import '../../routes/app_routes.dart';
import '../one_song_screen.dart';

class SongCard extends StatelessWidget {
  final SongDetail song;
  final List<Widget>? slideActions;
  final Color dividerColor;

  SongCard({
    required this.song,
    required this.dividerColor,
    this.slideActions,
  });

  @override
  Widget build(BuildContext context) {
    String text = song.text.entries.first.value;
    //если получаем html, то удаляем все теги
    if (text.startsWith('<')) {
      var document = parse(text);
      text = parse(document.body!.text).documentElement!.text;
    }

    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: slideActions!,
          ),
          child: ListTile(
            onTap: (() {
              Navigator.pushNamed(context, Routes.ONE_SONG_SCREEN,
                  arguments: song);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => OneSongScreen(song)));
            }),
            horizontalTitleGap: 12,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.titleSmall),
            title: Text(
              song.title.entries.first.value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: song.resources != null && song.resources!.isNotEmpty
                ? Icon(
                    Icons.play_circle,
                    color: screensColors['songBook'],
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
