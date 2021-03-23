import 'package:Projects/services/database.dart';
import 'package:Projects/shared/loading.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_card.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    //get list of songs from streamProvider
    List<Song> songs = Provider.of<List<Song>>(context);

    //experiment
    if (songs[0].text != null)
      songs[0].text!.removeWhere((key, value) => key == 'ru1');

    songs.removeWhere((song) => song.text == null);

    //print(songs[1].text);

    if (songs.isEmpty) {
      setState(() {
        loaded = false;
      });
    } else {
      setState(() {
        loaded = true;
      });
    }
    // print(songs);
    return loaded
        ? SliverFixedExtentList(
      itemExtent: 88,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SongCard(songs[index]);
              },
              childCount: songs.length,
            ),
          )
        : SliverToBoxAdapter(child: Loading());
  }
}
