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
    test('uses deep link for video post', () {
      final Post post = Post(
        id: 'video-1',
        type: PostType.video,
        language: 'en',
        content: 'Video insight',
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String content = InsightsShareHelper.buildShareContent(post);

      expect(
        content,
        'Video insight\nhttps://icoc.netlify.app/insights/post/video-1?lang=en',
      );
    });

    test('includes both image URL and deep link for image post', () {
      final Post post = Post(
        id: 'img-1',
        type: PostType.image,
        language: 'uk',
        content: 'Image insight',
        mediaUrls: const <String>['https://example.com/image.jpg'],
        author: const PostAuthor(
          name: 'Author',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        createdAt: DateTime.utc(2026, 1, 1),
      );

      final String content = InsightsShareHelper.buildShareContent(post);

      expect(
        content,
        'Image insight\nhttps://example.com/image.jpg\nhttps://icoc.netlify.app/insights/post/img-1?lang=uk',
      );
    });
  });
}
