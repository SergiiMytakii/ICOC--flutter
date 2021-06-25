import 'package:Projects/services/db_sqlite/sqlite_helper_fts_to_delete.dart';
import 'package:Projects/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/models/song_detail.dart';
import 'package:Projects/song_book/widgets/song_text_on_song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatefulWidget {
  final Song song;
  final Function? deleteFromFavorites;
  final List<String> orderLang;

  SongScreen(
      {required this.song, required this.orderLang, this.deleteFromFavorites});

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late List<dynamic> tabItemsSongs;
  late List<dynamic> tabItemsChords;
  bool favStatus = false;
  SongDetail songDetail =
      SongDetail(id: 0, title: {}, description: {}, text: {}, chords: {});

  @override
  void initState() {
    DatabaseHelperFTS4()
        .getSongDetail(widget.song.id)
        .then((value) => setState(() {
              songDetail = value;
            }));
    favoriteStatus();
    super.initState();
  }

  void getTitlesForTabs() {
    //get the tabs titles
    tabItemsSongs = songDetail.text.keys.toList();
    tabItemsChords = songDetail.chords.keys.toList();

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

  //get current favorite status
  Future favoriteStatus() async {
    await DatabaseHelperFTS().getFavoriteStatus(widget.song.id).then((value) {
      setState(() {
        favStatus = value;
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
          elevation: 6,
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.play_circle_outline,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                favStatus ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                // we check current status and add or delete to favorites
                favStatus
                    ? setState(() {
                        DatabaseHelperFTS4()
                            .deleteFromFavorites(widget.song.id);
                        //get new status
                        favoriteStatus();
                        // update list of favorites in Favorites screen
                        widget.deleteFromFavorites!(widget.song.id);
                      })
                    : setState(() {
                        DatabaseHelperFTS4().addToFavorites(widget.song.id);
                        //get new status
                        favoriteStatus();
                      });
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            for (final item in tabItemsSongs)
              SongTextOnSongScreen(
                  title: songDetail.title[item.substring(0, 2)],
                  textVersion: songDetail.text[item],
                  description: songDetail.description[item.substring(0, 2)]),
            for (final item in tabItemsChords)
              SongTextOnSongScreen(textVersion: songDetail.chords[item]),
          ],
        ),
      ),
    );
  }

  countTabs() {
    int amountOfTabs = songDetail.text.length + songDetail.chords.length;
    return amountOfTabs;
  }
}
