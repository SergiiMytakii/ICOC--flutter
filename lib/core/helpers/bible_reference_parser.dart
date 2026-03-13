import 'package:icoc/core/helpers/bible_book_aliases.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';

class BibleReferenceMatch {
  final int start;
  final int end;
  final BibleReference reference;
  final String label;

  const BibleReferenceMatch({
    required this.start,
    required this.end,
    required this.reference,
    required this.label,
  });
}

class BibleReferenceParser {
  static const String _dashChars = r'\-‐‑‒–—―−﹘﹣­';

  static final RegExp _parsePattern = RegExp(
    '^\\s*([0-9A-Za-zА-Яа-яЁёІіЇїЄєҐґ\'’.\\- ]+?)\\s+(\\d+)\\s*:\\s*([0-9,\\s$_dashChars]+)\\s*\$',
    unicode: true,
  );

  static final RegExp _findPattern = RegExp(
    '([0-9A-Za-zА-Яа-яЁёІіЇїЄєҐґ\'’.\\- ]+\\s+\\d+\\s*:\\s*\\d+(?:\\s*[$_dashChars]+\\s*\\d+)?(?:\\s*,\\s*(?![1-3]\\s*[$_dashChars]?\\s*(?:е|й|я)\\s+[A-Za-zА-Яа-яЁёІіЇїЄєҐґ])\\d+(?:\\s*[$_dashChars]+\\s*\\d+)?)*)',
    unicode: true,
  );
  static final RegExp _segmentPattern = RegExp(
    '^\\s*(\\d+)\\s*(?:[$_dashChars]+\\s*(\\d+))?\\s*\$',
    unicode: true,
  );

  static BibleReference? parse(String rawText, {required String langHint}) {
    final String candidate = _trimOuterPunctuation(rawText);
    final String normalizedCandidate = _normalizeReferenceText(candidate);
    final RegExpMatch? match = _parsePattern.firstMatch(normalizedCandidate);
    if (match == null) {
      return null;
    }

    final String bookRaw = (match.group(1) ?? '').trim();
    final int? chapterStart = int.tryParse((match.group(2) ?? '').trim());
    final String versesRaw = (match.group(3) ?? '').trim();

    if (bookRaw.isEmpty || chapterStart == null || versesRaw.isEmpty) {
      return null;
    }

    final int? bookId =
        BibleBookAliases.resolveBookId(bookRaw, langHint: langHint);
    if (bookId == null) {
      return null;
    }

    final List<BibleVerseSegment> segments = <BibleVerseSegment>[];
    for (final String token in versesRaw.split(',')) {
      final RegExpMatch? segmentMatch = _segmentPattern.firstMatch(token);
      if (segmentMatch == null) {
        return null;
      }
      final int? start = int.tryParse((segmentMatch.group(1) ?? '').trim());
      final int? end = int.tryParse(
          (segmentMatch.group(2) ?? segmentMatch.group(1) ?? '').trim());
      if (start == null || end == null) {
        return null;
      }
      segments.add(BibleVerseSegment(startVerse: start, endVerse: end));
    }
    if (segments.isEmpty) {
      return null;
    }

    return BibleReference(
      bookId: bookId,
      chapterStart: chapterStart,
      verseStart: segments.first.startVerse,
      verseEnd: segments.last.endVerse,
      segments: segments,
      originalLabel: candidate,
    );
  }

  static List<BibleReferenceMatch> findMatches(
    String rawText, {
    required String langHint,
  }) {
    final List<BibleReferenceMatch> matches = <BibleReferenceMatch>[];
    for (final RegExpMatch match in _findPattern.allMatches(rawText)) {
      final String whole = match.group(0) ?? '';
      if (whole.isEmpty) {
        continue;
      }
      final int leadingTrim = _leadingTrimCount(whole);
      final int trailingTrim = _trailingTrimCount(whole);
      final int start = match.start + leadingTrim;
      final int end = match.end - trailingTrim;
      if (end <= start) {
        continue;
      }

      final String normalizedCandidate = rawText.substring(start, end);
      final _ResolvedMatch? resolved = _resolveBestMatch(
        normalizedCandidate,
        globalStart: start,
        globalEnd: end,
        langHint: langHint,
      );
      if (resolved == null) {
        continue;
      }
      matches.add(BibleReferenceMatch(
        start: resolved.start,
        end: resolved.end,
        reference: resolved.reference,
        label: resolved.label,
      ));
    }
    return matches;
  }

  static _ResolvedMatch? _resolveBestMatch(
    String candidate, {
    required int globalStart,
    required int globalEnd,
    required String langHint,
  }) {
    final BibleReference? direct = parse(candidate, langHint: langHint);
    if (direct != null) {
      return _ResolvedMatch(
        start: globalStart,
        end: globalEnd,
        reference: direct,
        label: candidate,
      );
    }

    int attempts = 0;
    for (final RegExpMatch ws in RegExp(r'\s+').allMatches(candidate)) {
      if (attempts >= 16) {
        break;
      }
      attempts++;
      final int localStart = ws.end;
      if (localStart <= 0 || localStart >= candidate.length) {
        continue;
      }
      final String trimmed = candidate.substring(localStart);
      final BibleReference? parsed = parse(trimmed, langHint: langHint);
      if (parsed == null) {
        continue;
      }
      return _ResolvedMatch(
        start: globalStart + localStart,
        end: globalEnd,
        reference: parsed,
        label: trimmed,
      );
    }
    return null;
  }

  static String _trimOuterPunctuation(String value) {
    return value
        .replaceAll(RegExp(r'^[\s\(\[\{<"“«]+', unicode: true), '')
        .replaceAll(RegExp(r'[\s\)\]\}>",.;:!?”»]+$', unicode: true), '')
        .trim();
  }

  static int _leadingTrimCount(String value) {
    final RegExpMatch? match =
        RegExp(r'^[\s\(\[\{<"“«]+', unicode: true).firstMatch(value);
    return match?.group(0)?.length ?? 0;
  }

  static int _trailingTrimCount(String value) {
    final RegExpMatch? match =
        RegExp(r'[\s\)\]\}>",.;:!?”»]+$', unicode: true).firstMatch(value);
    return match?.group(0)?.length ?? 0;
  }

  static String _normalizeReferenceText(String value) {
    String out = value;
    out = out.replaceAll(RegExp(r'[\u200B\u200C\u200D\u2060\uFEFF]'), '');
    out = out.replaceAll('\u00A0', ' ');
    out = out.replaceAll('\u00AD', '');
    out = out.replaceAll(RegExp('[$_dashChars]+'), '-');
    out = out.replaceAll(RegExp(r'-{2,}'), '-');
    out = out.replaceAll(RegExp(r'\s+'), ' ').trim();
    return out;
  }
}

class _ResolvedMatch {
  final int start;
  final int end;
  final BibleReference reference;
  final String label;

  const _ResolvedMatch({
    required this.start,
    required this.end,
    required this.reference,
    required this.label,
  });
}
