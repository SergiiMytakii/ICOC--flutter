import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../favorites_screen.dart';
import '../song_book_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPageIndex,
        children: [
          SongBookScreen(),
          FavoritesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        backgroundColor:
            AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
        currentIndex: _selectedPageIndex,
        selectedItemColor: ScreenColors.songBook.withOpacity(0.8),
        onTap: (index) {
          _selectPage(index);
        },
        items: [
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_list'.tr(),
            icon: Icon(Icons.queue_music),
          ),
          BottomNavigationBarItem(
            label: 'bottom_navigation_bar_favorites'.tr(),
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
