import 'dart:io';
import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';
import 'package:oktoast/oktoast.dart';
import 'package:icoc/app/screens/main_screen.dart';
import 'package:icoc/app/theme.dart';
import 'package:icoc/routes/pages.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/shared/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  GetStorage box = GetStorage();
  String? appLocale;
  if (box.read('locale') != null) appLocale = box.read('locale');
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
        child: Platform.isIOS
            ? GetCupertinoApp(
                locale: appLocale != null
                    ? Constants().languagesLocales[appLocale]
                    : window.locale,
                fallbackLocale: Locale('ru', 'RU'),
                translations: Messages(),
                title: 'ICOC',
                home: MainScreen(),
                getPages: Pages.getPages(),
                theme: CupertinoThemeData(),
              )
            : GetMaterialApp(
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
