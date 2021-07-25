import 'dart:ui';

import 'package:Projects/app/theme.dart';
import 'package:Projects/router/app_router.dart';
import 'package:Projects/shared/constants.dart';
import 'package:Projects/shared/messages.dart';
import 'package:Projects/song_book/logic/services/database_firebase.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().whenComplete(() {
    print("completed");
  });
  //update local SQL database from firebase
  await DatabaseServiceFirebase().songs.then((songs) {
    DatabaseHelperFTS4().insertAllSongs(songs);
  });

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({Key? key, required this.appRouter}) : super(key: key);
  String? appLocale;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => OKToast(
        child: GetMaterialApp(
          locale: getLocale()
              ? Constants().languagesLocales[appLocale]
              : window.locale,
          theme: light,
          darkTheme: dark,
          translations: Messages(),
          title: 'ICOC',
          onGenerateRoute: appRouter.onGenerateRoute,
          fallbackLocale: Locale('ru', 'RU'),
        ),
      ),
    );
  }

  bool getLocale() {
    GetStorage box = GetStorage();
    if (box.read('locale') != null) appLocale = box.read('locale');
    return true;
  }
}
