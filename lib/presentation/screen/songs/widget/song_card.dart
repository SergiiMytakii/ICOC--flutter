import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/model/song_detail.dart';

class SongCard extends StatelessWidget {
  final SongDetail song;
  final List<Widget>? slideActions;
  final Color dividerColor;

  SongCard({
    super.key,
    required this.song,
    required this.dividerColor,
    this.slideActions,
  });

  @override
  Widget build(BuildContext context) {
    String text = song.text.entries.first.value;
    //если получаем html, то удаляем все теги
    if (text.startsWith('<')) {
      text = FormatTextHelper.extractFormattedText(text);
    }

    return Column(
      children: [
        AnimationWrapper(
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: slideActions!,
            ),
            child: ListTile(
              onTap: (() {
                context.go('/$SONGBOOK/$ONE_SONG_SCREEN/${song.id}');
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
                  ? const Icon(
                      Icons.play_circle,
                      color: ScreenColors.songBook,
                    )
                  : Container(
                      height: 1,
                      width: 1,
                    ),
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
