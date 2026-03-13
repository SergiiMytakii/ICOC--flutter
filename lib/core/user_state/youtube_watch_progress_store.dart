import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

class YoutubeWatchProgressStore {
  YoutubeWatchProgressStore(this._localCache);

  static const double minResumePositionSeconds = 5;
  static const double completionThresholdSeconds = 15;
  static const double completionThresholdPercent = 0.95;

  final LocalCache _localCache;

  String _keyForVideo(String videoId) {
    return '${StorageKeys.youtubeWatchProgress}_$videoId';
  }

  Future<double?> getProgressSeconds(String videoId) async {
    final double? value = await _localCache.getDouble(_keyForVideo(videoId));
    if (value == null || value.isNaN || value.isInfinite) {
      return null;
    }
    if (value < minResumePositionSeconds) {
      return null;
    }
    return value;
  }

  Future<void> saveProgress(
    String videoId,
    double positionSeconds,
    double? durationSeconds,
  ) async {
    if (positionSeconds.isNaN ||
        positionSeconds.isInfinite ||
        positionSeconds < minResumePositionSeconds) {
      await clearProgress(videoId);
      return;
    }

    if (_isCompleted(
      positionSeconds: positionSeconds,
      durationSeconds: durationSeconds,
    )) {
      await clearProgress(videoId);
      return;
    }

    await _localCache.saveDouble(_keyForVideo(videoId), positionSeconds);
  }

  Future<void> clearProgress(String videoId) async {
    await _localCache.removeValue(_keyForVideo(videoId));
  }

  bool _isCompleted({
    required double positionSeconds,
    required double? durationSeconds,
  }) {
    if (durationSeconds == null ||
        durationSeconds.isNaN ||
        durationSeconds.isInfinite ||
        durationSeconds <= 0) {
      return false;
    }

    final double remainingSeconds = durationSeconds - positionSeconds;
    if (remainingSeconds <= completionThresholdSeconds) {
      return true;
    }

    return positionSeconds / durationSeconds >= completionThresholdPercent;
  }
}
