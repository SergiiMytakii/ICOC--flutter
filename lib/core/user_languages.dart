import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';

abstract class UserLanguagesHandler {
  final LocalCache _localCache;
  Map<String, dynamic> languages = {};

  UserLanguagesHandler(this._localCache);
  Future<void> addLanguage(String lang, bool isActive) async {
    languages[lang] = isActive;
  }

  Future<void> updateLanguage(String lang, bool isActive) async {
    languages[lang] = isActive;
  }

  bool containsLang(String lang) => languages.containsKey(lang);
  String get firstActiveLang => languages.entries
      .firstWhere(
        (element) => element.value,
        orElse: () => MapEntry(locale, true),
      )
      .key;
  Set<String> getActiveLanguages() => languages.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toSet();

  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    languages = updatedLanguages;
  }
}

@dev
@prod
@singleton
class BibleStudyUserLanguagesHandler extends UserLanguagesHandler {
  BibleStudyUserLanguagesHandler(super._localCache) {
    languages.addAll(_localCache.getMap(StorageKeys.bibleStudyLanguages) ?? {});
  }

  @override
  Future<void> addLanguage(String lang, bool isActive) async {
    super.addLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.bibleStudyLanguages, languages);
  }

  @override
  Future<void> updateLanguage(String lang, bool isActive) async {
    super.updateLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.bibleStudyLanguages, languages);
  }

  @override
  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    super.saveAllLanguages(updatedLanguages);
    await _localCache.saveMap(
        StorageKeys.bibleStudyLanguages, updatedLanguages);
  }
}

@dev
@prod
@singleton
class QandAUserLanguagesHandler extends UserLanguagesHandler {
  QandAUserLanguagesHandler(super._localCache) {
    languages.addAll(_localCache.getMap(StorageKeys.qAndALanguages) ?? {});
  }

  @override
  Future<void> addLanguage(String lang, bool isActive) async {
    super.addLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.qAndALanguages, languages);
  }

  @override
  Future<void> updateLanguage(String lang, bool isActive) async {
    super.updateLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.qAndALanguages, languages);
  }

  @override
  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    super.saveAllLanguages(updatedLanguages);
    await _localCache.saveMap(StorageKeys.qAndALanguages, updatedLanguages);
  }
}

@dev
@prod
@singleton
class VideosUserLanguagesHandler extends UserLanguagesHandler {
  VideosUserLanguagesHandler(super._localCache) {
    languages.addAll(_localCache.getMap(StorageKeys.videosAllLanguages) ?? {});
  }

  @override
  Future<void> addLanguage(String lang, bool isActive) async {
    super.addLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.videosAllLanguages, languages);
  }

  @override
  Future<void> updateLanguage(String lang, bool isActive) async {
    super.updateLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.videosAllLanguages, languages);
  }

  @override
  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    super.saveAllLanguages(updatedLanguages);
    await _localCache.saveMap(StorageKeys.videosAllLanguages, updatedLanguages);
  }
}

@dev
@prod
@singleton
class SongsUserLanguagesHandler extends UserLanguagesHandler {
  SongsUserLanguagesHandler(super._localCache) {
    languages = _localCache.getMap(StorageKeys.allSongsLanguages) ?? {};
  }

  @override
  Future<void> addLanguage(String lang, bool isActive) async {
    super.addLanguage(lang, isActive);
    await _localCache.saveMap(StorageKeys.allSongsLanguages, languages);
  }

  @override
  Future<void> updateLanguage(String lang, bool isActive) async {
    super.updateLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.allSongsLanguages, languages);
  }

  @override
  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    super.saveAllLanguages(updatedLanguages);
    await _localCache.saveMap(StorageKeys.allSongsLanguages, languages);
  }

  String get primaryLang =>
      _localCache.getString(StorageKeys.primaryLang) ?? locale;

  Future<void> updatePrimaryLanguage(
    String lang,
  ) async {
    _localCache.saveString(StorageKeys.primaryLang, lang);
  }

  bool get isOneActiveLang =>
      languages.entries.toList().where((entry) => entry.value).length == 1;
}

@dev
@prod
@singleton
class InsightsUserLanguagesHandler extends UserLanguagesHandler {
  InsightsUserLanguagesHandler(super._localCache) {
    final cachedLanguages = _localCache.getMap(StorageKeys.wallLanguages);
    if (cachedLanguages == null || cachedLanguages.isEmpty) {
      languages = Map.from(languagesCodes)
          .map((key, value) => MapEntry(key, false));
      if (languages.containsKey(locale)) {
        languages[locale] = true;
      } else if (languages.isNotEmpty) {
        languages[languages.keys.first] = true;
      }
    } else {
      languages.addAll(cachedLanguages);
    }
  }

  @override
  Future<void> addLanguage(String lang, bool isActive) async {
    super.addLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.wallLanguages, languages);
  }

  @override
  Future<void> updateLanguage(String lang, bool isActive) async {
    super.updateLanguage(lang, isActive);
    _localCache.saveMap(StorageKeys.wallLanguages, languages);
  }

  @override
  Future<void> saveAllLanguages(Map<String, dynamic> updatedLanguages) async {
    super.saveAllLanguages(updatedLanguages);
    await _localCache.saveMap(StorageKeys.wallLanguages, updatedLanguages);
  }
}
