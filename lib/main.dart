import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  GetStorage box = GetStorage();
  String? appLocale;
  if (await box.read('locale') != null) {
    appLocale = box.read('locale');
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(
    appLocale: appLocale,
  ));
}

class MyApp extends StatelessWidget {
  final String? appLocale;
  MyApp({
    Key? key,
    this.appLocale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => OKToast(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: appLocale != null
              ? Constants().languagesLocales[appLocale]
              : window.locale,
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
