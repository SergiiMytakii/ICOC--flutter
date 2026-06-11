import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/core/constants.dart';

class LanguageDisplayHelper {
  const LanguageDisplayHelper._();

  static String displayName(String languageCode) {
    return languageDisplayNames[languageCode] ?? languageCode;
  }

  static String translatedDisplayName(String languageCode) {
    final String translated = languageCode.tr();
    if (translated != languageCode) {
      return translated;
    }
    return displayName(languageCode);
  }

  static String shortLabel(String languageCode, {int maxLength = 3}) {
    return _limit(displayName(languageCode), maxLength);
  }

  static String translatedShortLabel(
    String languageCode, {
    int maxLength = 3,
  }) {
    return _limit(translatedDisplayName(languageCode), maxLength);
  }

  static String _limit(String value, int maxLength) {
    if (maxLength <= 0 || value.runes.length <= maxLength) {
      return value;
    }
    return String.fromCharCodes(value.runes.take(maxLength));
  }
}
