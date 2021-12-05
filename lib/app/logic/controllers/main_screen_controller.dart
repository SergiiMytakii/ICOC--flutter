import 'dart:math';

import 'package:icoc/app/logic/controllers/services/firebase_images_service.dart';
import 'package:icoc/app/logic/controllers/services/firebase_notifications_service.dart';
import 'package:icoc/app/models/notifications_model.dart';

import '/index.dart';

class MainScreenController extends GetxController {
  final songsController = Get.put(SongsController());
  var log = Logger();
  String versesOfTheDayUrls = '';
  RxString url = ''.obs;
  RxList<NotificationsModel> notifications = <NotificationsModel>[].obs;
  final GetStorage box = GetStorage();
  RxInt amountNotifications = 0.obs;
  @override
  void onInit() async {
    await checkItsFirstRun();
    await getNotifications();
    url.value = await FirebaseImagesService.getUrl(path, randomInt);
    countNotifications();
    //box.erase(); // to clean cach
    super.onInit();
  }

  Future getNotifications() async {
    final QuerySnapshot dataSnapShots =
        await NotificationsServiceFirebase().notifications;
    String locale = Get.locale!.languageCode.toString();

    dataSnapShots.docs.where((doc) => doc.id == 'MainScreen').forEach((doc) {
      // log.e(doc.get(locale));
      // log.e(locale);
      List notif = doc.get(locale);

      notif.reversed.forEach((item) => notifications.add(NotificationsModel(
          title: item["title"], text: item["text"], link: item["link"])));
    });
  }

  int get randomInt {
    //total amount  photos in firebase
    final int totalAmount = 93;
    var day = DateTime.now().day;
    final Random random = new Random();
    final int randomNumber = random.nextInt(2) + 1;
    assert(randomNumber * day < totalAmount);
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

  bool checkIsRead(String text) {
    Map? readStatus = box.read('notifications');

    if (readStatus != null) {
      if (readStatus.values.contains(text))
        return true;
      else
        return false;
    } else
      return false;
  }

  void countNotifications() {
    Map? readStatus = box.read('notifications');
    if (readStatus != null) {
      for (NotificationsModel item in notifications) {
        log.e(item.text);
        // log.v(readStatus.values);
        if (!readStatus.values.contains(item.text)) {
          amountNotifications.value++;
        }
      }
    } else
      amountNotifications.value = notifications.length;
    //log.e(amountNotifications);
  }
}
