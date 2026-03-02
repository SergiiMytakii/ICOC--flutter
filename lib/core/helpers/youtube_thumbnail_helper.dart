class YoutubeThumbnailHelper {
  static final RegExp _idPattern = RegExp(r'^[a-zA-Z0-9_-]{11}$');

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
    return thumbnailForVideoId(videoId);
  }

  static String? _extractFromUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return videoIdFromInput(value.trim());
  }

  static bool isShortsUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    final Uri? uri = Uri.tryParse(value.trim());
    if (uri == null) {
      return false;
    }
    return uri.pathSegments.contains('shorts');
  }

  static String? videoIdFromInput(String? value) {
    if (value == null) {
      return null;
    }
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    if (_idPattern.hasMatch(trimmed)) {
      return trimmed;
    }

    final Uri? uri = Uri.tryParse(trimmed);
    if (uri == null) {
      return null;
    }

    final String host = uri.host.toLowerCase();
    if (host == 'youtu.be') {
      final List<String> segments = uri.pathSegments
          .where((String segment) => segment.isNotEmpty)
          .toList();
      return segments.isEmpty ? null : _normalizeCandidate(segments.first);
    }

    if (host.endsWith('youtube.com') || host.endsWith('youtube-nocookie.com')) {
      final String? fromQuery = _normalizeCandidate(uri.queryParameters['v']);
      if (fromQuery != null) {
        return fromQuery;
      }

      final List<String> segments = uri.pathSegments;
      for (int index = 0; index < segments.length; index++) {
        final String segment = segments[index];
        if (segment == 'embed' ||
            segment == 'shorts' ||
            segment == 'live' ||
            segment == 'watch') {
          if (index + 1 < segments.length) {
            final String? candidate = _normalizeCandidate(segments[index + 1]);
            if (candidate != null) {
              return candidate;
            }
          }
        }
      }
    }

    return null;
  }

  static String thumbnailForVideoId(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  static String? _normalizeCandidate(String? value) {
    if (value == null) {
      return null;
    }
    final String trimmed = value.trim();
    if (_idPattern.hasMatch(trimmed)) {
      return trimmed;
    }
    return null;
  }
}
