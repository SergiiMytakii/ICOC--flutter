import 'package:getxfire/getxfire.dart';

class SlidesController extends GetxController {
  RxString slideText = ''.obs;
  RxString slideTitle = ''.obs;
  get slide {
    return slideTitle.value +
        ' \n \n ' +
        slideText.value.substring(0, 20) +
        '\n ' +
        slideText.value.substring(20, 38);
  }
}
