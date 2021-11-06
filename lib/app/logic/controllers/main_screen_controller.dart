import 'package:icoc/app/logic/controllers/services/firebase_images_service.dart';

import '/index.dart';

class MainScreenController extends GetxController {
  final songsController = Get.put(SongsController());
  var log = Logger();
  //final FirebaseImagesService firebaseImagesService = FirebaseImagesService();

  @override
  void onInit() async {
    await checkItsFirstRun();
    FirebaseImagesService.listAll(path);
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
