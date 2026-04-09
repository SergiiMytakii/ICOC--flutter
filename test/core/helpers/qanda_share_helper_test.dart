import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/qanda_share_helper.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';

void main() {
  QandAModel buildArticle({
    required int id,
    required Languages lang,
    String title = 'Article title',
    String question = 'Article question',
  }) {
    return QandAModel(
      id: id,
      documentRef: 'doc-ref',
      title: title,
      question: question,
      answer: '',
      lang: lang,
    );
  }

  group('QandAShareHelper.buildArticleDeepLink', () {
    test('builds qanda deep link with id and lang', () {
      final QandAModel article = buildArticle(id: 42, lang: Languages.uk);

      final String deepLink = QandAShareHelper.buildArticleDeepLink(article);

      expect(deepLink, 'https://icoc.netlify.app/qanda/article/42?lang=uk');
    });
  });

  group('QandAShareHelper.buildShareContent', () {
    test('includes title, question and deep link', () {
      final QandAModel article = buildArticle(id: 7, lang: Languages.en);

      final String content = QandAShareHelper.buildShareContent(article);

      expect(
        content,
        'Article title\n\nArticle question\n\nhttps://icoc.netlify.app/qanda/article/7?lang=en',
      );
    });
  });
}
