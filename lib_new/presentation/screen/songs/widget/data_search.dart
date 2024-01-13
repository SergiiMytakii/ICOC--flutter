import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';

import '../../../../constants.dart';
import '../../../../core/bloc/bloc/songs_bloc.dart';
import '../../../../core/model/song_detail.dart';
import '../../../widget/loading.dart';
import '../one_song_screen.dart';

class DataSearchResults extends StatelessWidget {
  DataSearchResults(this.query);
  final String query;
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    int i = 0;
    print(query);
    context.read<SongsBloc>().add(SearchSongRequested(query));
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
                  state.songs,
                  index,
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
  List<TextSpan> title(
      List<SongDetail> songs, int index, BuildContext context) {
    String rawText = songs[index].text.values.first;

    final List<String> title = rawText.split(' ');
    //print(title);
    return title.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: screensColors['songBook'],
                  fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  // returns TextSpan with hihglited words for text
  List<TextSpan> text(List<SongDetail> songs, int index, BuildContext context) {
    String rawText = songs[index].text.values.first;
    print(rawText);

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
                  color: screensColors['songBook'],
                  fontWeight: FontWeight.w900))
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
      List<SongDetail> songs, int index, BuildContext context, int i) {
    int id = songs[index].id;
    return Column(
      children: [
        ListTile(
          onTap: () => onTapHandler(
              context, songs[index], songs[index].title.keys.first),
          horizontalTitleGap: 12,
          leading: Text(id.toString(),
              style: Theme.of(context).textTheme.titleSmall),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge,
                children: title(songs, index, context)),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: text(songs, index, context)),
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

  onTapHandler(BuildContext context, SongDetail songFromSearch, String lang) {
    log.e(lang);
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return OneSongScreen(
          songFromSearch,
        );
      },
    ));
    //Get.toNamed(Routes.SONG_SCREEN, arguments: [song, lang]);
  }
}
