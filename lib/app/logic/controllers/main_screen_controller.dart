import 'dart:math';

import 'package:icoc/app/logic/controllers/services/firebase_images_service.dart';

import '/index.dart';

class MainScreenController extends GetxController {
  final songsController = Get.put(SongsController());
  var log = Logger();
  String versesOfTheDayUrls = '';
  RxString url = ''.obs;

  @override
  void onInit() async {
    await checkItsFirstRun();

    url.value = await FirebaseImagesService.getUrl(path, randomInt);
    super.onInit();
  }

  int get randomInt {
    var day = DateTime.now().day;
    Random random = new Random();
    int randomNumber = random.nextInt(2) + 1;

    return randomNumber * day;
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
