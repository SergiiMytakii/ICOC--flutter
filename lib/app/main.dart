import 'package:Projects/app/main_screen.dart';
import 'package:Projects/app/theme.dart';
import 'package:Projects/services/database_firebase.dart';
import 'package:Projects/services/db_sqlite/sqlite_helper.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //findSystemLocale();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp().whenComplete(() {
    print("completed");
  });
  //update local SQL database from firebase
  await DatabaseServiceFirebase().songs.then(
          (songs) {DatabaseHelper().insertAllSongs(songs);});


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



    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) =>  MaterialApp(
          theme: light,
          darkTheme: dark,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'ICOC',
          home: MainScreen(),
        ),
      );

  }
}
