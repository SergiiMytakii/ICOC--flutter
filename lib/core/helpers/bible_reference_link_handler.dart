import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/bible_reference_linkifier.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';
import 'package:icoc/domain/model/bible/bible_translation.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/bible_verse_dialog.dart';

class BibleReferenceLinkHandler {
  static String preprocessHtml(String sourceHtml, {required String langHint}) {
    if (!FeatureFlags.bibleReferencePopup) {
      return sourceHtml;
    }
    return BibleReferenceLinkifier.linkifyHtml(sourceHtml, langHint: langHint);
  }

  static Future<bool> handleLinkTap(
    BuildContext context, {
    required String? url,
    required String langHint,
  }) async {
    if (!FeatureFlags.bibleReferencePopup || url == null || url.isEmpty) {
      return false;
    }
    final String normalizedUrl = url
        .replaceAll('&amp;', '&')
        .replaceAll('&#38;', '&')
        .replaceAll('&AMP;', '&');
    final Uri? uri = Uri.tryParse(normalizedUrl);
    if (uri == null || uri.scheme != 'bible') {
      return false;
    }

    final BibleReference? reference = BibleReference.fromUri(uri);
    if (reference == null) {
      _showNotFound(context);
      return true;
    }

    final LocalBibleDB bibleDb = getIt<LocalBibleDB>();
    final LocalCache cache = getIt<LocalCache>();

    await bibleDb.ensureInitialized();
    final String localizedStorageKey = _storageKeyForLang(langHint);
    String selectedTranslation = cache.getString(localizedStorageKey) ??
        _legacyFallbackByLang(
          cache.getString(StorageKeys.bibleVerseTranslation),
          langHint,
        ) ??
        _defaultTranslation(langHint);
    final List<BibleTranslation> availableTranslations =
        await bibleDb.getAvailableTranslations();
    if (availableTranslations.isNotEmpty &&
        !availableTranslations.any(
          (BibleTranslation translation) =>
              translation.code == selectedTranslation,
        )) {
      selectedTranslation =
          _pickBestAvailableDefault(availableTranslations, langHint);
    }

    final List<String> probeCandidates = <String>[
      selectedTranslation,
      ..._preferredCodes(langHint),
      ...availableTranslations
          .map((BibleTranslation translation) => translation.code),
    ];

    final Set<String> triedCodes = <String>{};
    bool found = false;
    for (final String code in probeCandidates) {
      if (code.isEmpty || triedCodes.contains(code)) {
        continue;
      }
      triedCodes.add(code);
      final probe = await bibleDb.getReference(
        reference,
        translationCode: code,
      );
      if (probe != null) {
        selectedTranslation = code;
        found = true;
        break;
      }
    }

    if (!found) {
      _showNotFound(context);
      return true;
    }

    if (!context.mounted) {
      return true;
    }

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return BibleVerseDialog(
          bibleDb: bibleDb,
          reference: reference,
          initialTranslationCode: selectedTranslation,
          onTranslationSelected: (String value) {
            cache.saveString(localizedStorageKey, value);
            cache.saveString(StorageKeys.bibleVerseTranslation, value);
          },
        );
      },
    );
    return true;
  }

  static void _showNotFound(BuildContext context) {
    final notificationService = getIt<PushNotificationService>();
    notificationService.showLocalNotification(
      title: 'Bible Verse'.tr(),
      body: 'Verse not found'.tr(),
    );
  }

  static String _defaultTranslation(String langHint) {
    final String normalized = langHint.toLowerCase();
    if (normalized == 'uk') {
      return 'uk_tub';
    }
    if (normalized == 'ru') {
      return 'ru_wbtc';
    }
    if (normalized == 'en') {
      return 'en_easy';
    }
    return 'en_easy';
  }

  static String _pickBestAvailableDefault(
    List<BibleTranslation> availableTranslations,
    String langHint,
  ) {
    final Set<String> availableCodes = availableTranslations
        .map((BibleTranslation translation) => translation.code)
        .toSet();

    for (final String preferredCode in _preferredCodes(langHint)) {
      if (availableCodes.contains(preferredCode)) {
        return preferredCode;
      }
    }

    final String langPrefix = '${langHint.toLowerCase()}_';
    for (final BibleTranslation translation in availableTranslations) {
      if (translation.code.toLowerCase().startsWith(langPrefix)) {
        return translation.code;
      }
    }

    return availableTranslations.first.code;
  }

  static List<String> _preferredCodes(String langHint) {
    final String normalized = langHint.toLowerCase();
    if (normalized == 'uk') {
      return <String>['uk_tub', 'uk_ohienko', 'uk_kulish', 'en_easy'];
    }
    if (normalized == 'ru') {
      return <String>['ru_wbtc', 'ru_synodal', 'ru_rsp', 'en_easy'];
    }
    if (normalized == 'en') {
      return <String>['en_easy', 'en_asv', 'en_kjv'];
    }
    return <String>['en_easy', 'en_asv', 'en_kjv'];
  }

  static String? _legacyFallbackByLang(String? globalCode, String langHint) {
    if (globalCode == null || globalCode.isEmpty) {
      return null;
    }
    final String normalizedLang = langHint.toLowerCase();
    if (normalizedLang == 'uk' && globalCode.startsWith('uk_')) {
      return globalCode;
    }
    if (normalizedLang == 'ru' && globalCode.startsWith('ru_')) {
      return globalCode;
    }
    if (normalizedLang == 'en' && globalCode.startsWith('en_')) {
      return globalCode;
    }
    return null;
  }

  static String _storageKeyForLang(String langHint) {
    return '${StorageKeys.bibleVerseTranslation}_${langHint.toLowerCase()}';
  }
}
