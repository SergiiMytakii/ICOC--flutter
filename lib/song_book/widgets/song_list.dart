import 'package:Projects/shared/loading.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_card.dart';
import 'package:flutter/material.dart';
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
    List<Song> songsFiltered = Provider.of<List<Song>>(context);

    //filtering songs by lang
    //todo
    //implement rebuilding UI after updating lang preferences
   songsFiltered.retainWhere((song) {
     return song.title.keys.contains('en') || song.title.keys.contains('uk') || song.title.keys.contains('ru');
   });







    if (songsFiltered.isEmpty) {
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
                //print(songs[index]!.description);
                return SongCard(songsFiltered[index]);
              },
              childCount: songsFiltered.length,
            ),
          )
        : SliverToBoxAdapter(child: Loading());
  }
}
