import 'package:icoc/index.dart';

class VideoPlayerController extends GetxController {
  RxList<Resources> favoritesVideos = <Resources>[].obs;
  RxBool favoriteStatus = false.obs;
  DatabaseHelperFTS4 databaseHelperFTS4 = DatabaseHelperFTS4();
  @override
  void onInit() {
    fetchFavoritesVideos();
    super.onInit();
  }

  Future fetchFavoritesVideos() async {
    favoritesVideos.value = await databaseHelperFTS4.fetchFavoritesVideos();
  }

  bool getFavoriteStatus(videoID) {
    Resources result = favoritesVideos.firstWhere(
        (element) => element.link.contains(videoID),
        orElse: () => Resources(link: '', lang: '', title: ''));
    if (result.link.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future addToFavorites(Resources video) async {
    await databaseHelperFTS4.addVideoToFavorites(video);
    await fetchFavoritesVideos();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  Future deleteFromFavorites(Resources video) async {
    await databaseHelperFTS4.deleteVideoFromFavorites(video);
    await fetchFavoritesVideos();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Deleted from favorite list'.tr,
    ));
  }
}
