import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/bible_reference_parser.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';

void main() {
  group('BibleReferenceParser.parse', () {
    test('parses range in Acts', () {
      final BibleReference? ref =
          BibleReferenceParser.parse('Дії 2:41 – 47', langHint: 'uk');
      expect(ref, isNotNull);
      expect(ref!.bookId, 44);
      expect(ref.chapterStart, 2);
      expect(ref.verseStart, 41);
      expect(ref.effectiveVerseEnd, 47);
    });

    test('parses Ephesians range', () {
      final BibleReference? ref =
          BibleReferenceParser.parse('Ефесян 5:25-27', langHint: 'uk');
      expect(ref, isNotNull);
      expect(ref!.bookId, 49);
      expect(ref.chapterStart, 5);
      expect(ref.verseStart, 25);
      expect(ref.effectiveVerseEnd, 27);
    });

    test('parses 1 Corinthians verse', () {
      final BibleReference? ref =
          BibleReferenceParser.parse('1 Коринтян 12:13', langHint: 'uk');
      expect(ref, isNotNull);
      expect(ref!.bookId, 46);
      expect(ref.chapterStart, 12);
      expect(ref.verseStart, 13);
      expect(ref.effectiveVerseEnd, 13);
    });

    test('parses ordinal epistle form with "до"', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        '1-е до Коринтян 12:12-13',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 46);
      expect(ref.chapterStart, 12);
      expect(ref.verseStart, 12);
      expect(ref.effectiveVerseEnd, 13);
    });

    test('parses ordinal epistle form for Timothy', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        '1-е до Тимофія 2:3-5',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 54);
      expect(ref.chapterStart, 2);
      expect(ref.verseStart, 3);
      expect(ref.effectiveVerseEnd, 5);
    });

    test('parses ordinal with й ending', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        '1-й Тимофію 2:3-5',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 54);
      expect(ref.chapterStart, 2);
      expect(ref.segments.length, 1);
      expect(ref.segments.first.minVerse, 3);
      expect(ref.segments.first.maxVerse, 5);
    });

    test('parses ordinal with е ending and comma verses', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        '2-е Тимофію 3:16,17',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 55);
      expect(ref.chapterStart, 3);
      expect(ref.segments.length, 2);
      expect(ref.segments[0].minVerse, 16);
      expect(ref.segments[1].minVerse, 17);
    });

    test('parses "Від Марка" prefix', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'Від Марка 1:14-18',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 41);
      expect(ref.chapterStart, 1);
      expect(ref.segments.first.minVerse, 14);
      expect(ref.segments.first.maxVerse, 18);
    });

    test('parses comma-separated verses in one chapter', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'Дії апостолів 17:30,31',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 44);
      expect(ref.chapterStart, 17);
      expect(ref.segments.length, 2);
      expect(ref.segments[0].minVerse, 30);
      expect(ref.segments[1].minVerse, 31);
    });

    test('parses comma-separated ranges in one chapter', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'Дії 2:22-24, 36-42',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 44);
      expect(ref.chapterStart, 2);
      expect(ref.segments.length, 2);
      expect(ref.segments[0].minVerse, 22);
      expect(ref.segments[0].maxVerse, 24);
      expect(ref.segments[1].minVerse, 36);
      expect(ref.segments[1].maxVerse, 42);
    });

    test('parses uppercase russian with hidden unicode dash chars', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'РИМЛЯНАМ 1:19-\u00AD‐20',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 45);
      expect(ref.chapterStart, 1);
      expect(ref.segments.first.minVerse, 19);
      expect(ref.segments.first.maxVerse, 20);
    });

    test('parses double dash range', () {
      final BibleReference? ref =
          BibleReferenceParser.parse('ЛУКИ 11:1--4', langHint: 'uk');
      expect(ref, isNotNull);
      expect(ref!.bookId, 42);
      expect(ref.chapterStart, 11);
      expect(ref.segments.first.minVerse, 1);
      expect(ref.segments.first.maxVerse, 4);
    });

    test('parses "До Колоссян" prefix', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'До Колоссян 1:15-18',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 51);
      expect(ref.chapterStart, 1);
      expect(ref.segments.length, 1);
      expect(ref.segments.first.minVerse, 15);
      expect(ref.segments.first.maxVerse, 18);
    });

    test('parses uppercase ДІЯННЯ АПОСТОЛІВ form', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'ДІЯННЯ АПОСТОЛІВ 8:26-40',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 44);
      expect(ref.chapterStart, 8);
      expect(ref.segments.first.minVerse, 26);
      expect(ref.segments.first.maxVerse, 40);
    });

    test('parses uppercase IOANN form', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        'ІОАНН 1:1-18',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 43);
      expect(ref.chapterStart, 1);
      expect(ref.segments.first.minVerse, 1);
      expect(ref.segments.first.maxVerse, 18);
    });

    test('parses 2 Хроніки', () {
      final BibleReference? ref = BibleReferenceParser.parse(
        '2 Хроніки 15:1-4',
        langHint: 'uk',
      );
      expect(ref, isNotNull);
      expect(ref!.bookId, 14);
      expect(ref.chapterStart, 15);
      expect(ref.segments.first.minVerse, 1);
      expect(ref.segments.first.maxVerse, 4);
    });

    test('returns null for invalid text', () {
      final BibleReference? ref =
          BibleReferenceParser.parse('Це не є посилання', langHint: 'uk');
      expect(ref, isNull);
    });
  });

  test('roundtrips via bible URI', () {
    final BibleReference? ref =
        BibleReferenceParser.parse('Колосян 1:18', langHint: 'uk');
    expect(ref, isNotNull);
    final Uri uri = ref!.toUri();
    final BibleReference? fromUri = BibleReference.fromUri(uri);
    expect(fromUri, isNotNull);
    expect(fromUri!.bookId, 51);
    expect(fromUri.chapterStart, 1);
    expect(fromUri.verseStart, 18);
  });
}
