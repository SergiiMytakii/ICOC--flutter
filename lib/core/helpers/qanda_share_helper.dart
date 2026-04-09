import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';

class QandAShareHelper {
  const QandAShareHelper._();

  static String buildArticleDeepLink(QandAModel article) {
    final Uri baseUri = Uri.parse(ICOC_WEB_PAGE);
    final Map<String, String> queryParameters = <String, String>{
      'lang': article.lang.name,
    };

    return baseUri.replace(
      pathSegments: <String>[
        ...baseUri.pathSegments.where((String segment) => segment.isNotEmpty),
        Q_AND_ANSVERS,
        'article',
        article.id.toString(),
      ],
      queryParameters: queryParameters,
    ).toString();
  }

  static String buildShareContent(QandAModel article) {
    final List<String> parts = <String>[];
    final String title = article.title.trim();
    if (title.isNotEmpty) {
      parts.add(title);
    }
    final String question = article.question.trim();
    if (question.isNotEmpty) {
      parts.add(question);
    }
    parts.add(buildArticleDeepLink(article));
    return parts.join('\n\n').trim();
  }
}
