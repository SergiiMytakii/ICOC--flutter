import 'dart:ui';

import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final GetStorage box = GetStorage();
  String? appLocale;
  if (await box.read('locale') != null) {
    appLocale = box.read('locale');
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(appLocale: appLocale, savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final String? appLocale;
  final AdaptiveThemeMode? savedThemeMode;
  MyApp({Key? key, this.appLocale, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => OKToast(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale:
              appLocale != null ? languagesLocales[appLocale] : window.locale,
          fallbackLocale: Locale('ru', 'RU'),
          theme: light,
          darkTheme: dark,
          translations: Messages(),
          title: 'ICOC',
          home: MainScreen(),
          getPages: Pages.getPages(),
        ),
      ),
    );
  }
}
