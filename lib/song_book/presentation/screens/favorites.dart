
import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/logic/services/order_lang.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/presentation/widgets/song_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Song> songs = [];
  bool slideAction = true;
  List<String> _orderLang = [];

  @override
  void initState() {
    super.initState();
    OrderLang().orderLang().listen((event) {
      setState(() {
        _orderLang = event;
      });
    });
    DatabaseHelperFTS4().getListFavorites().then((songsFromDb) => setState(() {
          songs = songsFromDb;
        }));
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
            //change i for making different colors of divider
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
              dividerColor: Constants.dividerColors[i],
            );
          },
        ));
  }
}
