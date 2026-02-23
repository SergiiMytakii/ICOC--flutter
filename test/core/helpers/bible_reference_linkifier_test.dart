import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/bible_reference_linkifier.dart';

void main() {
  group('BibleReferenceLinkifier.linkifyHtml', () {
    test('wraps plain scripture references into bible links', () {
      const String input =
          '<p><span style="color:#3366ff;">Дії 2:41 – 47</span></p>';

      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');

      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=44'));
      expect(output, contains('Дії 2:41 – 47'));
    });

    test('keeps existing external anchors intact', () {
      const String input =
          '<p><a href="https://example.com">Дії 2:41-47</a></p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="https://example.com"'));
      expect(output.contains('bible://lookup?'), isFalse);
    });

    test('converts explicit data-ref anchor to bible href', () {
      const String input = '<p><a data-ref="Колосян 1:18">Колосян 1:18</a></p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=51'));
    });

    test('linkifies ordinal epistle form with "до"', () {
      const String input = '<p>1-е до Коринтян 12:12-13</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=46'));
      expect(output, contains('verseStart=12'));
      expect(output, contains('verseEnd=13'));
    });

    test('linkifies ordinal with й ending', () {
      const String input = '<p>1-й Тимофію 2:3-5</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=54'));
    });

    test('linkifies references with "Від" prefix', () {
      const String input = '<p>Від Марка 1:14-18</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=41'));
    });

    test('linkifies comma-separated verse segments', () {
      const String input = '<p>Дії 2:22-24, 36-42</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=44'));
      expect(output, contains('segments=22-24%2C36-42'));
    });

    test('splits adjacent different references', () {
      const String input = '<p>До Колоссян 1:15-18, 2-е Тимофію 3:16,17</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      final int linkCount =
          RegExp(r'href="bible://lookup\?').allMatches(output).length;
      expect(linkCount, 2);
      expect(output, contains('bookId=51'));
      expect(output, contains('bookId=55'));
    });

    test('converts existing non-http anchor text to bible href', () {
      const String input = '<p><a href="#">ІОАНН 1:1-18</a></p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=43'));
    });

    test('rebuilds existing bible href from visible reference text', () {
      const String input =
          '<p><a href="bible://lookup?bookId=999&amp;chapterStart=40&amp;verseStart=12&amp;chapterEnd=40&amp;verseEnd=14">Исаия 40:12-14</a></p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'ru');
      expect(output, contains('href="bible://lookup?'));
      expect(output, contains('bookId=23'));
      expect(output.contains('bookId=999'), isFalse);
    });

    test('linkifies double-dash ranges', () {
      const String input = '<p>ЛУКИ 11:1--4</p><p>ФИЛИППИЙЦАМ 4:6--7</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'uk');
      final int linkCount =
          RegExp(r'href="bible://lookup\?').allMatches(output).length;
      expect(linkCount, 2);
      expect(output, contains('bookId=42'));
      expect(output, contains('bookId=50'));
    });

    test('linkifies reference with leading word in same text node', () {
      const String input = '<p>ЦЕЛЬ ИОАННА 1:1--2, 14, 18</p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'ru');
      final int linkCount =
          RegExp(r'href="bible://lookup\?').allMatches(output).length;
      expect(linkCount, 1);
      expect(output, contains('ЦЕЛЬ '));
      expect(output, contains('bookId=43'));
      expect(output, contains('segments=1-2%2C14%2C18'));
    });

    test('linkifies fragmented inline reference split by strong tags', () {
      const String input =
          '<p><span><strong>И</strong><strong>ЕРЕМИЯ</strong> <strong>29</strong><strong>:11</strong><strong>-&shy;‐</strong><strong>13</strong></span></p>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'ru');
      final int linkCount =
          RegExp(r'href="bible://lookup\?').allMatches(output).length;
      expect(linkCount, 1);
      expect(output, contains('bookId=24'));
      expect(output, contains('verseStart=11'));
      expect(output, contains('verseEnd=13'));
    });

    test('linkifies heading text with leading words and hidden dash chars', () {
      const String input =
          '<h5>Пример для подражания ДЕЯНИЯ 8:26-&shy;‐40</h5>';
      final String output =
          BibleReferenceLinkifier.linkifyHtml(input, langHint: 'ru');
      final int linkCount =
          RegExp(r'href="bible://lookup\?').allMatches(output).length;
      expect(linkCount, 1);
      expect(output, contains('bookId=44'));
      expect(output, contains('chapterStart=8'));
      expect(output, contains('verseStart=26'));
      expect(output, contains('verseEnd=40'));
    });
  });
}
