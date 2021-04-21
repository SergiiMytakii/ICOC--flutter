import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final Song song;
  final List<String> orderLang;
  late List<dynamic> tabItemsSongs;
  late List<dynamic> tabItemsChords;

  SongScreen(this.song, this.orderLang);



void removeNulableValues() {
    song.title.removeWhere((key, value) => value == null);
    song.text.removeWhere((key, value) => value == null);
    song.description.removeWhere((key, value) => value == null);
    song.chords.removeWhere((key, value) => value == null);
  }

  void getTitlesForTabs() {
    //get tabs titles
    tabItemsSongs = song.text.keys.toList();
    tabItemsChords = song.chords.keys.toList();

    //reorder tabs accordingly preferred  lang-s
    //if it's just 1 tab - return
    if(tabItemsSongs.length == 1) return;
    print(tabItemsSongs);
    // count index of first lang
    int index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[0]));
    // if tab in the first place abd we have just 2 items - return
    if (index == 0 && tabItemsSongs.length == 2) return;
    //remove item and insert it in the first place
    if (index > 0) {
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);
    }
    if (index < 0 ){
      index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[1]));
      if (index <= 0) return;
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);

    }
    //search for second preferred lang
    index = tabItemsSongs.indexWhere((key) => key.startsWith(orderLang[1]));
    if (index <= 0) return;
    String secondTab = tabItemsSongs.removeAt(index);
    tabItemsSongs.insert(1, secondTab);
    //print(tabItemsChords);
    print(tabItemsSongs);
    print(orderLang);
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    //get rid from nullable values
   removeNulableValues();
    getTitlesForTabs();

    return DefaultTabController(
      length: countTabs(),
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final item in tabItemsSongs) Tab(text: item),
              for (final item in tabItemsChords) Tab(text: item),
            ],
          ),
          elevation: 8,
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.play_circle_outline,
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            for (final item in tabItemsSongs)
              SongTextOnSongScreen(
                  title: song.title[item.substring(0, 2)],
                  textVersion: song.text[item],
                  description: song.description[item.substring(0, 2)]),
            for (final item in tabItemsChords)
              SongTextOnSongScreen(textVersion: song.chords[item]),
          ],
        ),
      ),
    );
  }

  countTabs() {
    int amountOfTabs = song.text.length + song.chords.length;
    return amountOfTabs;
  }
}
