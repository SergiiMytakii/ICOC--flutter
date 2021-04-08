import 'package:Projects/menu/my_drawer.dart';
import 'package:Projects/song_book/screens/favorites.dart';
import 'package:Projects/song_book/screens/playlists.dart';
import 'package:Projects/song_book/screens/song_book.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Map<String, Object>> _pages = [
    {'page': SongBook(), 'title': 'Song Book'},
    {'page': Favorites(), 'title': 'Favorites'},
    {'page': Playlists(), 'title': 'Playlists'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: MyDrawer(),),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_list'.tr().toString(),
            icon: Icon(Icons.queue_music),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_favorites'.tr().toString(),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_playlists'.tr().toString(),
            icon: Icon(Icons.playlist_play),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
    );
  }
}
