import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:Projects/song_book/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final Song song;

  SongScreen(this.song);

  @override
  Widget build(BuildContext context) {
    final tabItemsSongs = song.text!.keys.toList();
    final tabItemsChords = song.chords!.keys.toList();

    return DefaultTabController(
      length: countTabs(),
      child: Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(0),
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final item in tabItemsSongs) Tab(text: item),
              for (final item in tabItemsChords) Tab(text: item),
            ],
          ),
          titleTextStyle: TextStyle(fontSize: 18),
          centerTitle: true,
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
                  title: song.title![item],
                  textVersion: song.text![item],
                  description: song.description![item]),
            for (final item in tabItemsChords)
              SongTextOnSongScreen(textVersion: song.chords![item]),
          ],
        ),
      ),
    );
  }

  countTabs() {
    int amountOfTabs = song.text!.length + song.chords!.length;
    return amountOfTabs;
  }
}
