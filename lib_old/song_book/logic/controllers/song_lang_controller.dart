import '../../../index.dart';

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

  void setSongLang(String lang, bool? val) {
    if (val != null) {
      songLang[lang] = val;
      box.write('songLang', songLang);
      update();
    }
  }
}
