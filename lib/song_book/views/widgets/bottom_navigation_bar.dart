import 'package:icoc/app/menu/my_drawer.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/views/screens/favorites_screen.dart';
import 'package:icoc/song_book/views/screens/playlists_list_screen.dart';
import 'package:icoc/song_book/views/screens/song_book_screen.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Map<String, Object>> _pages = [
    {'page': SongBookScreen(), 'title': 'All songs'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
    {'page': PlaylistsListScreen(), 'title': 'Playlists'}
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
      drawer: Drawer(
        child: MyDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,

        selectedItemColor:
            Constants.screensColors['songBook']!.withOpacity(0.8),
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_list'.tr,
            icon: Icon(Icons.queue_music),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_favorites'.tr,
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_playlists'.tr,
            icon: Icon(Icons.playlist_play),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
    );
  }
}
