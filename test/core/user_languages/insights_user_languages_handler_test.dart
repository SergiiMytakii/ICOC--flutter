import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/main.dart' as app;

class _MemoryLocalCache implements LocalCache {
  final Map<String, Object?> _values = <String, Object?>{};

  @override
  bool? getBool(String key) => _values[key] as bool?;

  @override
  double? getDouble(String key) => _values[key] as double?;

  @override
  List<String>? getList(String key) => (_values[key] as List?)?.cast<String>();

  @override
  Map<String, dynamic>? getMap(String key) =>
      (_values[key] as Map?)?.cast<String, dynamic>();

  @override
  String? getString(String key) => _values[key] as String?;

  @override
  Future<void> removeValue(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveList(String key, List<String> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveString(String key, String value) async {
    _values[key] = value;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MemoryLocalCache cache;
  late String originalLocale;

  setUp(() {
    cache = _MemoryLocalCache();
    originalLocale = app.locale;
  });

  tearDown(() {
    app.locale = originalLocale;
  });

  test('initializes only available languages and selects app locale', () async {
    app.locale = 'uk';
    final handler = InsightsUserLanguagesHandler(cache);

    final Map<String, dynamic> result = await handler
        .initializeFromAvailableLanguages(<String>['en', 'uk', 'ru']);

    expect(result, <String, dynamic>{'en': false, 'uk': true, 'ru': false});
    expect(
      cache.getMap(StorageKeys.insightsLanguages),
      <String, dynamic>{'en': false, 'uk': true, 'ru': false},
    );
  });

  test('falls back to device locale when app locale is unavailable', () async {
    final String deviceLocale =
        ui.PlatformDispatcher.instance.locale.languageCode;
    app.locale = deviceLocale == 'en' ? 'uk' : 'en';
    final handler = InsightsUserLanguagesHandler(cache);

    final Map<String, dynamic> result = await handler
        .initializeFromAvailableLanguages(<String>[deviceLocale, 'fr']);

    expect(result[deviceLocale], true);
    expect(result.values.where((dynamic value) => value == true), <bool>[true]);
  });

  test('removes stale cached languages and keeps at least one active language',
      () async {
    await cache.saveMap(StorageKeys.insightsLanguages, <String, dynamic>{
      'de': true,
      'en': false,
    });
    app.locale = 'uk';
    final handler = InsightsUserLanguagesHandler(cache);

    final Map<String, dynamic> result =
        await handler.initializeFromAvailableLanguages(<String>['fr', 'en']);

    expect(result.keys, <String>{'en', 'fr'});
    expect(result.values.where((dynamic value) => value == true).length, 1);
  });

  test('can enable a new language explicitly', () async {
    final handler = InsightsUserLanguagesHandler(cache);
    await handler.initializeFromAvailableLanguages(<String>['en']);

    await handler.ensureLanguageEnabled('uk');

    expect(handler.languages, <String, dynamic>{'en': true, 'uk': true});
    expect(
      cache.getMap(StorageKeys.insightsLanguages),
      <String, dynamic>{'en': true, 'uk': true},
    );
  });
}
