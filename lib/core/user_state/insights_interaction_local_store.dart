import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

class InsightsViewedPostMarker {
  const InsightsViewedPostMarker({
    required this.postId,
    required this.createdAt,
  });

  final String postId;
  final DateTime createdAt;
}

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

  Future<void> setLikedPostIds(Set<String> postIds) async {
    await _localCache.saveList(
      StorageKeys.insightsLikedPosts,
      postIds.toList()..sort(),
    );
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

  InsightsViewedPostMarker? getLastViewedPostMarker() {
    final String? postId =
        _localCache.getString(StorageKeys.insightsLastViewedPostId);
    final String? createdAtRaw =
        _localCache.getString(StorageKeys.insightsLastViewedPostCreatedAt);
    if (postId == null ||
        postId.isEmpty ||
        createdAtRaw == null ||
        createdAtRaw.isEmpty) {
      return null;
    }

    final DateTime? createdAt = DateTime.tryParse(createdAtRaw)?.toUtc();
    if (createdAt == null) {
      return null;
    }

    return InsightsViewedPostMarker(
      postId: postId,
      createdAt: createdAt,
    );
  }

  Future<void> saveLastViewedPost({
    required String postId,
    required DateTime createdAt,
  }) async {
    final InsightsViewedPostMarker nextMarker = InsightsViewedPostMarker(
      postId: postId,
      createdAt: createdAt.toUtc(),
    );
    final InsightsViewedPostMarker? currentMarker = getLastViewedPostMarker();
    if (currentMarker != null &&
        _compareViewedMarkers(nextMarker, currentMarker) < 0) {
      return;
    }

    await _localCache.saveString(
      StorageKeys.insightsLastViewedPostId,
      nextMarker.postId,
    );
    await _localCache.saveString(
      StorageKeys.insightsLastViewedPostCreatedAt,
      nextMarker.createdAt.toIso8601String(),
    );
  }

  int comparePostAgainstLastViewed({
    required String postId,
    required DateTime createdAt,
  }) {
    final InsightsViewedPostMarker? marker = getLastViewedPostMarker();
    if (marker == null) {
      return 1;
    }
    return _comparePostWithMarker(
      postId: postId,
      createdAt: createdAt,
      marker: marker,
    );
  }

  int _compareViewedMarkers(
    InsightsViewedPostMarker left,
    InsightsViewedPostMarker right,
  ) {
    final int createdAtComparison = left.createdAt.compareTo(right.createdAt);
    if (createdAtComparison != 0) {
      return createdAtComparison;
    }
    return left.postId.compareTo(right.postId);
  }

  int _comparePostWithMarker({
    required String postId,
    required DateTime createdAt,
    required InsightsViewedPostMarker marker,
  }) {
    final int createdAtComparison =
        createdAt.toUtc().compareTo(marker.createdAt);
    if (createdAtComparison != 0) {
      return createdAtComparison;
    }
    return postId.compareTo(marker.postId);
  }
}
