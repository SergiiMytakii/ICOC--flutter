import 'package:Projects/song_book/screens/song_book.dart';
import 'package:Projects/theme.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //findSystemLocale();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp().whenComplete(() {
    print("completed");
  });

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uk', 'UK')
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    currentLanguage = Intl.systemLocale.substring(0, 2);

    //print(currentLanguage);

    // void changeLang(String newLanguage) {
    //   setState(() {
    //     currentLanguage = newLaguage;
    //   });
    // }

    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => OKToast(
        child: MaterialApp(
          theme: light,
          darkTheme: dark,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'ICOC',
          home: SongBook(),
        ),
      ),
    );
  }
}
