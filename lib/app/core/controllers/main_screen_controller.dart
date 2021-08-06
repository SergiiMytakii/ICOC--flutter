import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:logger/logger.dart';

class MainScreenController extends GetxController {
  final songsController = SongsController();
  var log = Logger();

  @override
  void onInit() async {
    await songsController.fetchDataFromFirebase();
    log.i('fetch from main screen');
    super.onInit();
  }
}
