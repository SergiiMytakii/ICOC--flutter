import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../routes/app_routes.dart';

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
  static List<MenuItem> items() {
    return [
      MenuItem('drawer_song_book', ScreenColors.songBook, Icons.music_note,
          Routes.SONGBOOK),
      MenuItem('drawer_first_principles', ScreenColors.bibleStudy,
          Icons.import_contacts, Routes.BIBLE_STUDY),
      MenuItem('drawer_q_and_a', ScreenColors.QandA, Icons.question_answer,
          Routes.Q_AND_ANSVERS),
      MenuItem(
        'Video',
        ScreenColors.video,
        Icons.play_arrow,
        Routes.VIDEO,
      ),
      MenuItem('Say Thank you!', ScreenColors.general, Icons.thumb_up_alt,
          Routes.FEEDBACK_SCREEN),
    ];
  }
}
