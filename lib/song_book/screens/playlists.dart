import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Playlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
