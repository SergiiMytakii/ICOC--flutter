import 'package:Projects/shared/loading.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/song_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool loaded = false;


  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }


  @override
  void didUpdateWidget(_) {
    _loadPreferences();
  }

  List<String> _orderLang = ['ru', 'uk' , 'en'];

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      _orderLang = (prefLanguages.getStringList('orderLang') ?? _orderLang);
    });
  }


  @override
  Widget build(BuildContext context) {
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
        ? SliverFixedExtentList(
            itemExtent: 88,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //print(songs[index]!.description);
                return SongCard(songs[index], _orderLang);
              },
              childCount: songs.length,
            ),
          )
        : SliverToBoxAdapter(child: Loading());
  }
}
