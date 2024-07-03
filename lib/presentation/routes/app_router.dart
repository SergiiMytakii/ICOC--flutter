import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/routes/routes_with_transitions.dart';
import 'package:icoc/presentation/screen/bible_study/bible_study_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_lesson_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_topic_screen.dart';
import 'package:icoc/presentation/screen/feedback/feedback_screen.dart';
import 'package:icoc/presentation/screen/home/about_app_screen.dart';
import 'package:icoc/presentation/screen/home/general_settings_screen.dart';
import 'package:icoc/presentation/screen/home/home_screen.dart';
import 'package:icoc/presentation/screen/home/notifications_screen.dart';
import 'package:icoc/presentation/screen/home/share_app_screen.dart';
import 'package:icoc/presentation/screen/home/terms_of_use_screen.dart';
import 'package:icoc/presentation/screen/q&a/one_q&a_screen.dart';
import 'package:icoc/presentation/screen/q&a/q&a_screen.dart';
import 'package:icoc/presentation/screen/songs/add_song_screen.dart';
import 'package:icoc/presentation/screen/songs/one_song_screen.dart';
import 'package:icoc/presentation/screen/songs/widget/bottom_navigation_bar.dart';
import 'package:icoc/presentation/screen/video/list_topics_screen.dart';
import 'package:icoc/presentation/screen/video/list_videos_screen.dart';
import 'package:icoc/presentation/screen/video/video_player_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: Routes.HOME,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    FadeGoRoute(
        path: Routes.SONGBOOK,
        builder: (BuildContext context, GoRouterState state) =>
            const MyBottomNavigationBar()),
    FadeGoRoute(
      path: Routes.Q_AND_ANSVERS,
      builder: (BuildContext context, GoRouterState state) =>
          QuestionsAndAnswers(),
    ),
    GoRoute(
      path: Routes.ADD_SONG_SCREEN,
      builder: (BuildContext context, GoRouterState state) =>
          const AddSongScreen(),
    ),
    GoRoute(
      path: Routes.ONE_TOPIC_SCREEN,
      builder: (BuildContext context, GoRouterState state) {
        final bibleStudyTopic = state.extra as BibleStudy;
        return OneTopicScreen(topic: bibleStudyTopic);
      },
    ),
    GoRoute(
      path: Routes.ONE_LESSON_SCREEN,
      builder: (BuildContext context, GoRouterState state) {
        final lesson = state.extra as Lesson;
        return OneLessonScreen(lesson: lesson);
      },
    ),
    GoRoute(
      path: Routes.ONE_Q_AND_A_SCREEN,
      builder: (BuildContext context, GoRouterState state) {
        final QandAModel article = state.extra as QandAModel;
        return OneQandAScreen(article: article);
      },
    ),
    FadeGoRoute(
      path: Routes.BIBLE_STUDY,
      builder: (BuildContext context, GoRouterState state) =>
          BibleStudyScreen(),
    ),
    FadeGoRoute(
      path: Routes.VIDEO,
      builder: (BuildContext context, GoRouterState state) =>
          ListTopicsScreen(),
    ),
    VerticalSlideGoRoute(
      path: Routes.VIDEO_PLAYER,
      builder: (BuildContext context, GoRouterState state) {
        final Resources resources = state.extra as Resources;
        return VideoPlayer(resources);
      },
    ),
    GoRoute(
      path: Routes.ONE_SONG_SCREEN,
      builder: (BuildContext context, GoRouterState state) {
        final SongDetail song = state.extra as SongDetail;
        return OneSongScreen(song);
      },
    ),
    GoRoute(
      path: Routes.LIST_VIDEOS_SCREEN,
      builder: (BuildContext context, GoRouterState state) {
        final Video video = state.extra as Video;
        return ListVideosScreen(video: video);
      },
    ),
    FadeGoRoute(
      path: Routes.SHARE_APP_SCREEN,
      builder: (BuildContext context, GoRouterState state) =>
          const ShareAppScreen(),
    ),
    FadeGoRoute(
      path: Routes.SETTINGS,
      builder: (BuildContext context, GoRouterState state) =>
          const GeneralSettingsScreen(),
    ),
    FadeGoRoute(
      path: Routes.TERMS_OF_USE,
      builder: (BuildContext context, GoRouterState state) =>
          const TermsOfUseAndPolicy(),
    ),
    FadeGoRoute(
      path: Routes.ABOUT_APP_SCREEN,
      builder: (BuildContext context, GoRouterState state) =>
          const AboutAppScreen(),
    ),
    FadeGoRoute(
      path: Routes.FEEDBACK_SCREEN,
      builder: (BuildContext context, GoRouterState state) =>
          const FeedbackScreen(),
    ),
    FadeGoRoute(
      path: Routes.NOTIFICATIONS_SCREEN,
      builder: (BuildContext context, GoRouterState state) =>
          NotificationsScreen(),
    ),
  ],
);
