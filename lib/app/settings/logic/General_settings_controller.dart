import 'package:flutter/scheduler.dart';

import '/index.dart';

class GeneralSettingsController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  onInit() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    isDarkMode.value = savedThemeMode == AdaptiveThemeMode.dark;
    super.onInit();
  }

  void changeThemeMode(BuildContext context) {
    isDarkMode.toggle();
    isDarkMode.value
        ? AdaptiveTheme.of(context).setDark()
        : AdaptiveTheme.of(context).setLight();
  }
}
