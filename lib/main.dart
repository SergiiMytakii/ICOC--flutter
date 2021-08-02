import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';
import 'package:oktoast/oktoast.dart';
import 'package:Projects/app/screens/main_screen.dart';
import 'package:Projects/app/theme.dart';
import 'package:Projects/routes/pages.dart';
import 'package:Projects/shared/constants.dart';
import 'package:Projects/shared/messages.dart';
import 'package:Projects/song_book/logic/services/database_firebase.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().whenComplete(() {});
  //update local SQL database from firebase
  // await DatabaseServiceFirebase().songs.then((songs) {
  //   DatabaseHelperFTS4().insertAllSongs(songs);
  // });
  GetStorage box = GetStorage();
  String? appLocale;
  if (box.read('locale') != null) appLocale = box.read('locale');

  runApp(MyApp(
    appLocale: appLocale,
  ));
}

class MyApp extends StatelessWidget {
  String? appLocale;
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
