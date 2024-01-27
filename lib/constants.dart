import 'dart:ui';

const List<Color> dividerColors = [
  Color(0xFFFF595E),
  Color(0xffffca3a),
  Color(0xff8ac926),
  Color(0xff1982c4),
  Color(0xff6a4c93)
];

class ScreenColors {
  static const general = Color(0xff6a4c93);
  static const songBook = Color(0xffff595e);
  static const video = Color(0xffffca3a);
  static const bibleStudy = Color(0xff8ac926);
  static const QandA = Color(0xff1982c4);
}

const String email = 'serjmitaki@gmail.com';
const String payPalAccount = 'serjmitaki@gmail.com';
const String usdtWallet = 'TF9irV2F7CoGVpZFvDxvV7hzmT9esWanjf';
const String monoBankCard = '5375 4141 1210 8369';
const String versionApp = '5.0.1';
const appUrlPlayMarket =
    'https://play.google.com/store/apps/details?id=ru.icoc.app';
const appUrlAppStore = 'https://apps.apple.com/us/app/icoc/id1585486521';

enum SlideActions { AllSongs, Favorites, Playlists }

const YOUTUBE_API_KEY = 'AIzaSyA-Hp3iqUoRZKhVwZ3lqFOOwntlkOaZg5I';

const String YOUTUBE_TERMS_OF_SERVISES = 'https://www.youtube.com/t/terms';
const String YOUTUBE_PRIVACY_POLICIES = 'https://policies.google.com/privacy';

class StorageKeys {
  static const String orderLanguages = 'orderLanguages';
  static const String orderByTitle = 'orderByTitle';
  static const String allSongsTitleKeys = 'allSongsTitleKeys';
  static const String allSongsTextKeys = 'allSongsTextKeys';
  static const String locale = 'locale';
  static const String fontSize = 'fontSize';
  static const String bibleStudyLanguages = 'bibleStudyLanguages';
  static const String bibleStudyAllLanguages = 'bibleStudyAllLanguages';
  static const String notifications = 'notifications';
  static const String videosLanguages = 'videosLanguages';
  static const String videosAllLanguages = 'videosAllLanguages';
  static const String firstAppRunDate = 'firstAppRunDate';
  // Add more keys as needed
}

Map<String, String> languagesCodes = {
  'en': 'English',
  'et': 'Estonian',
  'fr': 'French',
  'de': 'German',
  'bg': 'Bulgarian',
  'it': 'Italian',
  'lv': 'Latvian',
  'lt': 'Lithuanian',
  'no': 'Norwegian',
  'pl': 'Polish',
  'ro': 'Romanian',
  'ru': 'Russian',
  'es': 'Spanish',
  'sv': 'Swedish',
  'uk': 'Ukrainian',
  // 'sk': 'Slovak',
  // 'sl': 'Slovenian',
  // 'fi': 'Finnish',
  // 'sq': 'Albanian',
  // 'eu': 'Basque',
  // 'be': 'Belarusian',
  // 'bs': 'Bosnian',
  // 'ca': 'Catalan',
  // 'hr': 'Croatian',
  // 'cs': 'Czech',
  // 'da': 'Danish',
  // 'nl': 'Dutch',
  // 'el': 'Greek',
  // 'hu': 'Hungarian',
  // 'is': 'Icelandic',
  // 'ga': 'Irish',
  // 'lb': 'Luxembourgish',
  // 'mk': 'Macedonian',
  // 'pt': 'Portuguese',
  // 'sr': 'Serbian',
};
