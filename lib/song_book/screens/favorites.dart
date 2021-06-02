import 'package:Projects/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Song> songs = [];
  bool slideAction = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    DatabaseHelperFTS4().getListFavorites().then((songsFromDb) => setState(() {
          songs = songsFromDb;
        }));
  }

  List<String> _orderLang = ['ru', 'uk', 'en'];
  List<Color> dividerColors = [
    Color(0xFFFF595E),
    Color(0xffffca3a),
    Color(0xff8ac926),
    Color(0xff1982c4),
    Color(0xff6a4c93)
  ];

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      _orderLang = (prefLanguages.getStringList('orderLang') ?? _orderLang);
    });
  }

  //rebuild UI when song deleted from favorites
  void deleteFromFavoriteList(int id) {
    setState(() {
      songs.removeWhere((song) => song.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites').tr(),
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            if (i < 4) {
              i++;
            } else {
              i = 0;
            }
            return SongCard(
              song: songs[index],
              orderLang: _orderLang,
              slideAction: slideAction,
              deleteFromFavorites: deleteFromFavoriteList,
              dividerColor: dividerColors[i],
            );
          },
        ));
  }
}
