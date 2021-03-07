import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/screens/song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {
  final Song song;

  SongCard(this.song);

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool _favoriteStatus = false;

  @override
  Widget build(BuildContext context) {
    final song = widget.song;
    return Column(
      children: [
        ListTile(
          onTap: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SongScreen(song)));
          }),
          horizontalTitleGap: 0,
          leading: Text(
            song.id.toString(),
            style: TextStyle(fontSize: 18),
          ),
          title: Text(
            song.title!['ru'] ?? '',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            song.text!['ru'] ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: IconButton(
            icon: _favoriteStatus
                ? Icon(
                    Icons.favorite_rounded,
                    size: 32,
                  )
                : Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),
            onPressed: () => setState(() {
              _favoriteStatus = !_favoriteStatus;
              // print(_favoriteStatus);
            }),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
