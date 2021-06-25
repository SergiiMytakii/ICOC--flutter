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
  bool slideAction = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  void didUpdateWidget(_) {
    _loadPreferences();
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
                  dividerColor: dividerColors[i],
                );
              },
              childCount: songs.length,
            ),
          )
        : SliverToBoxAdapter(child: Loading());
  }
}
