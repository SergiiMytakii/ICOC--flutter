import 'package:Projects/generated/l10n.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return routeToScreen(value);
        }));
      },
      items: [
        BottomNavigationBarItem(
          label: S.of(context)!.bottom_navigation_list,
          icon: Icon(Icons.queue_music),
        ),
        BottomNavigationBarItem(
          label: S.of(context)!.bottom_navigation_favorites,
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: S.of(context)!.bottom_navigation_playlists,
          icon: Icon(Icons.playlist_play),
        ),
      ],
    );
  }

  Widget routeToScreen(int value) {
    if (value == 0)
      return SongBook();
    else if (value == 1)
      return Favorites();
    else
      return Playlists();
  }
}
