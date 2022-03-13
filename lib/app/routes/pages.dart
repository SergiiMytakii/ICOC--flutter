import 'package:icoc/app/modules/youtube_playlist_player/screens/youtube_playlist_player.dart';
import 'package:icoc/app/screens/share_app_screen.dart';
import 'package:icoc/news/screens/kyiv_insta_news_screen.dart';
import 'package:icoc/news/screens/main_news_screen.dart';

import 'package:icoc/q_and_a/screens/one_q_and_ansver_screen.dart';
import 'package:icoc/song_book/screens/videoplayer/video_player_screen.dart';

import '../../index.dart';

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.MAIN,
        page: () => MainScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
        binding: BindingsBuilder(() {
          Get.lazyPut<MainScreenController>(() => MainScreenController());
        }),
      ),
      GetPage(
        name: Routes.SONGBOOK,
        page: () => MyBottomNavigationBar(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.Q_AND_ANSVERS,
        page: () => QuestionsAndAnwers(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.FIRST_PRINCIPLES,
        page: () => BibleStudyScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ICOC_RU_NEWS,
        page: () => IcocNewsRuScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.KYIV_INSTA_NEWS,
        page: () => KyivInstaNewsScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.PLAYLISTS_PLAYER,
        page: () => YotubePlaylistPlayerScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.MAIN_NEWS,
        page: () => MainNewsScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.SETTINGS,
        page: () => GeneralSettingsScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.SLIDES_SCREEN,
        page: () => SlidesScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ABOUT_APP_SCREEN,
        page: () => AboutAppScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ONE_NEWS_SCREEN,
        page: () => OneNewsScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ONE_TOPIC_SCREEN,
        page: () => OneTopicScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ONE_LESSON_SCREEN,
        page: () => OneLessonScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ONE_Q_AND_A_SCREEN,
        page: () => OneQandAScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.SHARE_APP_SCREEN,
        page: () => ShareAppScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.VIDEO_PLAYER_SCREEN,
        page: () => VideoPlayerScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
        binding: BindingsBuilder(() {
          Get.lazyPut<GetxVideoPlayerController>(
              () => GetxVideoPlayerController());
        }),
      ),
    ];
  }
}
