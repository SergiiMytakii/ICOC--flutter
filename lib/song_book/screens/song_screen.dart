import 'package:Projects/services/db_sqlite/sqlite_helper.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorites.dart';

class SongScreen extends StatefulWidget {
  final Song song;
  final List<String> orderLang;

  SongScreen(this.song, this.orderLang);

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late List<dynamic> tabItemsSongs;
  late List<dynamic> tabItemsChords;
  bool favStatus = false;

  @override
  void initState() {
    super.initState();
    favoriteStatus();
  }

  void getTitlesForTabs() {
    //get tabs titles
    tabItemsSongs = widget.song.text.keys.toList();
    tabItemsChords = widget.song.chords.keys.toList();
    //reorder tabs accordingly preferred  lang-s
    //if it's just 1 tab - return
    if (tabItemsSongs.length == 1) return;
    // count index of first lang
    int index =
        tabItemsSongs.indexWhere((key) => key.startsWith(widget.orderLang[0]));
    // if tab in the first place abd we have just 2 items - return
    if (index == 0 && tabItemsSongs.length == 2) return;
    //remove item and insert it in the first place
    if (index > 0) {
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);
    }
    if (index < 0) {
      index = tabItemsSongs
          .indexWhere((key) => key.startsWith(widget.orderLang[1]));
      if (index <= 0) return;
      String firstTab = tabItemsSongs.removeAt(index);
      tabItemsSongs.insert(0, firstTab);
    }
    //search for second preferred lang
    index =
        tabItemsSongs.indexWhere((key) => key.startsWith(widget.orderLang[1]));
    if (index <= 0) return;
    //remove item and insert it in the second place
    String secondTab = tabItemsSongs.removeAt(index);
    tabItemsSongs.insert(1, secondTab);
  }

  Future favoriteStatus() async {
    await DatabaseHelper().getFavoriteStatus(widget.song.id).then((value) {
      setState(() {
        favStatus = value;
        print('favorite status $favStatus');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                favStatus ? Icons.favorite : Icons.favorite_border,
                size: 25,
              ),
              onPressed: () {
                favStatus
                    ? setState(() {
                        DatabaseHelper().deleteFromFavorites(widget.song.id);
                        favoriteStatus();

                      })
                    : setState(() {
                        DatabaseHelper().addToFavorites(widget.song.id);
                        favoriteStatus();
                      });
                print(favStatus);
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            for (final item in tabItemsSongs)
              SongTextOnSongScreen(
                  title: widget.song.title[item.substring(0, 2)],
                  textVersion: widget.song.text[item],
                  description: widget.song.description[item.substring(0, 2)]),
            for (final item in tabItemsChords)
              SongTextOnSongScreen(textVersion: widget.song.chords[item]),
          ],
        ),
      ),
    );
  }

  countTabs() {
    int amountOfTabs = widget.song.text.length + widget.song.chords.length;
    return amountOfTabs;
  }
}
