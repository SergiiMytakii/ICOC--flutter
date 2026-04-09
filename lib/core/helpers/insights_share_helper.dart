import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

class InsightsShareHelper {
  const InsightsShareHelper._();

  static String buildPostDeepLink(Post post) {
    final Uri baseUri = Uri.parse(ICOC_WEB_PAGE);
    final String normalizedLanguage = post.language.trim();
    final Map<String, String>? queryParameters = normalizedLanguage.isEmpty
        ? null
        : <String, String>{'lang': normalizedLanguage};

    return baseUri.replace(
      pathSegments: <String>[
        ...baseUri.pathSegments.where((String segment) => segment.isNotEmpty),
        INSIGHTS,
        'post',
        post.id,
      ],
      queryParameters: queryParameters,
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
}
