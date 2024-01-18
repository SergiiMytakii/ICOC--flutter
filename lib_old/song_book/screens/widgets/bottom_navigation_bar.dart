import 'package:flutter/cupertino.dart';
import '../videoplayer/iframe_player.dart/video_iframe_player_screen.dart';
import '../../../index.dart';

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
              label: 'bottom_navigation_bar_list'.tr,
              icon: Icon(Icons.queue_music),
            ),
            BottomNavigationBarItem(
              label: 'bottom_navigation_bar_favorites'.tr,
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'bottom_navigation_bar_playlists'.tr,
              icon: Icon(Icons.playlist_play),
            ),
            BottomNavigationBarItem(
              label: 'Video'.tr,
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
                return CupertinoTabView(builder: (context) => SongBookScreen());
              }
            case 1:
              {
                return CupertinoTabView(
                    builder: (context) => FavoritesScreen());
              }
            case 2:
              {
                return CupertinoTabView(
                    builder: (context) => PlaylistsListScreen());
              }
            case 3:
              {
                return CupertinoTabView(
                    builder: (context) => VideoIframePlayerScreen());
                // VideoPlayerScreen(
                //   playNextOn: true,
                // ));
              }
            default:
              {
                return CupertinoTabView(builder: (context) => SongBookScreen());
              }
          }
        });
  }
}
