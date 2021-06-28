import 'package:Projects/services/order_lang.dart';
import 'package:Projects/shared/constants.dart';
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
  bool slideAction = false;
  List<String> _orderLang = [];
  @override
  void initState() {
    super.initState();
    OrderLang().orderLang().listen((event) {
      setState(() {
        _orderLang = event;
      });
    });
  }

  @override
  void didUpdateWidget(_) {
    super.didUpdateWidget(_);
    OrderLang().orderLang().listen((event) {
      setState(() {
        _orderLang = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    //get list of songs from streamProvider
    List<Song> songs = Provider.of<List<Song>>(context);
//print(songs.first.chords);
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
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //iterate index of divider color
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }

                return SongCard(
                  song: songs[index],
                  orderLang: _orderLang,
                  slideAction: slideAction,
                  dividerColor: Constants.dividerColors[i],
                );
              },
              childCount: songs.length,
            ),
          )
        : SliverToBoxAdapter(child: Loading());
  }
}
