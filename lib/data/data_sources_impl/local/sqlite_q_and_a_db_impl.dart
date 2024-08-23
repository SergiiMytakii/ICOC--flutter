import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:icoc/data/data_sources_impl/remote/firebase_data_source_impl.dart';
import 'package:icoc/domain/data_sources/local/local_q_and_a_db_data_source.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:html/parser.dart' show parse;

// @dev
// @prod
// @Injectable(as: LocalQandAdB)
class SqliteQandAdbImpl implements LocalQandAdB {
  static Database? _db;
  static const String DB_NAME = 'ansver.db';
  static const String TABLE_ANSVERS = 'ansver';
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String TEXT = 'text';
  static const String DATE = 'date';
  static const String PICTURE = 'picture';
  final log = Logger();

  /* get refetence to the DB and initialasing DB */
  Future<Database?> get db async {
    if (_db != null) {
      log.i('db already exist!');
      return _db;
    } else {
      _db = await initDB();
      log.i('initializing db');
      return _db;
    }
  }

  Future<Database> initDB() async {
    final String path = join((await getDatabasesPath()), DB_NAME);

    final bool dbExists = await io.File(path).exists();
    if (!dbExists) {
      // Copy from asset
      final ByteData data = await rootBundle.load(join('assets/db/ansver.db'));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    return _db = await openDatabase(path);
  }

  @override
  Future<List<QandAModel>> getAnsvers() async {
    final Database? database = await db;
    if (database == null) {
      throw Exception('Database not initialized');
    }

    final List<Map<String, dynamic>> items = await database.query(
      TABLE_ANSVERS,
    );
    final List<QandAModel> ansvers = items.map((item) {
      return QandAModel.fromJson(item, '');
    }).toList();

    return ansvers;
  }
}
