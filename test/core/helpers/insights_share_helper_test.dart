import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/insights_share_helper.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_author.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

void main() {
  group('InsightsShareHelper.buildPostDeepLink', () {
    test('builds deep link for insight post with language', () {
      final Post post = Post(
        id: 'post-42',
        type: PostType.video,
        language: 'uk',
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String deepLink = InsightsShareHelper.buildPostDeepLink(post);

      expect(
        deepLink,
        'https://icoc.netlify.app/insights/post/post-42?lang=uk',
      );
    });

    test('omits lang query when language is empty', () {
      final Post post = Post(
        id: 'post-42',
        type: PostType.video,
        language: '',
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String deepLink = InsightsShareHelper.buildPostDeepLink(post);

      expect(deepLink, 'https://icoc.netlify.app/insights/post/post-42');
    });
  });

  group('InsightsShareHelper.buildShareContent', () {
    test('uses deep link with metadata for video post', () {
      final Post post = Post(
        id: 'video-1',
        type: PostType.video,
        language: 'en',
        title: 'A video insight',
        content: 'Video insight',
        youtubeId: 'dQw4w9WgXcQ',
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String content = InsightsShareHelper.buildShareContent(post);
      final List<String> lines = content.split('\n');
      final Uri sharedUri = Uri.parse(lines.last);

      expect(lines.first, 'Video insight');
      expect(sharedUri.path, '/insights/post/video-1');
      expect(sharedUri.queryParameters['lang'], 'en');
      expect(
        sharedUri.queryParameters['image'],
        'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
      );
      expect(sharedUri.queryParameters['title'], 'A video insight');
      expect(sharedUri.queryParameters['description'], 'Video insight');
    });

    test('includes both image URL and deep link for image post', () {
      final Post post = Post(
        id: 'img-1',
        type: PostType.image,
        language: 'uk',
        title: 'Insight image title',
        content: 'Image insight',
        mediaUrls: const <String>['https://example.com/image.jpg'],
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String content = InsightsShareHelper.buildShareContent(post);
      final List<String> lines = content.split('\n');
      final Uri sharedUri = Uri.parse(lines.last);

      expect(lines[0], 'Image insight');
      expect(lines[1], 'https://example.com/image.jpg');
      expect(sharedUri.path, '/insights/post/img-1');
      expect(sharedUri.queryParameters['lang'], 'uk');
      expect(
          sharedUri.queryParameters['image'], 'https://example.com/image.jpg');
      expect(sharedUri.queryParameters['title'], 'Insight image title');
      expect(sharedUri.queryParameters['description'], 'Image insight');
    });
  });
}
