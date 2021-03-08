import 'package:Projects/generated/l10n.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Playlists extends StatelessWidget {
  final int numberOfPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(numberOfPage),
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context)!.bottom_navigation_bar_playlists),
      ),
      body: Container(
        child: Center(child: Text('в разработке')),
      ),
    );
  }
}
