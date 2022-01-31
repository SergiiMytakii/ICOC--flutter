import 'dart:io';
import 'package:flutter/cupertino.dart';

import '/index.dart';

class DataSearch extends SearchDelegate {
  final songsController = Get.put(SongsController());
  final log = Logger();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return searchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchResults(query);
  }

  Stream<List<SongDetail>> searchStream(String query) {
    //trim query and delete dots, comas, ets.
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r"[^a-zA-Zа-яА-Яёієї0-9]+"), ' ');

    if (trimmedQuery == '') {
      return DatabaseHelperFTS4().getListSongs();
    } else {
      if (trimmedQuery.contains(RegExp(r'[0-9]'))) {
        return DatabaseHelperFTS4().getSearchResultByNumber(trimmedQuery);
      } else
        return DatabaseHelperFTS4().getSearchResult(trimmedQuery);
    }
  }

  Widget searchResults(String query) {
    int i = 0;

    return StreamBuilder<List<SongDetail>>(
        stream: searchStream(query),
        builder: (context, AsyncSnapshot<List<SongDetail>> songs) {
          if (!songs.hasData) {
            return Platform.isIOS
                ? SliverToBoxAdapter(child: Loading())
                : Loading();
          }
          return GetBuilder<OrderLangController>(
            init: OrderLangController(),
            builder: (controller) {
              return Platform.isIOS
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          //change i for making different colors of divider
                          if (i < 4) {
                            i++;
                          } else {
                            i = 0;
                          }
                          return buildSongCardWithHighliting(
                              songs, index, context, i, controller.orderLang);
                        },
                        childCount: songs.data!.length,
                      ),
                    )
                  : ListView.builder(
                      itemCount: songs.data!.length,
                      itemBuilder: (context, index) {
                        //change i for making different colors of divider
                        if (i < 4) {
                          i++;
                        } else {
                          i = 0;
                        }
                        return buildSongCardWithHighliting(
                            songs, index, context, i, controller.orderLang);
                      });
            },
          );
        });
  }

  // returns TextSpan with hihglited words for title
  List<TextSpan> title(
      AsyncSnapshot<List<SongDetail>> songs, int index, BuildContext context) {
    String titleFromSnapshot = songs.data![index].title['ru'] ??
        songs.data![index].title['uk'] ??
        songs.data![index].title['en'] ??
        '';

    final List<String> title = titleFromSnapshot.split(' ');
    //print(title);
    return title.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: screensColors['songBook'],
                  fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  // returns TextSpan with hihglited words for text
  List<TextSpan> text(
      AsyncSnapshot<List<SongDetail>> songs, int index, BuildContext context) {
    String textFromSnapshot = songs.data![index].text['ru'] ??
        songs.data![index].text['uk'] ??
        songs.data![index].text['en'] ??
        '';
    //print(textFromSnapshot);
    var document = parse(textFromSnapshot);
    String parsedString = parse(document.body!.text).documentElement!.text;
    final List<String> text = parsedString.split(' ');
    // print(text);
    return text.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
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

  Widget buildSongCardWithHighliting(AsyncSnapshot<List<SongDetail>> songs,
      int index, BuildContext context, int i, List<String> _orderLang) {
    int id = songs.data![index].id;
    return Column(
      children: [
        ListTile(
          onTap: (() => onTapHandler(context, songs.data![index],
              songs.data![index].title.keys.first)),
          horizontalTitleGap: 0,
          leading:
              Text(id.toString(), style: Theme.of(context).textTheme.headline6),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: title(songs, index, context)),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
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
    final SongsController controller = Get.find();
    final song = controller.songsFromFB
        .firstWhere((element) => element.id == songFromSearch.id);
    log.e(lang);
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return SongScreen(
          song,
          prefferedLangFromSearch: lang,
        );
      },
    ));
    //Get.toNamed(Routes.SONG_SCREEN, arguments: [song, lang]);
  }
}
