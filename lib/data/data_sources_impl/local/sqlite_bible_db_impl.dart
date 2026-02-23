import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';
import 'package:icoc/domain/model/bible/bible_verse_result.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

@dev
@prod
@Injectable(as: LocalBibleDB)
class SqliteBibleDbImpl implements LocalBibleDB {
  static Future<Database>? _dbFuture;
  static Database? _db;

  static const String _dbName = 'Bible.db';
  static const String _assetPath = 'assets/db/Bible.db';
  static const String _metaAssetPath = 'assets/db/Bible.meta.json';
  static const String _prefMetaVersionKey = 'bible_db_meta_version';

  static const String _tableTranslations = 'translations';
  static const String _tableVerses = 'verses';

  static const String _columnTranslationCode = 'translation_code';
  static const String _columnCode = 'code';
  static const String _columnName = 'name';
  static const String _columnBookId = 'book_id';
  static const String _columnChapter = 'chapter';
  static const String _columnVerse = 'verse';
  static const String _columnText = 'text';

  Future<Database> _database() async {
    if (_db != null) {
      return _db!;
    }
    _dbFuture ??= _openDb();
    _db = await _dbFuture!;
    return _db!;
  }

  Future<Database> _openDb() async {
    final String path = join(await getDatabasesPath(), _dbName);
    final io.File dbFile = io.File(path);
    final bool exists = await dbFile.exists();

    int assetVersion = -1;
    try {
      final String metaString = await rootBundle.loadString(_metaAssetPath);
      final Map<String, dynamic> metaJson = jsonDecode(metaString);
      assetVersion = metaJson['version'] as int? ?? -1;
    } catch (e, st) {
      await logError('Failed to load bible meta json: $e', st);
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int currentVersion = prefs.getInt(_prefMetaVersionKey) ?? -1;

    if (!exists || (assetVersion > 0 && assetVersion > currentVersion)) {
      if (exists) {
        await dbFile.delete();
      }
      final ByteData data = await rootBundle.load(_assetPath);
      final Uint8List bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await dbFile.writeAsBytes(bytes, flush: true);

      if (assetVersion > 0) {
        await prefs.setInt(_prefMetaVersionKey, assetVersion);
      }
    }
    return openDatabase(path);
  }

  @override
  Future<void> ensureInitialized() async {
    await _database();
  }

  @override
  Future<List<String>> getAvailableTranslations() async {
    final Database database = await _database();
    try {
      final List<Map<String, Object?>> rows = await database.query(
        _tableTranslations,
        columns: <String>[_columnCode],
        orderBy: _columnCode,
      );
      return rows
          .map((Map<String, Object?> row) => row[_columnCode]?.toString() ?? '')
          .where((String code) => code.isNotEmpty)
          .toList();
    } catch (error, stackTrace) {
      await logError(error, stackTrace);
      return <String>[];
    }
  }

  @override
  Future<BibleVerseResult?> getReference(BibleReference reference,
      {required String translationCode}) async {
    if (reference.effectiveChapterEnd != reference.chapterStart) {
      return null;
    }

    final Database database = await _database();
    try {
      final int fromVerse = reference.minVerse;
      final int toVerse = reference.maxVerse;

      final List<Map<String, Object?>> rows = await database.query(
        _tableVerses,
        columns: <String>[_columnChapter, _columnVerse, _columnText],
        where:
            '$_columnTranslationCode = ? AND $_columnBookId = ? AND $_columnChapter = ? AND $_columnVerse >= ? AND $_columnVerse <= ?',
        whereArgs: <Object>[
          translationCode,
          reference.bookId,
          reference.chapterStart,
          fromVerse,
          toVerse,
        ],
        orderBy: '$_columnChapter ASC, $_columnVerse ASC',
      );

      if (rows.isEmpty) {
        return null;
      }

      final List<Map<String, Object?>> translations = await database.query(
        _tableTranslations,
        columns: <String>[_columnName],
        where: '$_columnCode = ?',
        whereArgs: <Object>[translationCode],
        limit: 1,
      );
      final Object? translationNameRaw =
          translations.isEmpty ? null : translations.first[_columnName];
      final String translationName =
          (translationNameRaw is String && translationNameRaw.isNotEmpty)
              ? translationNameRaw
              : translationCode.toUpperCase();

      final List<BibleVerseLine> verses = <BibleVerseLine>[];
      for (final Map<String, Object?> row in rows) {
        final Object? chapterRaw = row[_columnChapter];
        final Object? verseRaw = row[_columnVerse];
        final Object? textRaw = row[_columnText];
        final int chapter =
            chapterRaw is int ? chapterRaw : int.parse(chapterRaw.toString());
        final int verse =
            verseRaw is int ? verseRaw : int.parse(verseRaw.toString());
        if (!reference.containsVerse(chapter, verse)) {
          continue;
        }
        verses.add(BibleVerseLine(
          chapter: chapter,
          verse: verse,
          text: textRaw?.toString() ?? '',
        ));
      }

      if (verses.isEmpty) {
        return null;
      }

      return BibleVerseResult(
        reference: reference,
        translationCode: translationCode,
        translationName: translationName,
        verses: verses,
      );
    } catch (error, stackTrace) {
      await logError(error, stackTrace);
      return null;
    }
  }
}
