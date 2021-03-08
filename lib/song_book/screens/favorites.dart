import 'package:Projects/generated/l10n.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  final int numberOfPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(numberOfPage),
      appBar: AppBar(
        title: Text(S.of(context)!.bottom_navigation_bar_favorites),
        centerTitle: true,
      ),
      body: Container(
        child: Center(child: Text('В разработке')),
      ),
    );
  }
}
