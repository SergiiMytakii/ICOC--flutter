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
  bool loaded = true;

  @override
  Widget build(BuildContext context) {
    final songs = Provider.of<List<Song>>(context) ?? [];
    final songsEng = songs.map((song) {
      return Song();
    });
    if (songs.isEmpty) {
      setState(() {
        loaded = false;
      });
    } else {
      setState(() {
        loaded = true;
      });
    }
    print(songs);
    return loaded
        ? SliverFixedExtentList(
      itemExtent: 77,
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
