import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Playlists extends StatelessWidget {
  final int numberOfPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(numberOfPage),
      appBar: AppBar(
        centerTitle: true,
        title: Text('bottom_navigation_bar_playlists').tr(),
      ),
      body: Container(
        child: Center(child: Text('в разработке')),
      ),
    );
  }
}
