import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';

void main() {
  test('reference URI roundtrip keeps verse segments', () {
    const BibleReference reference = BibleReference(
      bookId: 44,
      chapterStart: 2,
      verseStart: 22,
      verseEnd: 42,
      originalLabel: 'Дії 2:22-24, 36-42',
      segments: <BibleVerseSegment>[
        BibleVerseSegment(startVerse: 22, endVerse: 24),
        BibleVerseSegment(startVerse: 36, endVerse: 42),
      ],
    );

    final Uri uri = reference.toUri();
    final BibleReference? decoded = BibleReference.fromUri(uri);
    expect(decoded, isNotNull);
    expect(decoded!.segments.length, 2);
    expect(decoded.segments[0].minVerse, 22);
    expect(decoded.segments[0].maxVerse, 24);
    expect(decoded.segments[1].minVerse, 36);
    expect(decoded.segments[1].maxVerse, 42);
    expect(decoded.containsVerse(2, 30), isFalse);
    expect(decoded.containsVerse(2, 37), isTrue);
  });
}
