import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/main.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';

import 'package:icoc/core/constants.dart';

class SongCard extends StatelessWidget {
  final SongModel song;
  final List<Widget>? slideActions;
  final Color dividerColor;

  SongCard({
    super.key,
    required this.song,
    required this.dividerColor,
    this.slideActions,
  });

  SongVersion get primarySongVersion {
    final primaryLang =
        getIt<LocalCache>().getString(StorageKeys.primaryLang) ?? locale;
    return song.songVersions.firstWhere(
      (version) => version.lang.name == primaryLang,
      orElse: () => song.songVersions.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final songVersion = primarySongVersion;

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
                context.go(
                  '/$SONGBOOK/$ONE_SONG_SCREEN/${song.id}?lang=${songVersion.lang.name}',
                );
              }),
              horizontalTitleGap: 12,
              leading: Text(song.id.toString(),
                  style: Theme.of(context).textTheme.titleSmall),
              title: Text(
                songVersion.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                songVersion.text.startsWith('<')
                    ? FormatTextHelper.extractFormattedText(songVersion.text)
                    : songVersion.text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: song.hasVideos()
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
