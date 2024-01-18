import '../../../index.dart';

class NavigationController extends GetxController {
  Map<int, BuildContext> contexts = {};
  int currentIndex = 0;
  void navigateToPlaylistSongs() {}

  void setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
  }
}
