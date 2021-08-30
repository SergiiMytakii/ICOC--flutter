import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:logger/logger.dart';

class MainScreenController extends GetxController {
  final songsController = Get.put(SongsController());
  var log = Logger();

  @override
  void onInit() async {
    await checkItsFirstRun();
    super.onInit();
  }

  Future checkItsFirstRun() async {
    GetStorage box = GetStorage();
    if (box.read('first_run') == null) {
      log.i('first run');
      await songsController.fetchDataFromFirebase();

      box.write('first_run', false);
    } else
      songsController.fetchSongsList();
  }
}
