import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

class InsightsShareHelper {
  const InsightsShareHelper._();

  static String buildPostDeepLink(Post post) {
    final Uri baseUri = Uri.parse(ICOC_WEB_PAGE);
    final String normalizedLanguage = post.language.trim();
    final Map<String, String> queryParameters = <String, String>{};
    if (normalizedLanguage.isNotEmpty) {
      queryParameters['lang'] = normalizedLanguage;
    }

    final String? previewImage = _resolvePreviewImageUrl(post);
    if (previewImage != null) {
      queryParameters['image'] = previewImage;
    }

    final String? previewTitle = _resolvePreviewTitle(post);
    if (previewTitle != null) {
      queryParameters['title'] = previewTitle;
    }

    final String? previewDescription = _resolvePreviewDescription(post);
    if (previewDescription != null) {
      queryParameters['description'] = previewDescription;
    }

    return baseUri.replace(
      pathSegments: <String>[
        ...baseUri.pathSegments.where((String segment) => segment.isNotEmpty),
        INSIGHTS,
        'post',
        post.id,
      ],
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    ).toString();
  }

  static String buildShareContent(Post post) {
    final List<String> parts = <String>[];
    final String content = (post.content ?? '').trim();
    if (content.isNotEmpty) {
      parts.add(content);
    }

    final String deepLink = buildPostDeepLink(post);
    switch (post.type) {
      case PostType.video:
        parts.add(deepLink);
        break;
      case PostType.image:
        final String imageUrl = (post.primaryMediaUrl ?? '').trim();
        if (imageUrl.isNotEmpty) {
          parts.add(imageUrl);
        }
        parts.add(deepLink);
        break;
      case PostType.text:
        break;
    }

    return parts.join('\n').trim();
  }

  static String? _resolvePreviewImageUrl(Post post) {
    final String? candidate = switch (post.type) {
      PostType.image => post.primaryMediaUrl,
      PostType.video => YoutubeThumbnailHelper.resolveThumbnailUrl(
          thumbnailUrl: post.thumbnailUrl,
          youtubeId: post.youtubeId,
          articleUrl: post.articleUrl,
          mediaUrl: post.primaryMediaUrl,
        ),
      PostType.text => null,
    };
    return _normalizeHttpUrl(candidate);
  }

  static String? _resolvePreviewTitle(Post post) {
    final String? fromTitle = _normalizeText(post.title, maxLength: 90);
    if (fromTitle != null) {
      return fromTitle;
    }
    return _normalizeText(post.content, maxLength: 90);
  }

  static String? _resolvePreviewDescription(Post post) {
    return _normalizeText(post.content, maxLength: 240);
  }

  static String? _normalizeHttpUrl(String? value) {
    final String candidate = (value ?? '').trim();
    if (candidate.isEmpty) {
      return null;
    }
    final Uri? uri = Uri.tryParse(candidate);
    if (uri == null) {
      return null;
    }
    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return null;
    }
    return uri.toString();
  }

  static String? _normalizeText(String? value, {required int maxLength}) {
    final String normalized =
        (value ?? '').replaceAll(RegExp(r'\s+'), ' ').trim();
    if (normalized.isEmpty) {
      return null;
    }
    if (normalized.length <= maxLength) {
      return normalized;
    }
    return '${normalized.substring(0, maxLength - 1)}…';
  }
}
