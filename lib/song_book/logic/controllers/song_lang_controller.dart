import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';

class SongLangController extends GetxController {
  GetStorage box = GetStorage();
  var songLang = {'ru': true, 'uk': true, 'en': true};
  @override
  void onInit() {
    loadSonglang();
    super.onInit();
  }

  void loadSonglang() {
    if (box.read('songLang') != null) {
      songLang = Map.from(box.read('songLang'));
    } else {
      box.write('songLang', songLang);
    }
    update();
  }

  void setSongLang(String lang, bool val) {
    songLang[lang] = val;
    box.write('songLang', songLang);
    update();
  }
}
