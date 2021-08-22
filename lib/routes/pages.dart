import 'package:icoc/app/screens/main_screen.dart';
import 'package:icoc/first_principles/views/screens/first_principles_screen.dart';
import 'package:icoc/news/views/screens/news_screen.dart';
import 'package:icoc/q_and_a/views/screens/q_and_a_screen.dart';
import 'package:icoc/routes/routes.dart';
import 'package:icoc/settings/views/general_settings.dart';
import 'package:icoc/song_book/views/screens/add_song_from_playlist_screen.dart';
import 'package:icoc/song_book/views/screens/playlist_screen.dart';
import 'package:icoc/song_book/views/screens/slides_screen.dart';
import 'package:icoc/song_book/views/screens/song_screen.dart';
import 'package:icoc/song_book/views/widgets/add_song_to_playlist.dart';
import 'package:icoc/song_book/views/widgets/bottom_navigation_bar.dart';
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
        name: Routes.ADD_TO_PLAYLIST,
        page: () => AddSongToPlaylistsScreen(),
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
        name: Routes.ADD_SONG_FROM_PLAYLIST_SCREEN,
        page: () => AddSongFromPlaylistScreen(),
        transition: Transition.topLevel,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
  }
}
