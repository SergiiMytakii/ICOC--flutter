import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

@singleton
class InsightsInteractionLocalStore {
  InsightsInteractionLocalStore(this._localCache);

  final LocalCache _localCache;
  final Uuid _uuid = const Uuid();

  String getOrCreateDeviceId() {
    final String? cached = _localCache.getString(StorageKeys.deviceId);
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }

    final String generated = _uuid.v4();
    _localCache.saveString(StorageKeys.deviceId, generated);
    return generated;
  }

  String? getDisplayName() {
    final String? value =
        _localCache.getString(StorageKeys.insightsDisplayName);
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return value.trim();
  }

  Future<void> saveDisplayName(String value) async {
    await _localCache.saveString(
      StorageKeys.insightsDisplayName,
      value.trim(),
    );
  }

  Set<String> getLikedPostIds() {
    return (_localCache.getList(StorageKeys.insightsLikedPosts) ?? <String>[])
        .toSet();
  }

  Future<void> setLikedPostState(String postId, bool isLiked) async {
    final Set<String> likedPostIds = getLikedPostIds();
    if (isLiked) {
      likedPostIds.add(postId);
    } else {
      likedPostIds.remove(postId);
    }
    await _localCache.saveList(
      StorageKeys.insightsLikedPosts,
      likedPostIds.toList()..sort(),
    );
  }
}
