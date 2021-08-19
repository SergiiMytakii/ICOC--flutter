import 'package:getxfire/getxfire.dart';
import 'package:logger/logger.dart';

class SlidesController extends GetxController {
  var log = Logger();
  RxString slideText = ''.obs;
  RxString slideTitle = ''.obs;
  int line = 0;
  int amountLines = 0;
  RxString slide = ''.obs;
  List<String> splitted = [];
  RxDouble fontSize = 30.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    slide.value = '';
    super.onClose();
  }

  void getFirstSlide() {
    String addSeparates = slideText
        .replaceAll('\n\n', '\n\n%')
        .replaceAll('\r\n \r\n', '\r\n \r\n%')
        .replaceAll('\r\n  \r\n', '\r\n \r\n%')
        .replaceAll('\r\n\r\n', '\r\n \r\n%');
    splitted = addSeparates.split('%');
    amountLines = splitted.length;

    slide.value = slideTitle.value + '\n\n' + splitted[line];
    line++;
    print('line $line');
  }

  // String addSplit(String line) {
  //   String result = '';
  //   int i = 0;
  //   List<String> j = line.split('');
  //   j.forEach((element) {
  //     if (element == ' ') {
  //       i++;
  //     }
  //   });
  //   if (i > 3) {
  //     result = line.replaceAll(',', ',\n');
  //   } else {
  //     result = line;
  //   }
  //   log.i(result);
  //   return result;
  // }

  getNextSlide() {
    if (line < amountLines) {
      if (splitted[line].length < 18 && line + 1 < amountLines) {
        slide.value = splitted[line] + splitted[line + 1];
        line++;
      } else {
        slide.value = splitted[line];
      }

      line++;
      print('line $line');
    }
  }

  getPreviosSlide() {
    if (line >= 1) {
      line--;
      slide.value = line == 0
          ? slideTitle.value + ' \n \n ' + splitted[line]
          : splitted[line];
    }
    print('line $line');
  }

  altFontSize(double val) {
    fontSize.value = val;
  }
}
