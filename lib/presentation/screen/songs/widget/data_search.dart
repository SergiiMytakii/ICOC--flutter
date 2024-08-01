import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/search_song_bloc/search_song_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:logger/logger.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/presentation/widget/loading.dart';

class DataSearchResults extends StatefulWidget {
  DataSearchResults(this.query, {super.key});
  final String query;

  @override
  State<DataSearchResults> createState() => _DataSearchResultsState();
}

class _DataSearchResultsState extends State<DataSearchResults> {
  @override
  void initState() {
    super.initState();
  }

  final log = Logger();

  @override
  Widget build(BuildContext context) {
    if (widget.query.contains(RegExp(r'[0-9]'))) {
      getIt<SearchSongBloc>().add(SearchSongEvent.searchByNumber(widget.query));
    } else {
      getIt<SearchSongBloc>().add(SearchSongEvent.searchByText(widget.query));
    }
    return BlocBuilder<SearchSongBloc, SearchSongState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => SliverToBoxAdapter(child: Loading()),
          success: (songs) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return buildSongCardWithHighliting(
                    songs[index], context, index);
              },
              childCount: songs.length,
            ),
          ),
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      },
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
    final String word1 = word.replaceAll('[', '');
    return word1;
  }

  Widget buildSongCardWithHighliting(
      SongVersionLocal song, BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          onTap: () => context.go('/$SONGBOOK/$ONE_SONG_SCREEN/${song.id}/1'),
          horizontalTitleGap: 12,
          leading: Text(song.id.toString(),
              style: Theme.of(context).textTheme.titleSmall),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge,
                children: title(song, context)),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
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
          color: getDividerColor(index),
          thickness: 1.2,
        )
      ],
    );
  }
}
