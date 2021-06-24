import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/screens/song_screen.dart';
import 'package:flutter/material.dart';

import 'db_sqlite/sqlite_helper_fts4.dart';

class DataSearch extends SearchDelegate {
  List<Color> dividerColors = [
    Color(0xFFFF595E),
    Color(0xffffca3a),
    Color(0xff8ac926),
    Color(0xff1982c4),
    Color(0xff6a4c93)
  ];
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
    return searchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchResults();
  }

  searchStream() {
    //trim query and delete dots, comas, ets.
    final String trimmedQuery =
        query.trim().replaceAll(RegExp(r"[^a-zA-Zа-яА-Я]+"), ' ');

    if (trimmedQuery == '') {
      return DatabaseHelperFTS4().getListSongs();
    } else {
      return DatabaseHelperFTS4().getSearchResult(trimmedQuery);
    }
  }

  searchResults() {
    int i = 0;
    return StreamBuilder<List<Song>>(
        stream: searchStream(),
        builder: (context, AsyncSnapshot<List<Song>> songs) {
          if (!songs.hasData) {
            return Center(
              child: Text('no data'),
            );
          }
          return ListView.builder(
              itemCount: songs.data!.length,
              itemBuilder: (context, index) {
                //change i for making different colors of divider
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }
                return Column(
                  children: [
                    ListTile(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SongScreen(
                                      song: songs.data![index],
                                      orderLang: ['ru', 'uk', 'en'],
                                    )));
                      }),
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
                        maxLines: 3,
                      ),
                    ),
                    Divider(
                      indent: 50,
                      color: dividerColors[i],
                    )
                  ],
                );
              });
        });
  }

  List<TextSpan> title(
      AsyncSnapshot<List<Song>> songs, int index, BuildContext context) {
    String titleFromSnapshot = songs.data![index].title['ru'] ?? '';

    final List<String> title = titleFromSnapshot.split(' ');
    //print(title);
    return title.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Color(0xff6a4c93), fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  List<TextSpan> text(
      AsyncSnapshot<List<Song>> songs, int index, BuildContext context) {
    String textFromSnapshot = songs.data![index].text['ru'] ?? '';
    //print(textFromSnapshot);

    final List<String> text = textFromSnapshot.split(' ');
    // print(text);
    return text.map((word) {
      return word.contains('[')
          ? TextSpan(
              text: trimText(word),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xff6a4c93), fontWeight: FontWeight.w900))
          : TextSpan(
              text: '$word ',
            );
    }).toList();
  }

  trimText(String word) {
    //print(word);
    String word1 = word.replaceAll('[', '');
    return word1.replaceAll(']', ' ');
  }
}
