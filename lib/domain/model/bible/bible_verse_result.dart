import 'package:icoc/domain/model/bible/bible_reference.dart';

class BibleVerseLine {
  final int chapter;
  final int verse;
  final String text;

  const BibleVerseLine({
    required this.chapter,
    required this.verse,
    required this.text,
  });
}

class BibleVerseResult {
  final BibleReference reference;
  final String translationCode;
  final String translationName;
  final List<BibleVerseLine> verses;

  const BibleVerseResult({
    required this.reference,
    required this.translationCode,
    required this.translationName,
    required this.verses,
  });
}
