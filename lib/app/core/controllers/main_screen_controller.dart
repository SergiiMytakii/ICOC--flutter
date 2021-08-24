import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:logger/logger.dart';

class MainScreenController extends GetxController {
  final songsController = Get.put(SongsController());
  var log = Logger();

  @override
  void onInit() async {
    await songsController.fetchDataFromFirebase();
    super.onInit();
  }
}
