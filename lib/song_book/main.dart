import 'package:Projects/generated/l10n.dart';
import 'package:Projects/song_book/screens/song_book.dart';
import 'package:Projects/theme.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => MaterialApp(
        theme: light,
        darkTheme: dark,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'ICOC',
        home: SongBook(),
      ),
    );
  }
}
