import 'dart:ui';

const List<Color> dividerColors = [
  Color(0xFFFF595E),
  Color(0xffffca3a),
  Color(0xff8ac926),
  Color(0xff1982c4),
  Color(0xff6a4c93)
];

const Map<String, Color> screensColors = {
  'songBook': Color(0xffff595e),
  'news': Color(0xffffca3a),
  'firstPrinciples': Color(0xff8ac926),
  'Q&A': Color(0xff1982c4)
};
final Map<String, Locale> languagesLocales = {
  'ru': Locale('ru', 'RU'),
  'en': Locale('en', 'US'),
  'uk': Locale('uk', 'UK')
};

const String email = 'serjmitaki@gmail.com';
const String versionApp = '4.0.0';

enum SlideActions { AllSongs, Favorites, Playlists }
