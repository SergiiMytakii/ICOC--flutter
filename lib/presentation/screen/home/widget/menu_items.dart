import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';

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
          SONGBOOK),
      MenuItem('Insights', ScreenColors.general, Icons.article, INSIGHTS),
      MenuItem('drawer_first_principles', ScreenColors.bibleStudy,
          Icons.import_contacts, BIBLE_STUDY),
      MenuItem('drawer_q_and_a', ScreenColors.QandA, Icons.question_answer,
          Q_AND_ANSVERS),
      MenuItem(
        'Video',
        ScreenColors.video,
        Icons.play_arrow,
        VIDEO,
      ),
      MenuItem('Feedbacks', ScreenColors.general, Icons.thumb_up_alt,
          FEEDBACK_SCREEN),
    ];
  }
}
