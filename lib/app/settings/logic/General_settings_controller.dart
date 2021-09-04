import '/index.dart';

class GeneralSettingsController extends GetxController {
  RxBool darkTheme = false.obs;

  void changeThemeMode(BuildContext context) {
    darkTheme.toggle();
    darkTheme.value
        ? AdaptiveTheme.of(context).setDark()
        : AdaptiveTheme.of(context).setLight();
  }
}
