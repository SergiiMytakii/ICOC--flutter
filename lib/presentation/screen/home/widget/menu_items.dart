import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../routes/app_routes.dart';

class MenuItem {
  final String title;
  final Color color;
  final IconData icon;
  final String routeName;
  MenuItem(
    this.title,
    this.color,
    this.icon,
    this.routeName,
  );
}

class HomeScreenMenuItems {
  static List<MenuItem> items(BuildContext? context) {
    return [
      MenuItem('drawer_song_book'.tr(context: context),
          screensColors['songBook']!, Icons.music_note, Routes.SONGBOOK),
      MenuItem(
          'drawer_first_principles'.tr(context: context),
          screensColors['bibleStudy']!,
          Icons.import_contacts,
          Routes.BIBLE_STUDY),
      MenuItem('drawer_q_and_a'.tr(context: context), screensColors['Q&A']!,
          Icons.question_answer, Routes.Q_AND_ANSVERS),
      MenuItem(
        'Q&A with Andy Fleming'.tr(context: context),
        screensColors['news']!,
        Icons.question_answer, Routes.PLAYLISTS_PLAYER,
        // arguments: [
        //   Q_AND_A_ANDY_FLEMING_PLAYLIST_ID,
        //   'Q&A with Andy Fleming'.tr,
        //   screensColors['news']!
        // ]
      ),
      MenuItem(
        'Bible school'.tr(context: context), screensColors['general']!,
        Icons.video_collection, Routes.PLAYLISTS_PLAYER,
        // arguments: [
        //   BIBLE_SCHOOL_PLAYLIST_ID,
        //   'Bible school'.tr,
        //   screensColors['general']!,
        // ]
      ),
      MenuItem('Say Thank you!'.tr(context: context), screensColors['news']!,
          Icons.thumb_up_alt, Routes.MAIN_NEWS),
    ];
  }
}
