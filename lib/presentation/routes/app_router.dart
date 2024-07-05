import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/playlist.dart';
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
    //main sections
    FadeGoRoute(
        path: HOME,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
        routes: [
          //main sections
          FadeGoRoute(
              path: SONGBOOK,
              builder: (BuildContext context, GoRouterState state) =>
                  const MyBottomNavigationBar(),
              routes: [
                GoRoute(
                  path: '$ONE_SONG_SCREEN/:songId/:tabsCount',
                  builder: (BuildContext context, GoRouterState state) {
                    final songId = state.pathParameters['songId'];
                    final tabsCount = state.pathParameters['tabsCount'];
                    final lang = state.uri.queryParameters['lang'];

                    return OneSongScreen(
                      songId: songId ?? '',
                      tabsCount: int.parse(tabsCount ?? '1'),
                      lang: lang,
                    );
                  },
                ),
                GoRoute(
                  path: ADD_SONG_SCREEN,
                  builder: (BuildContext context, GoRouterState state) =>
                      const AddSongScreen(),
                ),
              ]),
          FadeGoRoute(
              path: Q_AND_ANSVERS,
              builder: (BuildContext context, GoRouterState state) =>
                  QuestionsAndAnswers(),
              routes: [
                GoRoute(
                  path: ONE_Q_AND_A_SCREEN,
                  builder: (BuildContext context, GoRouterState state) {
                    final QandAModel article = state.extra as QandAModel;
                    return OneQandAScreen(article: article);
                  },
                ),
              ]),

          FadeGoRoute(
              path: BIBLE_STUDY,
              builder: (BuildContext context, GoRouterState state) =>
                  BibleStudyScreen(),
              routes: [
                GoRoute(
                    path: '$ONE_TOPIC_SCREEN/:topicId',
                    builder: (BuildContext context, GoRouterState state) {
                      final id = state.pathParameters['topicId'];
                      return OneTopicScreen(topicId: id ?? '');
                    },
                    routes: [
                      GoRoute(
                        path: '$ONE_LESSON_SCREEN/:id',
                        builder: (BuildContext context, GoRouterState state) {
                          final id = state.pathParameters['id'];
                          final topicId = state.pathParameters['topicId'];
                          return OneLessonScreen(
                              lessonId: id ?? '', topicId: topicId ?? '');
                        },
                      ),
                    ]),
              ]),
          FadeGoRoute(
              path: VIDEO,
              builder: (BuildContext context, GoRouterState state) =>
                  ListTopicsScreen(),
              routes: [
                GoRoute(
                    path: '$LIST_VIDEOS_SCREEN/:playlistId',
                    builder: (BuildContext context, GoRouterState state) {
                      final playlistId = state.pathParameters['playlistId'];
                      final playlistName = state.extra as String?;
                      return ListVideosScreen(
                        playlistId: playlistId ?? '',
                        playlistName: playlistName,
                      );
                    },
                    routes: [
                      VerticalSlideGoRoute(
                        path: '$VIDEO_PLAYER/:videoId',
                        builder: (BuildContext context, GoRouterState state) {
                          final videoId = state.pathParameters['videoId'];
                          return VideoPlayer(videoId: videoId ?? '');
                        },
                      ),
                    ]),
              ]),

          FadeGoRoute(
            path: FEEDBACK_SCREEN,
            builder: (BuildContext context, GoRouterState state) =>
                const FeedbackScreen(),
          ),

          //menu screens

          FadeGoRoute(
            path: SETTINGS,
            builder: (BuildContext context, GoRouterState state) =>
                const GeneralSettingsScreen(),
          ),
          FadeGoRoute(
            path: SHARE_APP_SCREEN,
            builder: (BuildContext context, GoRouterState state) =>
                const ShareAppScreen(),
          ),
          FadeGoRoute(
            path: TERMS_OF_USE,
            builder: (BuildContext context, GoRouterState state) =>
                const TermsOfUseAndPolicy(),
          ),
          FadeGoRoute(
            path: ABOUT_APP_SCREEN,
            builder: (BuildContext context, GoRouterState state) =>
                const AboutAppScreen(),
          ),

          FadeGoRoute(
            path: NOTIFICATIONS_SCREEN,
            builder: (BuildContext context, GoRouterState state) =>
                NotificationsScreen(),
          ),
        ]),
  ],
);
