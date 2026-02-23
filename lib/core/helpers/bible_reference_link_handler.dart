import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/bible_reference_linkifier.dart';
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';
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
    final Uri? uri = Uri.tryParse(url);
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
    String selectedTranslation =
        cache.getString(StorageKeys.bibleVerseTranslation) ??
            _defaultTranslation(langHint);
    final List<String> availableTranslations =
        await bibleDb.getAvailableTranslations();
    if (availableTranslations.isNotEmpty &&
        !availableTranslations.contains(selectedTranslation)) {
      selectedTranslation = availableTranslations.first;
    }

    final probe = await bibleDb.getReference(
      reference,
      translationCode: selectedTranslation,
    );
    if (probe == null) {
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
            cache.saveString(StorageKeys.bibleVerseTranslation, value);
          },
        );
      },
    );
    return true;
  }

  static void _showNotFound(BuildContext context) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.showSnackBar(
      const SnackBar(content: Text('Verse not found')),
    );
  }

  static String _defaultTranslation(String langHint) {
    final String normalized = langHint.toLowerCase();
    if (normalized == 'ru') {
      return 'ru';
    }
    return 'uk';
  }
}
