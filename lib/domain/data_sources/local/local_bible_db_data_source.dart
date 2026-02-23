import 'package:icoc/domain/model/bible/bible_reference.dart';
import 'package:icoc/domain/model/bible/bible_translation.dart';
import 'package:icoc/domain/model/bible/bible_verse_result.dart';

abstract class LocalBibleDB {
  Future<void> ensureInitialized();

  Future<List<BibleTranslation>> getAvailableTranslations();

  Future<BibleVerseResult?> getReference(BibleReference reference,
      {required String translationCode});
}
