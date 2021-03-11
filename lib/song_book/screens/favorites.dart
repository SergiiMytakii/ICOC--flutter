import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  final int numberOfPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(numberOfPage),
      appBar: AppBar(
        title: Text('bottom_navigation_bar_favorites').tr(),
        centerTitle: true,
      ),
      body: Container(
        child: Center(child: Text('В разработке')),
      ),
    );
  }
}
