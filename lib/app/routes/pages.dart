import 'package:icoc/app/screens/about_app_screen.dart';

import '../../index.dart';

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.MAIN,
        page: () => MainScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
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
        page: () => FirstPrinciples(),
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
        name: Routes.PLAYLISTS,
        page: () => PlaylistScreen(),
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
        name: Routes.SONG_SCREEN,
        page: () => SongScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.ABOUT_APP_SCREEN,
        page: () => AboutAppScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
    ];
  }
}
