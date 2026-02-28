import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeThumbnailHelper {
  static String? resolveVideoId({
    String? youtubeId,
    String? articleUrl,
    String? mediaUrl,
  }) {
    if (youtubeId != null && youtubeId.trim().isNotEmpty) {
      return youtubeId.trim();
    }

    final String? fromMedia = _extractFromUrl(mediaUrl);
    if (fromMedia != null) {
      return fromMedia;
    }
    return _extractFromUrl(articleUrl);
  }

  static String? resolveThumbnailUrl({
    String? thumbnailUrl,
    String? youtubeId,
    String? articleUrl,
    String? mediaUrl,
  }) {
    if (thumbnailUrl != null && thumbnailUrl.trim().isNotEmpty) {
      return thumbnailUrl.trim();
    }

    final String? videoId = resolveVideoId(
      youtubeId: youtubeId,
      mediaUrl: mediaUrl,
      articleUrl: articleUrl,
    );
    if (videoId == null || videoId.isEmpty) {
      return null;
    }
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  static String? _extractFromUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return YoutubePlayerController.convertUrlToId(value.trim());
  }

  static bool isShortsUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    return value.contains('/shorts/');
  }
}
