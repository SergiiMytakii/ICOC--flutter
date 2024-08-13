import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/core/constants.dart';

class SongCardWithHighlighting extends StatelessWidget {
  SongCardWithHighlighting(
      {super.key, required this.song, required this.dividerColor});
  final SongVersionLocal song;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => context
              .go('/$SONGBOOK/$ONE_SONG_SCREEN/${song.id}?lang=${song.lang}'),
          horizontalTitleGap: 12,
          leading: Text(song.id.toString(),
              style: Theme.of(context).textTheme.titleSmall),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge,
                children: title(song, context)),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: text(song, context)),
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
        ),
        Divider(
          indent: 50,
          color: dividerColor,
          thickness: 1.2,
        )
      ],
    );
  }

  // returns TextSpan with hihglited words for title
  List<TextSpan> title(SongVersionLocal song, BuildContext context) {
    final String rawText = song.title;
    final List<String> title = rawText.split(' ');
    //print(title);
    return title.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ScreenColors.songBook, fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  // returns TextSpan with hihglited words for text
  List<TextSpan> text(SongVersionLocal song, BuildContext context) {
    final String rawText = song.text;
    // print(rawText);

    //remove html tags and parts of html tags

    String parsedString = FormatTextHelper.extractFormattedText(rawText);
    final int indexOfGreaterThan = parsedString.indexOf('>');
    // Check if ">" is found
    if (indexOfGreaterThan != -1) {
      // Extract the substring starting from the index of ">"
      parsedString = parsedString.substring(indexOfGreaterThan + 1);
    }
    final List<String> text = parsedString.split(' ');
    // print(text);
    return text.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ScreenColors.songBook, fontWeight: FontWeight.w900))
          : TextSpan(
              text: '${trimText(word)} ',
            );
    }).toList();
  }

  String trimText(String word) {
    return word.replaceAll('[', '');
  }
}
