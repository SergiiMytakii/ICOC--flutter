import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';

class OrderLangController extends GetxController {
  List<String> orderLang = ['ru', 'uk', 'en'];
  GetStorage box = GetStorage();
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
}
