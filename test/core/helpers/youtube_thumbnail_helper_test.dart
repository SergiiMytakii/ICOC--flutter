import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';

void main() {
  group('YoutubeThumbnailHelper', () {
    test('prefers explicit youtubeId', () {
      expect(
        YoutubeThumbnailHelper.resolveVideoId(
          youtubeId: 'abc123',
          mediaUrl: 'https://youtu.be/ignored',
        ),
        'abc123',
      );
    });

    test('extracts youtube id from url fallback', () {
      expect(
        YoutubeThumbnailHelper.resolveVideoId(
          mediaUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        ),
        'dQw4w9WgXcQ',
      );
    });

    test('builds default thumbnail url from video id', () {
      expect(
        YoutubeThumbnailHelper.resolveThumbnailUrl(
          youtubeId: 'dQw4w9WgXcQ',
        ),
        'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
      );
    });

    test('returns explicit thumbnail when provided', () {
      expect(
        YoutubeThumbnailHelper.resolveThumbnailUrl(
          thumbnailUrl: 'https://cdn.example.com/thumb.jpg',
          youtubeId: 'dQw4w9WgXcQ',
        ),
        'https://cdn.example.com/thumb.jpg',
      );
    });
  });
}
