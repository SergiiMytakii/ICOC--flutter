import '/index.dart';

class SlidesController extends GetxController {
  var log = Logger();
  RxString slideText = ''.obs;
  RxString slideTitle = ''.obs;
  int line = 0;
  int amountLines = 0;
  RxString slide = ''.obs;
  List<String> splitted = [];
  RxDouble fontSize = 30.0.obs;
  var hintColorForward = Colors.transparent.obs;
  var hintColorBack = Colors.transparent.obs;

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
    var result = addSeparates.split('%');
    result.forEach((element) {
      var result2 = element.split('.');
      splitted.addAll(result2);
    });
    amountLines = splitted.length;
    print('before amountLines $amountLines');
    if (amountLines < 2) {
      splitted = divideByStrings(slideText);

      amountLines = splitted.length;
    }

    print(' first  line $line');
    slide.value = slideTitle.value + '\n\n' + splitted[line];
  }

  getNextSlide() {
    if (line < amountLines - 1) {
      print(' after amountLines $amountLines');
      line++;
      //check if slide has just 1 line, stlit it with next slide
      if (splitted[line].length < 18 && line + 1 < amountLines) {
        slide.value = splitted[line] + splitted[line + 1];
        line++;
      } else {
        print(' move forward,  line $line');
        slide.value = splitted[line];
      }
    }
  }

  getPreviosSlide() {
    if (line >= 1) {
      line--;
      print('move back, line $line');
      slide.value = line == 0
          ? slideTitle.value + ' \n \n ' + splitted[line]
          : splitted[line];
    }
  }

  altFontSize(double val) {
    fontSize.value = val;
  }

  List<String> divideByStrings(RxString slideText) {
    String addSeparates = slideText.replaceAll('\n', '\n%');
    List<String> splittedByString = addSeparates.split('%');
    List<String> result = [];
    int stringsInSlide = 5;
    String rawSlide = '';
    int counter = 0;
    for (int i = 0; i < splittedByString.length; i++) {
      if (counter < stringsInSlide) {
        rawSlide += splittedByString[i];
        counter++;
        if (splittedByString.length - 1 == i) {
          result.add(rawSlide);
          amountLines = result.length;
          return result;
        }
      } else {
        rawSlide += splittedByString[i];
        result.add(rawSlide);
        result.forEach((element) {});

        counter = 0;
        rawSlide = '';
      }
    }

    return result;
  }

  revealHint() async {
    hintColorForward.value = Colors.white;
    await Future.delayed(Duration(seconds: 1));
    hintColorForward.value = Colors.transparent;
    await Future.delayed(Duration(seconds: 1));
    hintColorForward.value = Colors.white;
    await Future.delayed(Duration(seconds: 1));
    hintColorForward.value = Colors.transparent;
    await Future.delayed(Duration(seconds: 1));
    hintColorBack.value = Colors.white;
    await Future.delayed(Duration(seconds: 1));
    hintColorBack.value = Colors.transparent;
    await Future.delayed(Duration(seconds: 1));
    hintColorBack.value = Colors.white;
    await Future.delayed(Duration(seconds: 1));
    hintColorBack.value = Colors.transparent;
  }
}
