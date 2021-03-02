import 'package:Projects/song_book/screens/favorites.dart';
import 'package:Projects/song_book/screens/playlists.dart';
import 'package:Projects/song_book/screens/song_book.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  int numberOfPage;

  MyBottomNavigationBar(this.numberOfPage);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.numberOfPage,
      elevation: 0,
      backgroundColor: Colors.transparent,
      onTap: (value) {
        // Respond to item press.
        setState(() => widget.numberOfPage = value);
        Navigator.push(context,
            // ignore: missing_return
            MaterialPageRoute(builder: (context) {
          switch (value) {
            case 0:
              return SongBook();
            case 1:
              return Favorites();
            case 2:
              return Playlists();
          }
        }));
      },
      items: [
        BottomNavigationBarItem(
          label: 'Cписок',
          icon: Icon(Icons.queue_music),
        ),
        BottomNavigationBarItem(
          label: 'Избранное',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Плейлисты',
          icon: Icon(Icons.playlist_play),
        ),
      ],
    );
  }
}
