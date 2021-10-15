import 'package:icoc/index.dart';

class QandAController extends GetxController {
  RxList<QandAModel> ansvers = <QandAModel>[].obs;
  GetStorage box = GetStorage();
  RxDouble fontSize = 16.0.obs;
  @override
  void onInit() async {
    ansvers.value = await SqliteDatabaseService().getAnsvers();
    loadFontSize();
    super.onInit();
  }

  void loadFontSize() {
    if (box.read('q&a_fontSize') != null)
      fontSize.value = box.read('q&a_fontSize');
  }

  altFontSize(double val) {
    fontSize.value = val;
    box.write('q&a_fontSize', val);
  }
}
