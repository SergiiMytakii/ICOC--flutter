import 'package:injectable/injectable.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

@singleton
class NewItemsLocalStore {
  NewItemsLocalStore(this._localCache);

  final LocalCache _localCache;

  // ─── Insights ────────────────────────────────────────────────

  Set<String> getKnownPostIds() {
    return (_localCache.getList(StorageKeys.insightsLastKnownPostIds) ??
            <String>[])
        .toSet();
  }

  Future<void> saveKnownPostIds(Set<String> ids) async {
    await _localCache.saveList(
      StorageKeys.insightsLastKnownPostIds,
      ids.toList()..sort(),
    );
  }

  Set<String> computeNewPostIds(Set<String> currentIds) {
    final known = getKnownPostIds();
    if (known.isEmpty) {
      saveKnownPostIds(currentIds);
      return <String>{};
    }
    return currentIds.difference(known);
  }

  // ─── Songs ────────────────────────────────────────────────────

  Set<int> getKnownSongIds() {
    return (_localCache.getList(StorageKeys.songsLastKnownIds) ?? <String>[])
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .toSet();
  }

  Future<void> saveKnownSongIds(Set<int> ids) async {
    await _localCache.saveList(
      StorageKeys.songsLastKnownIds,
      ids.map((e) => e.toString()).toList()..sort(),
    );
  }

  Set<int> computeNewSongIds(Set<int> currentIds) {
    final known = getKnownSongIds();
    if (known.isEmpty) {
      saveKnownSongIds(currentIds);
      return <int>{};
    }
    return currentIds.difference(known);
  }

  // ─── Bible Study ──────────────────────────────────────────────

  Set<int> getKnownTopicIds() {
    return (_localCache.getList(StorageKeys.bibleStudyLastKnownTopicIds) ??
            <String>[])
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .toSet();
  }

  Future<void> saveKnownTopicIds(Set<int> ids) async {
    await _localCache.saveList(
      StorageKeys.bibleStudyLastKnownTopicIds,
      ids.map((e) => e.toString()).toList()..sort(),
    );
  }

  Set<int> getKnownLessonIds() {
    return (_localCache.getList(StorageKeys.bibleStudyLastKnownLessonIds) ??
            <String>[])
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .toSet();
  }

  Future<void> saveKnownLessonIds(Set<int> ids) async {
    await _localCache.saveList(
      StorageKeys.bibleStudyLastKnownLessonIds,
      ids.map((e) => e.toString()).toList()..sort(),
    );
  }

  ({Set<int> newTopicIds, Set<int> newLessonIds}) computeNewBibleStudyIds({
    required Set<int> currentTopicIds,
    required Set<int> currentLessonIds,
  }) {
    final knownTopics = getKnownTopicIds();
    final knownLessons = getKnownLessonIds();
    if (knownTopics.isEmpty && knownLessons.isEmpty) {
      saveKnownTopicIds(currentTopicIds);
      saveKnownLessonIds(currentLessonIds);
      return (newTopicIds: <int>{}, newLessonIds: <int>{});
    }
    return (
      newTopicIds: currentTopicIds.difference(knownTopics),
      newLessonIds: currentLessonIds.difference(knownLessons),
    );
  }
}
