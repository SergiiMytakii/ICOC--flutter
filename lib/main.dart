import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icoc/core/bloc/multibloc_provider.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';
import 'constants.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'presentation/routes/app_routes.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  _activateCrashlitics();
  FirebaseAnalytics.instance
      .logAppOpen(callOptions: AnalyticsCallOptions(global: true));
  String? appLocale =
      await SharedPreferencesHelper.getString(SharedPreferencesKeys.locale);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: languagesCodes.keys
          .map((languageCode) => Locale(languageCode))
          .toList(),
      path: 'assets/translations',
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
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => MyMultiblocProvider(
        child: OverlaySupport.global(
          toastTheme: ToastThemeData(textColor: Colors.white),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: light,
              darkTheme: dark,
              title: 'ICOC',
              routes: routes,
              onGenerateRoute: (settings) => onGenerateRoute(settings)),
        ),
      ),
    );
  }
}

_activateCrashlitics() {
  final logger = Logger();
  FlutterError.onError = (errorDetails) {
    logger.e(errorDetails);
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e(error);
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
