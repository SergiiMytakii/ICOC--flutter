import 'package:Projects/app/screens/main_screen.dart';
import 'package:Projects/first_principles/presentation/screens/first_principles_screen.dart';
import 'package:Projects/news/presentation/screens/news_screen.dart';
import 'package:Projects/q_and_a/presentation/screens/q_and_a_screen.dart';
import 'package:Projects/routes/routes.dart';
import 'package:Projects/settings/presentation/general_settings.dart';
import 'package:Projects/song_book/views/screens/playlist_screen.dart';
import 'package:Projects/song_book/views/widgets/add_song_to_playlist.dart';
import 'package:Projects/song_book/views/widgets/bottom_navigation_bar.dart';
import 'package:getxfire/getxfire.dart';

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
        name: Routes.QANDANVERS,
        page: () => QuestionsAndAnwers(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.FIRSTPRINCIPLES,
        page: () => FirstPrinciples(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.NEWS,
        page: () => News(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: Routes.SETTINGS,
        page: () => GeneralSettings(),
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
        name: Routes.ADDTOPLAYLIST,
        page: () => AddSongToPlaylistsScreen(),
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 250),
      ),
    ];
  }
}
