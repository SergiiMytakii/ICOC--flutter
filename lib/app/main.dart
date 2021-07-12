
import 'package:Projects/app/theme.dart';
import 'package:Projects/router/app_router.dart';
import 'package:Projects/song_book/logic/services/database_firebase.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp().whenComplete(() {
    print("completed");
  });
  //update local SQL database from firebase
  await DatabaseServiceFirebase().songs.then((songs) {
    DatabaseHelperFTS4().insertAllSongs(songs);
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
      child: MyApp(appRouter: AppRouter(),)));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) =>
          OKToast(
            child: MaterialApp(
              theme: light,
              darkTheme: dark,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'ICOC',
              onGenerateRoute: appRouter.onGenerateRoute,


            ),
          ),
    );
  }

}