import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/language_display_helper.dart';

void main() {
  group('LanguageDisplayHelper', () {
    test('uses configured display names for every song language', () {
      final List<String> songLanguages = Languages.values
          .where((language) => language != Languages.defaultLang)
          .map((language) => language.name)
          .toList();

      for (final String languageCode in songLanguages) {
        expect(
          LanguageDisplayHelper.displayName(languageCode),
          isNot(languageCode),
          reason: '$languageCode needs a display name',
        );
      }
    });

    test('builds a safe short label for two-letter language codes', () {
      expect(LanguageDisplayHelper.shortLabel('hu'), 'Hun');
      expect(LanguageDisplayHelper.shortLabel('xx'), 'xx');
    });
  });
}
