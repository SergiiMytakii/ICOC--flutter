import 'package:icoc/song_book/screens/video_player_screen.dart';

import '/index.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    SongBookScreen(),
    FavoritesScreen(),
    PlaylistsListScreen(),
    VideoPlayerScreen()
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        selectedItemColor: screensColors['songBook']!.withOpacity(0.8),
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          _selectPage(index);
          _pageController.animateToPage(
            _selectedPageIndex,
            duration: const Duration(milliseconds: 250),
            curve: Curves.ease,
          );
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
      body: PageView(
        children: _pages,
        onPageChanged: (index) => _selectPage(index),
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
      ),
    );
  }
}
