import 'package:Projects/app/menu/my_drawer.dart';
import '../screens/favorites.dart';
import '../screens/playlists.dart';
import '../screens/song_book.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Map<String, Object>> _pages = [
    {'page': SongBook(), 'title': 'All songs'},
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
    print('build botton navig bar');
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_list'.tr(),
            icon: Icon(Icons.queue_music),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_favorites'.tr(),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_playlists'.tr(),
            icon: Icon(Icons.playlist_play),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
    );
  }
}
