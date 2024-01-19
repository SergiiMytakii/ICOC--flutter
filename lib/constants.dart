import 'dart:ui';

const List<Color> dividerColors = [
  Color(0xFFFF595E),
  Color(0xffffca3a),
  Color(0xff8ac926),
  Color(0xff1982c4),
  Color(0xff6a4c93)
];

const Map<String, Color> screensColors = {
  'general': Color(0xff6a4c93),
  'songBook': Color(0xffff595e),
  'news': Color(0xffffca3a),
  'bibleStudy': Color(0xff8ac926),
  'Q&A': Color(0xff1982c4)
};
// final Map<String, Locale> languagesLocales = {
//   'ru': Locale('ru', 'RU'),
//   'en': Locale('en', 'US'),
//   'uk': Locale('uk', 'UK')
// };

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

// const String INSTAGRAM_CLIENT_ID = '663715198237865';
// const String INSTAGRAM_APP_SECRET = '6d31745de196c6c54a5d7f9ef9852519';
// const String INSTAGRAM_REDIRECT_URI = 'https://kievchurch.org/';
const String Q_AND_A_ANDY_FLEMING_PLAYLIST_ID =
    'PLGORKDMRdh2y8lVoDMjF59vv4z4-O-Lhm';
const String BIBLE_SCHOOL_PLAYLIST_ID = 'PLGORKDMRdh2wkVRHzkClQrjFJA8sClTvY';
const String YOUTUBE_TERMS_OF_SERVISES = 'https://www.youtube.com/t/terms';
const String YOUTUBE_PRIVACY_POLICIES = 'https://policies.google.com/privacy';

class SharedPreferencesKeys {
  static const String orderLanguages = 'orderLanguages';
  static const String orderByTitle = 'orderByTitle';
  static const String allSongsTitleKeys = 'allSongsTitleKeys';
  static const String allSongsTextKeys = 'allSongsTextKeys';
  static const String locale = 'locale';
  static const String fontSize = 'fontSize';
  static const String bibleStudyLanguages = 'bibleStudyLanguages';
  static const String bibleStudyAllLanguages = 'bibleStudyAllLanguages';
  // Add more keys as needed
}

Map<String, String> languagesCodes = {
  // 'sq': 'Albanian',
  // 'eu': 'Basque',
  // 'be': 'Belarusian',
  // 'bs': 'Bosnian',
  'bg': 'Bulgarian',
  // 'ca': 'Catalan',
  // 'hr': 'Croatian',
  // 'cs': 'Czech',
  // 'da': 'Danish',
  // 'nl': 'Dutch',
  'en': 'English',
  'et': 'Estonian',
  // 'fi': 'Finnish',
  'fr': 'French',
  'de': 'German',
  // 'el': 'Greek',
  // 'hu': 'Hungarian',
  // 'is': 'Icelandic',
  // 'ga': 'Irish',
  'it': 'Italian',
  'lv': 'Latvian',
  'lt': 'Lithuanian',
  // 'lb': 'Luxembourgish',
  // 'mk': 'Macedonian',
  'no': 'Norwegian',
  'pl': 'Polish',
  // 'pt': 'Portuguese',
  'ro': 'Romanian',
  'ru': 'Russian',
  // 'sr': 'Serbian',
  'sk': 'Slovak',
  'sl': 'Slovenian',
  'es': 'Spanish',
  'sv': 'Swedish',
  'uk': 'Ukrainian',
};
