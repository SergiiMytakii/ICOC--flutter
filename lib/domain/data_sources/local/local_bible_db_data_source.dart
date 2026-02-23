import 'package:icoc/domain/model/bible/bible_reference.dart';
import 'package:icoc/domain/model/bible/bible_verse_result.dart';

abstract class LocalBibleDB {
  Future<void> ensureInitialized();

  Future<List<String>> getAvailableTranslations();

  Future<BibleVerseResult?> getReference(BibleReference reference,
      {required String translationCode});
}
