import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'constants.dart';
import 'core/bloc/bloc/songs_bloc.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'presentation/screen/home/about_app_screen.dart';
import 'presentation/screen/home_screen.dart';
import 'presentation/screen/routes/app_routes.dart';
import 'presentation/screen/songs/add_song_screen.dart';
import 'presentation/screen/songs/one_song_screen.dart';
import 'presentation/screen/songs/widget/bottom_navigation_bar.dart';
import 'presentation/widget/fade_page_route.dart';
import 'theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  String? appLocale =
      await SharedPreferencesHelper.getString(SharedPreferencesKeys.locale);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(EasyLocalization(
      supportedLocales: languagesCodes.keys
          .map((languageCode) => Locale(languageCode))
          .toList(),
      path: 'assets/translations',
      // startLocale: appLocale != null
      //     ? languagesLocales[appLocale]
      //     : Localizations.localeOf(context),
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(appLocale: appLocale, savedThemeMode: savedThemeMode)));
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SongsBloc>(
                create: (BuildContext context) =>
                    SongsBloc()..add(SongsRequested())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: light,
            darkTheme: dark,
            title: 'ICOC',
            routes: {
              Routes.HOME: (context) => HomeScreen(),
              Routes.ABOUT_APP_SCREEN: (context) => AboutAppScreen(),
              Routes.ADD_SONG_SCREEN: (context) => AddSongScreen(),
              // Routes.ONE_SONG_SCREEN: (context) => OneSongScreen(),
              // Routes.SONGBOOK: (context) => MyBottomNavigationBar()
            },
            onGenerateRoute: (settings) {
              if (settings.name == Routes.SONGBOOK) {
                return FadePageRoute(
                  builder: (context) {
                    return MyBottomNavigationBar();
                  },
                );
              }
              return MaterialPageRoute(builder: (context) => HomeScreen());
            },
          ),
        ),
      ),
    );
  }
}
