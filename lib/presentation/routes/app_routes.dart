import 'package:flutter/material.dart';
import 'package:icoc/presentation/screen/bible_study/bible_study_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_lesson_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_topic_screen.dart';
import 'package:icoc/presentation/screen/home/about_app_screen.dart';
import 'package:icoc/presentation/screen/home/general_settings_screen.dart';
import 'package:icoc/presentation/screen/home/home_screen.dart';
import 'package:icoc/presentation/screen/home/notifications_screen.dart';
import 'package:icoc/presentation/screen/home/share_app_screen.dart';
import 'package:icoc/presentation/screen/home/terms_of_use_screen.dart';
import 'package:icoc/presentation/screen/q&a/one_q&a_screen.dart';
import 'package:icoc/presentation/screen/q&a/q&a_screen.dart';
import 'package:icoc/presentation/screen/songs/add_song_screen.dart';

import 'package:icoc/presentation/screen/songs/widget/bottom_navigation_bar.dart';
import 'package:icoc/presentation/screen/feedback/feedback_screen.dart';
import 'package:icoc/presentation/screen/video/list_topics_screen.dart';
import 'package:icoc/presentation/widget/fade_page_route.dart';

class Routes {
  static const HOME = '/';
  static const SONGBOOK = '/bottom_navigation_bar';
  static const Q_AND_ANSVERS = '/q_and_a';
  static const ADD_SONG_SCREEN = '/add_song_screen';
  static const ICOC_RU_NEWS = '/news';
  static const BIBLE_STUDY = '/bible_study_screen';
  static const NOTIFICATIONS_SCREEN = '/notifications_screen';
  static const SETTINGS = '/general_settings';
  static const ONE_SONG_SCREEN = '/one_song_screen';
  static const ABOUT_APP_SCREEN = '/about_app_screen';
  static const ONE_NEWS_SCREEN = '/one_news_screen';
  static const ONE_TOPIC_SCREEN = '/one_topic_screen';
  static const ONE_LESSON_SCREEN = '/one_lesson_screen';
  static const ONE_Q_AND_A_SCREEN = '/one_q_and_a_screen';
  static const SHARE_APP_SCREEN = '/share_app_screen';
  static const VIDEO_PLAYER_SCREEN = '/video_player_screen';
  static const FEEDBACK_SCREEN = '/feedback_screen';
  static const VIDEO = '/video_titles_screen';
  static const TERMS_OF_USE = '/terms_of_use_screen';
}

final routes = {
  Routes.HOME: (context) => HomeScreen(),
  // Routes.ONE_SONG_SCREEN: (context) => OneSongScreen(),
  Routes.ADD_SONG_SCREEN: (context) => AddSongScreen(),
  Routes.ONE_TOPIC_SCREEN: (context) => OneTopicScreen(),
  Routes.ONE_LESSON_SCREEN: (context) => OneLessonScreen(),
  Routes.ONE_Q_AND_A_SCREEN: (context) => OneQandAScreen(),
};

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.SONGBOOK:
      return FadePageRoute(
        builder: (context) {
          return MyBottomNavigationBar();
        },
      );
    case Routes.BIBLE_STUDY:
      return FadePageRoute(
        builder: (context) {
          return BibleStudyScreen();
        },
      );
    case Routes.Q_AND_ANSVERS:
      return FadePageRoute(
        builder: (context) {
          return QuestionsAndAnswers();
        },
      );
    case Routes.VIDEO:
      return FadePageRoute(
        builder: (context) {
          return ListTopicsScreen();
        },
      );
    case Routes.SHARE_APP_SCREEN:
      return FadePageRoute(
        builder: (context) {
          return ShareAppScreen();
        },
      );
    case Routes.SETTINGS:
      return FadePageRoute(
        builder: (context) {
          return GeneralSettingsScreen();
        },
      );
    case Routes.TERMS_OF_USE:
      return FadePageRoute(
        builder: (context) {
          return TermsOfUseAndPolicy();
        },
      );
    case Routes.ABOUT_APP_SCREEN:
      return FadePageRoute(builder: (context) {
        return AboutAppScreen();
      });
    case Routes.FEEDBACK_SCREEN:
      return FadePageRoute(builder: (context) {
        return FeedbackScreen();
      });
    case Routes.NOTIFICATIONS_SCREEN:
      return FadePageRoute(
        builder: (context) {
          return NotificationsScreen();
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
