import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:icoc/song_book/models/song.dart';

class FavoritesController extends GetxController {
  var favSongs = <Song>[].obs;
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
    await DatabaseHelperFTS4().getFavoriteStatus(songId).then((value) {
      favStatus.value = value;
    });
  }

  void toggleFavStatus(int songId) async {
    favStatus.value ? deleteFromFavorites(songId) : addToFavorites(songId);
    favStatus.toggle();
  }
}
