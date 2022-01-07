import 'package:icoc/app/screens/share_app_screen.dart';
import 'package:icoc/q_and_a/screens/one_q_and_ansver_screen.dart';
import 'package:icoc/song_book/logic/controllers/video_player_controller.dart';
import 'package:icoc/song_book/screens/video_player_screen.dart';

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
        name: Routes.NEWS,
        page: () => NewsScreen(),
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
          Get.lazyPut<VideoPlayerController>(() => VideoPlayerController());
        }),
      ),
    ];
  }
}
