import 'dart:convert';
import 'dart:io';

import 'package:sqlite3/sqlite3.dart';
import 'package:xml/xml.dart';

class _BuildArgs {
  final int version;
  final List<_TranslationSource> sources;
  final String outPath;
  final String aliasesPath;
  final String? metaPath;

  const _BuildArgs({
    required this.version,
    required this.sources,
    required this.outPath,
    required this.aliasesPath,
    required this.metaPath,
  });
}

class _TranslationSource {
  final String code;
  final String name;
  final String source;

  const _TranslationSource({
    required this.code,
    required this.name,
    required this.source,
  });
}

class _TranslationRow {
  final String code;
  final String name;
  final String sourceFile;

  const _TranslationRow({
    required this.code,
    required this.name,
    required this.sourceFile,
  });
}

class _VerseRow {
  final String translationCode;
  final int bookId;
  final int chapter;
  final int verse;
  final String text;

  const _VerseRow({
    required this.translationCode,
    required this.bookId,
    required this.chapter,
    required this.verse,
    required this.text,
  });
}

Future<void> main(List<String> args) async {
  final _BuildArgs config = _parseArgs(args);
  final Map<String, Map<int, List<String>>> aliasesByLang =
      await _loadAliases(config.aliasesPath);

  final List<_TranslationRow> translations = <_TranslationRow>[];
  final List<_VerseRow> verses = <_VerseRow>[];

  for (final _TranslationSource source in config.sources) {
    final (_TranslationRow translation, List<_VerseRow> parsedVerses) =
        await _parseTranslation(
      source.source,
      translationCode: source.code,
      translationNameOverride: source.name,
    );
    translations.add(translation);
    verses.addAll(parsedVerses);
  }

  verses.sort((final _VerseRow a, final _VerseRow b) {
    final int codeComparison = a.translationCode.compareTo(b.translationCode);
    if (codeComparison != 0) {
      return codeComparison;
    }
    final int bookComparison = a.bookId.compareTo(b.bookId);
    if (bookComparison != 0) {
      return bookComparison;
    }
    final int chapterComparison = a.chapter.compareTo(b.chapter);
    if (chapterComparison != 0) {
      return chapterComparison;
    }
    return a.verse.compareTo(b.verse);
  });

  final File outFile = File(config.outPath);
  await outFile.parent.create(recursive: true);
  if (outFile.existsSync()) {
    outFile.deleteSync();
  }

  final Database db = sqlite3.open(config.outPath);
  try {
    _createSchema(db);
    _insertTranslations(db, translations);
    _insertVerses(db, verses);
    _insertAliases(db, aliasesByLang);
    _createIndexes(db);
  } finally {
    db.dispose();
  }

  if (config.metaPath != null && config.metaPath!.isNotEmpty) {
    final File metaFile = File(config.metaPath!);
    await metaFile.parent.create(recursive: true);
    final Map<String, Object> metadata = <String, Object>{
      'version': config.version,
      'sources': config.sources
          .map((final _TranslationSource source) => <String, String>{
                'code': source.code,
                'name': source.name,
                'source': source.source,
              })
          .toList(),
      'translations': translations.length,
      'verses': verses.length,
    };
    await metaFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(metadata),
    );
  }

  stdout.writeln('Bible DB created at ${config.outPath}');
  stdout.writeln('Translations: ${translations.length}');
  stdout.writeln('Verses: ${verses.length}');
}

_BuildArgs _parseArgs(List<String> args) {
  final Map<String, String> map = <String, String>{};
  for (final String arg in args) {
    if (!arg.startsWith('--') || !arg.contains('=')) {
      continue;
    }
    final int idx = arg.indexOf('=');
    final String key = arg.substring(2, idx);
    final String value = arg.substring(idx + 1);
    map[key] = value;
  }

  final List<_TranslationSource> sources = <_TranslationSource>[
    const _TranslationSource(
      code: 'uk_tub',
      name: 'Ukrainian Contemporary',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/UkrainianTUBBible.xml',
    ),
    const _TranslationSource(
      code: 'uk_ohienko',
      name: 'Ukrainian Ohienko',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/UkrainianBible.xml',
    ),
    const _TranslationSource(
      code: 'uk_kulish',
      name: 'Ukrainian Kulish',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/Ukrainian1905Bible.xml',
    ),
    const _TranslationSource(
      code: 'ru_synodal',
      name: 'Russian Synodal',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/RussianSynodalBible.xml',
    ),
    const _TranslationSource(
      code: 'ru_wbtc',
      name: 'Russian Contemporary',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/RussianWBTCBible.xml',
    ),
    const _TranslationSource(
      code: 'ru_rsp',
      name: 'Russian RSP',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/RussianRSPBible.xml',
    ),
    const _TranslationSource(
      code: 'en_kjv',
      name: 'English KJV',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/EnglishKJBible.xml',
    ),
    const _TranslationSource(
      code: 'en_asv',
      name: 'English ASV',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/EnglishASVBible.xml',
    ),
    const _TranslationSource(
      code: 'en_easy',
      name: 'English Contemporary',
      source:
          'https://raw.githubusercontent.com/Beblia/Holy-Bible-XML-Format/master/EnglishEASYBible.xml',
    ),
  ];

  if (map['uk'] != null && map['uk']!.trim().isNotEmpty) {
    sources[0] = _TranslationSource(
      code: sources[0].code,
      name: sources[0].name,
      source: map['uk']!,
    );
  }

  if (map['ru'] != null && map['ru']!.trim().isNotEmpty) {
    sources[3] = _TranslationSource(
      code: sources[3].code,
      name: sources[3].name,
      source: map['ru']!,
    );
  }

  final int version = int.tryParse(map['version'] ?? '') ?? 3;

  return _BuildArgs(
    version: version,
    sources: sources,
    outPath: map['out'] ?? 'assets/db/Bible.db',
    aliasesPath: map['aliases'] ?? 'tool/bible/book_aliases_uk_ru.json',
    metaPath: map['meta'] ?? 'assets/db/Bible.meta.json',
  );
}

Future<Map<String, Map<int, List<String>>>> _loadAliases(String path) async {
  final String raw = await File(path).readAsString();
  final Object? decoded = jsonDecode(raw);
  if (decoded is! Map) {
    throw StateError('Invalid aliases format');
  }

  final Map<String, Map<int, List<String>>> out =
      <String, Map<int, List<String>>>{};

  decoded.forEach((final Object? langRaw, final Object? valuesRaw) {
    final String lang = langRaw?.toString() ?? '';
    if (lang.isEmpty || valuesRaw is! Map) {
      return;
    }

    final Map<int, List<String>> byBook = <int, List<String>>{};
    valuesRaw.forEach((final Object? bookIdRaw, final Object? aliasesRaw) {
      final int? bookId = int.tryParse(bookIdRaw?.toString() ?? '');
      if (bookId == null || aliasesRaw is! List) {
        return;
      }
      final List<String> aliases = aliasesRaw
          .map((final Object? item) => item?.toString() ?? '')
          .where((final String alias) => alias.trim().isNotEmpty)
          .toList();
      byBook[bookId] = aliases;
    });
    out[lang] = byBook;
  });

  return out;
}

Future<(_TranslationRow, List<_VerseRow>)> _parseTranslation(
  String source, {
  required String translationCode,
  required String translationNameOverride,
}) async {
  final String xmlText = await _readSource(source);
  final XmlDocument document = XmlDocument.parse(xmlText);
  final XmlElement root = document.rootElement;

  final String translationName = translationNameOverride.trim().isNotEmpty
      ? translationNameOverride
      : (root.getAttribute('translation') ?? translationCode.toUpperCase());
  final _TranslationRow translation = _TranslationRow(
    code: translationCode,
    name: translationName.trim(),
    sourceFile: source,
  );

  final List<_VerseRow> verses = <_VerseRow>[];
  final Iterable<XmlElement> books = root.findAllElements('book');
  for (final XmlElement book in books) {
    final int? bookId = int.tryParse(book.getAttribute('number') ?? '');
    if (bookId == null) {
      continue;
    }
    final Iterable<XmlElement> chapters = book.findElements('chapter');
    for (final XmlElement chapter in chapters) {
      final int? chapterId = int.tryParse(chapter.getAttribute('number') ?? '');
      if (chapterId == null) {
        continue;
      }
      final Iterable<XmlElement> verseElements = chapter.findElements('verse');
      for (final XmlElement verse in verseElements) {
        final int? verseId = int.tryParse(verse.getAttribute('number') ?? '');
        if (verseId == null) {
          continue;
        }
        final String text = _normalizeText(verse.innerText);
        if (text.isEmpty) {
          continue;
        }
        verses.add(_VerseRow(
          translationCode: translationCode,
          bookId: bookId,
          chapter: chapterId,
          verse: verseId,
          text: text,
        ));
      }
    }
  }

  return (translation, verses);
}

Future<String> _readSource(String source) async {
  final Uri? uri = Uri.tryParse(source);
  if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) {
    Object? lastError;
    for (int attempt = 0; attempt < 4; attempt++) {
      final HttpClient client = HttpClient();
      try {
        final HttpClientRequest request = await client.getUrl(uri);
        final HttpClientResponse response = await request.close();
        if (response.statusCode != HttpStatus.ok) {
          throw HttpException('Failed to fetch source: $source');
        }
        final String xmlText = await response.transform(utf8.decoder).join();
        if (_looksLikeBibleXml(xmlText)) {
          return xmlText;
        }
        throw HttpException('Invalid XML payload from source: $source');
      } catch (error) {
        lastError = error;
        if (attempt < 3) {
          await Future<void>.delayed(
              Duration(milliseconds: 400 * (attempt + 1)));
        }
      } finally {
        client.close(force: true);
      }
    }
    final ProcessResult curlResult = await Process.run(
      'curl',
      <String>[
        '--location',
        '--silent',
        '--show-error',
        '--retry',
        '8',
        '--retry-all-errors',
        source,
      ],
    );
    if (curlResult.exitCode == 0) {
      final String output = (curlResult.stdout ?? '').toString();
      if (_looksLikeBibleXml(output)) {
        return output;
      }
    }
    throw lastError ?? HttpException('Failed to fetch source: $source');
  }
  return File(source).readAsString();
}

bool _looksLikeBibleXml(String value) {
  final String trimmed = value.trimLeft();
  return trimmed.startsWith('<?xml') || trimmed.startsWith('<bible');
}

String _normalizeText(String input) {
  return input.replaceAll(RegExp(r'\s+'), ' ').trim();
}

void _createSchema(Database db) {
  db.execute('''
CREATE TABLE translations(
  code TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  source_file TEXT NOT NULL
);
''');
  db.execute('''
CREATE TABLE verses(
  translation_code TEXT NOT NULL,
  book_id INTEGER NOT NULL,
  chapter INTEGER NOT NULL,
  verse INTEGER NOT NULL,
  text TEXT NOT NULL,
  PRIMARY KEY (translation_code, book_id, chapter, verse)
);
''');
  db.execute('''
CREATE TABLE book_aliases(
  lang_code TEXT NOT NULL,
  alias_norm TEXT NOT NULL,
  book_id INTEGER NOT NULL,
  PRIMARY KEY (lang_code, alias_norm)
);
''');
}

void _insertTranslations(Database db, List<_TranslationRow> translations) {
  final PreparedStatement statement = db.prepare(
    'INSERT INTO translations(code, name, source_file) VALUES (?, ?, ?)',
  );
  try {
    for (final _TranslationRow row in translations) {
      statement.execute(<Object>[row.code, row.name, row.sourceFile]);
    }
  } finally {
    statement.dispose();
  }
}

void _insertVerses(Database db, List<_VerseRow> verses) {
  final PreparedStatement statement = db.prepare(
    'INSERT INTO verses(translation_code, book_id, chapter, verse, text) VALUES (?, ?, ?, ?, ?)',
  );
  try {
    for (final _VerseRow row in verses) {
      statement.execute(<Object>[
        row.translationCode,
        row.bookId,
        row.chapter,
        row.verse,
        row.text,
      ]);
    }
  } finally {
    statement.dispose();
  }
}

void _insertAliases(Database db, Map<String, Map<int, List<String>>> aliases) {
  final PreparedStatement statement = db.prepare(
    'INSERT INTO book_aliases(lang_code, alias_norm, book_id) VALUES (?, ?, ?)',
  );
  try {
    aliases.forEach((final String lang, final Map<int, List<String>> byBook) {
      byBook.forEach((final int bookId, final List<String> values) {
        for (final String raw in values) {
          final String alias = _normalizeAlias(raw);
          if (alias.isEmpty) {
            continue;
          }
          statement.execute(<Object>[lang.toLowerCase(), alias, bookId]);
        }
      });
    });
  } finally {
    statement.dispose();
  }
}

String _normalizeAlias(String input) {
  String out = input.toLowerCase();
  out = out.replaceAll(RegExp(r'[’`ʼ]'), '\'');
  out = out.replaceAll('ё', 'е');
  out = out.replaceAll(RegExp(r"[^a-zа-яіїєґ0-9' ]", unicode: true), ' ');
  out = out.replaceAll(RegExp(r'\s+'), ' ').trim();
  return out;
}

void _createIndexes(Database db) {
  db.execute(
    'CREATE INDEX idx_verses_lookup ON verses(translation_code, book_id, chapter, verse)',
  );
  db.execute(
    'CREATE INDEX idx_alias_lookup ON book_aliases(lang_code, alias_norm)',
  );
}
