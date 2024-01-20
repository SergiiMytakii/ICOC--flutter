import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class SqliteDatabaseService {
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
    String path = join((await getDatabasesPath()), DB_NAME);

    bool dbExists = await io.File(path).exists();
    log.d(dbExists);
    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/db/ansver.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    return _db = await openDatabase(path);
  }

  Future<List<QandAModel>> getAnsvers() async {
    final Database? database = await db;

    final List<Map<String, dynamic>> items = await database!.query(
      TABLE_ANSVERS,
    );

    List<QandAModel> ansvers = items.map((item) {
      return QandAModel(
          id: item['UUID'],
          title: item['title'],
          text: item['text'],
          date: item['date'],
          photo: item['photo']);
    }).toList();

    return ansvers;
  }
}
