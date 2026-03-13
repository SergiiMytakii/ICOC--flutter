class BibleVerseSegment {
  final int startVerse;
  final int endVerse;

  const BibleVerseSegment({
    required this.startVerse,
    required this.endVerse,
  });

  int get minVerse => startVerse <= endVerse ? startVerse : endVerse;

  int get maxVerse => startVerse <= endVerse ? endVerse : startVerse;

  String toCompactString() => minVerse == maxVerse
      ? minVerse.toString()
      : '${minVerse.toString()}-${maxVerse.toString()}';
}

class BibleReference {
  final int bookId;
  final int chapterStart;
  final int verseStart;
  final int? chapterEnd;
  final int? verseEnd;
  final String originalLabel;
  final List<BibleVerseSegment> segments;

  const BibleReference({
    required this.bookId,
    required this.chapterStart,
    required this.verseStart,
    required this.originalLabel,
    this.chapterEnd,
    this.verseEnd,
    this.segments = const <BibleVerseSegment>[],
  });

  int get effectiveChapterEnd => chapterEnd ?? chapterStart;

  int get effectiveVerseEnd => verseEnd ?? verseStart;

  List<BibleVerseSegment> get effectiveSegments {
    if (segments.isNotEmpty) {
      return segments;
    }
    return <BibleVerseSegment>[
      BibleVerseSegment(startVerse: verseStart, endVerse: effectiveVerseEnd),
    ];
  }

  int get minVerse => effectiveSegments
      .map((BibleVerseSegment segment) => segment.minVerse)
      .reduce((int a, int b) => a < b ? a : b);

  int get maxVerse => effectiveSegments
      .map((BibleVerseSegment segment) => segment.maxVerse)
      .reduce((int a, int b) => a > b ? a : b);

  bool containsVerse(int chapter, int verse) {
    if (chapter != chapterStart || chapter != effectiveChapterEnd) {
      return false;
    }
    for (final BibleVerseSegment segment in effectiveSegments) {
      if (verse >= segment.minVerse && verse <= segment.maxVerse) {
        return true;
      }
    }
    return false;
  }

  bool get isSingleVerse =>
      chapterStart == effectiveChapterEnd && verseStart == effectiveVerseEnd;

  Uri toUri() {
    return Uri(
      scheme: 'bible',
      host: 'lookup',
      queryParameters: <String, String>{
        'bookId': bookId.toString(),
        'chapterStart': chapterStart.toString(),
        'verseStart': verseStart.toString(),
        'chapterEnd': effectiveChapterEnd.toString(),
        'verseEnd': effectiveVerseEnd.toString(),
        'segments': effectiveSegments
            .map((BibleVerseSegment segment) => segment.toCompactString())
            .join(','),
        'label': originalLabel,
      },
    );
  }

  static BibleReference? fromUri(Uri uri) {
    if (uri.scheme != 'bible' || uri.host != 'lookup') {
      return null;
    }

    final String? bookIdString = uri.queryParameters['bookId'];
    final String? chapterStartString = uri.queryParameters['chapterStart'];
    final String? verseStartString = uri.queryParameters['verseStart'];

    if (bookIdString == null ||
        chapterStartString == null ||
        verseStartString == null) {
      return null;
    }

    final int? bookId = int.tryParse(bookIdString);
    final int? chapterStart = int.tryParse(chapterStartString);
    final int? verseStart = int.tryParse(verseStartString);
    final int? chapterEnd =
        int.tryParse(uri.queryParameters['chapterEnd'] ?? '');
    final int? verseEnd = int.tryParse(uri.queryParameters['verseEnd'] ?? '');
    final String segmentsRaw = uri.queryParameters['segments'] ?? '';
    final String label = uri.queryParameters['label'] ?? '';

    if (bookId == null || chapterStart == null || verseStart == null) {
      return null;
    }

    final List<BibleVerseSegment> segments = <BibleVerseSegment>[];
    if (segmentsRaw.isNotEmpty) {
      for (final String token in segmentsRaw.split(',')) {
        final String item = token.trim();
        if (item.isEmpty) {
          continue;
        }
        final List<String> parts = item.split('-');
        final int? from = int.tryParse(parts.first.trim());
        final int? to = int.tryParse(parts.last.trim());
        if (from == null || to == null) {
          continue;
        }
        segments.add(BibleVerseSegment(startVerse: from, endVerse: to));
      }
    }

    return BibleReference(
      bookId: bookId,
      chapterStart: chapterStart,
      verseStart: verseStart,
      chapterEnd: chapterEnd,
      verseEnd: verseEnd,
      originalLabel: label,
      segments: segments,
    );
  }
}
