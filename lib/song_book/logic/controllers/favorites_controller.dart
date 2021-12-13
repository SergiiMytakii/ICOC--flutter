import '/index.dart';

class FavoritesController extends GetxController {
  var favSongs = <SongDetail>[].obs;
  final favStatus = false.obs;

  @override
  void onInit() async {
    fetchFavoritesList();

    super.onInit();
  }

  void addToFavorites(int songId) async {
    await DatabaseHelperFTS4().addToFavorites(songId);
    fetchFavoritesList();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to favorite list'.tr,
    ));
  }

  void deleteFromFavorites(int songId) async {
    await DatabaseHelperFTS4().deleteFromFavorites(songId);
    fetchFavoritesList();
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Deleted from favorite list'.tr,
    ));
  }

  void fetchFavoritesList() async {
    DatabaseHelperFTS4().getListFavorites().listen((songsFromDb) {
      favSongs.value = songsFromDb;
    });
  }

  void getFavoriteStatus(songId) async {
    favStatus.value = await DatabaseHelperFTS4().getFavoriteStatus(songId);
  }

  void toggleFavStatus(int songId) async {
    favStatus.value ? deleteFromFavorites(songId) : addToFavorites(songId);
    favStatus.toggle();
  }
}
