import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';

import '../../../../constants.dart';
import '../../../../core/bloc/songs_bloc/songs_bloc.dart';
import '../../../../core/model/song_detail.dart';
import '../../../widget/loading.dart';
import '../../../routes/app_routes.dart';

class DataSearchResults extends StatefulWidget {
  DataSearchResults(this.query);
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
    context.read<SongsBloc>().add(SearchSongRequested(widget.query));
    int i = 0;
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsLoadingState) {
          return SliverToBoxAdapter(child: Loading());
        } else if (state is SearchSongsSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //change i for making different colors of divider
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }
                return buildSongCardWithHighliting(
                  state.songs[index],
                  context,
                  i,
                );
              },
              childCount: state.songs.length,
            ),
          );
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }

  // returns TextSpan with hihglited words for title
  List<TextSpan> title(SongDetail song, BuildContext context) {
    String rawText = song.searchTitle ?? '';
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
  List<TextSpan> text(SongDetail song, BuildContext context) {
    String rawText = song.searchText ?? '';
    // print(rawText);

    //remove html tags and parts of html tags
    var document = parse(rawText);
    String parsedString = parse(document.body!.text).documentElement!.text;
    int indexOfGreaterThan = parsedString.indexOf(">");
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
    String word1 = word.replaceAll('[', '');
    // word = word1.replaceAll('br', '<p>');
    // word = word1.replaceAll(
    //     RegExp(
    //       r'<[^>]*>|&[^;]+;',
    //       multiLine: true,
    //     ),
    //     '');
    //word = word1.replaceAll('/>', '');

    return word1;
  }

  Widget buildSongCardWithHighliting(
      SongDetail song, BuildContext context, int i) {
    int id = song.id;
    return Column(
      children: [
        ListTile(
          onTap: () => onTapHandler(context, song),
          horizontalTitleGap: 12,
          leading: Text(id.toString(),
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
          color: dividerColors[i],
          thickness: 1.2,
        )
      ],
    );
  }

  onTapHandler(BuildContext context, SongDetail fullSong) async {
    // we need to put language from searchResult to the firs place in the maps title, text, descr
    SongDetail? orderedLangSong;
    if (fullSong.searchLang != null) {
      orderedLangSong = fullSong.orderByLanguage([fullSong.searchLang!]);
    }

    Navigator.pushNamed(context, Routes.ONE_SONG_SCREEN,
        arguments: orderedLangSong ?? fullSong);

    //Get.toNamed(Routes.SONG_SCREEN, arguments: [song, lang]);
  }
}
