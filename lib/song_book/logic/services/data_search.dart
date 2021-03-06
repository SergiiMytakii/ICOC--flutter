import 'dart:io';
import '/index.dart';

class DataSearch extends SearchDelegate {
  final songsController = Get.put(SongsController());
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

  Stream<List<Song>> searchStream(String query) {
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

    return StreamBuilder<List<Song>>(
        stream: searchStream(query),
        builder: (context, AsyncSnapshot<List<Song>> songs) {
          if (!songs.hasData) {
            return Platform.isIOS
                ? SliverToBoxAdapter(child: Center(child: Text(' No data'.tr)))
                : Center(child: Text(' No data'.tr));
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
      AsyncSnapshot<List<Song>> songs, int index, BuildContext context) {
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
      AsyncSnapshot<List<Song>> songs, int index, BuildContext context) {
    String textFromSnapshot = songs.data![index].text['ru'] ??
        songs.data![index].text['uk'] ??
        songs.data![index].text['en'] ??
        '';
    //print(textFromSnapshot);

    final List<String> text = textFromSnapshot.split(' ');
    // print(text);
    return text.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: screensColors['songBook'],
                  fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  trimText(String word) {
    //print(word);
    String word1 = word.replaceAll('[', '');
    return word1;
  }

  Widget buildSongCardWithHighliting(AsyncSnapshot<List<Song>> songs, int index,
      BuildContext context, int i, List<String> _orderLang) {
    int id = songs.data![index].id;
    return Column(
      children: [
        ListTile(
          onTap: (() => onTapHandler(id)),
          horizontalTitleGap: 0,
          leading: Text(songs.data![index].id.toString(),
              style: Theme.of(context).textTheme.headline6),
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
        )
      ],
    );
  }

  onTapHandler(int id) {
    Get.toNamed(Routes.SONG_SCREEN, arguments: [id, songsController]);
  }
}
