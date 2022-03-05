import '/index.dart';

class OrderLangController extends GetxController {
  List<String> orderLang = ['ru', 'uk', 'en'];
  GetStorage box = GetStorage();
  final log = Logger();
  @override
  void onInit() {
    loadOrderlang();
    super.onInit();
  }

  void loadOrderlang() {
    if (box.read('orderLang') != null) {
      orderLang = List.from(box.read('orderLang'));
    } else {
      box.write('orderLang',
          orderLang); //todo сделать, чтобы в порядке языков первоначально был сначала язык устройства
    }
    update();
  }

  void setOrderLang() {
    box.write('orderLang', orderLang);
    update();
  }

  List<String?>? chooseCardLang(dynamic song) {
    String? title;
    String? text;

    //check every key and if it fit to FIRST preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[0] && key != null) {
        title = song.title[orderLang[0]];
        final Iterable keys = song.text.keys;
        String k = keys.firstWhere((ke) => ke.contains(key));
        text = song.text[k];
      }
    });
    if (title != null) return [title, text];

    //check every key and if it fit to SECOND preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[1] && key != null) {
        title = song.title[orderLang[1]];
        final Iterable keys = song.text.keys;
        String k = keys.firstWhere((ke) => ke.contains(key));
        text = song.text[k];
      }
    });
    if (title != null) return [title, text];

    //check every key and if it fit to THIRD  preferred lang and not equal null
    //we return value  of this key
    song.title.keys.forEach((key) {
      if (key == orderLang[2] && key != null) {
        title = song.title[orderLang[2]];
        final Iterable keys = song.text.keys;
        String k = keys.firstWhere((ke) => ke.contains(key));
        text = song.text[k];
      }
    });
    if (title != null) return [title, text];
    update();
  }
}
