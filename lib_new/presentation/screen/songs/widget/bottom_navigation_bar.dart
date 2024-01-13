import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/model/song_detail.dart';
import '../../../widget/fade_page_route.dart';
import '../../routes/app_routes.dart';
import '../favorites_screen.dart';
import '../one_song_screen.dart';
import '../song_book_screen.dart';
import '../video_iframe_player_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // kTabBarHeight = 50;
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: _selectedPageIndex,
          activeColor: screensColors['songBook']!.withOpacity(0.8),
          // backgroundColor: Colors.transparent,

          onTap: (index) {
            _selectPage(index);
          },
          items: [
            BottomNavigationBarItem(
              label: 'bottom_navigation_bar_list'.tr(),
              icon: Icon(Icons.queue_music),
            ),
            BottomNavigationBarItem(
              label: 'bottom_navigation_bar_favorites'.tr(),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Video'.tr(),
              icon: Icon(
                Icons.play_circle,
              ),
            ),
          ],
        ),
        tabBuilder: (context, int) {
          switch (int) {
            case 0:
              {
                return CupertinoTabView(
                    builder: (context) => SongBookScreen(),
                    // navigatorKey: GlobalKey<NavigatorState>(),
                    onGenerateRoute: (settings) {
                      if (settings.name == Routes.ONE_SONG_SCREEN) {
                        // Extract the arguments from settings.arguments
                        // final SongDetail songDetail = settings.arguments as SongDetail;

                        return CupertinoPageRoute(
                          builder: (context) =>
                              OneSongScreen(settings.arguments as SongDetail),
                        );
                      }
                      return null;
                    });
              }
            // case 1:
            //   {
            //     return CupertinoTabView(
            //         builder: (context) => FavoritesScreen());
            //   }

            // case 2:
            //   {
            //     return CupertinoTabView(
            //         builder: (context) => VideoIframePlayerScreen());
            //     // VideoPlayerScreen(
            //     //   playNextOn: true,
            //     // ));
            //   }
            default:
              {
                return CupertinoTabView(builder: (context) => SongBookScreen());
              }
          }
        });
  }
}
