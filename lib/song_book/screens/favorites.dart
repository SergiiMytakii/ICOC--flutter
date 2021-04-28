import 'package:Projects/services/db_sqlite/sqlite_helper.dart';
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
    //get list of favorites
    DatabaseHelper().getFavorites().then((value) => setState(() {
          songs = value;
        }));
    _loadPreferences();
  }


  List<String> _orderLang = ['ru', 'uk', 'en'];

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
    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites').tr(),
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            return SongCard(
              song: songs[index],
              orderLang: _orderLang,
              slideAction: slideAction,
              deleteFromFavorites: deleteFromFavoriteList,
            );
          },
        ));
  }
}
