import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/ai_data_source.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/data_sources/remote/http_client.dart';
import 'package:injectable/injectable.dart';
import 'package:html/parser.dart' show parse;
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/domain/repository/q&a_repository.dart';
import 'package:langchain/langchain.dart';

@dev
@prod
@Injectable(as: QandARepository)
class QandARepositoryImpl extends QandARepository {
  final FirebaseDataSource firebaseDataSource;
  final AiDataSource aiDataSource;
  final HttpClient httpClientImpl;
  QandARepositoryImpl(
      this.firebaseDataSource, this.aiDataSource, this.httpClientImpl);
  @override
  Future<List<QandAModel>> getArticles({Languages? lang, String? query}) async {
    final QuerySnapshot snapshot = await firebaseDataSource.getFromFirebase(
        FirebaseCollections.QandA.name,
        filters: lang != null ? {'lang': lang.name} : null,
        search: query != null ? {'id': query} : null,
        orderBy: {'id': true});
    final List<QandAModel> articles = snapshot.docs.map(
      (doc) {
        final article =
            QandAModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);

        return article;
      },
    ).toList();

    return articles;
  }

  @override
  Future<List<Languages>> getAllLangs() async {
    final QuerySnapshot snapshot = await firebaseDataSource.getFromFirebase(
      FirebaseCollections.QandALangs.name,
    );
    final List<Languages> langs = [];

    snapshot.docs.forEach((doc) {
      final langsMap = doc.data() as Map<String, dynamic>;
      print(langsMap.toString());
      for (final lang in langsMap['QandAlangs']) {
        langs.add(convertLanguagesEnum(lang));
      }
    });

    return langs;
  }

  @override
  Future<QandAModel> getArticleContent(QandAModel article) async {
    try {
      final response = await httpClientImpl.get(Uri.parse(article.link!),
          headers: {'Content-Type': 'text/html'});
      if (response.statusCode == 200) {
        final document = parse(response.body);

        final questionElement = document
            .querySelector(
              'article p em,  article p i, article div em, article div i',
            )
            ?.parent;
        final question = questionElement?.text.trim() ?? '';

        final contentDiv = document.querySelector('article > div.post-content');
        final answerElements = contentDiv?.children
                .where((element) => element != questionElement) ??
            [];

        String? mediaLink;
        final anchorElement = document.querySelector('article a');
        if (anchorElement != null) {
          final href = anchorElement.attributes['href'];
          if (href != null &&
              (href.contains('youtube.com') || href.contains('youtu.be'))) {
            mediaLink = href;
          }
        }
        if (mediaLink == null) {
          final iframeElement = document.querySelector('article iframe');
          if (iframeElement != null) {
            final src = iframeElement.attributes['src'];
            if (src != null &&
                (src.contains('youtube.com') || src.contains('youtu.be'))) {
              mediaLink = src;
            }
          }
        }

        final answer = answerElements
            .where((element) => element.text.trim().isNotEmpty)
            .map((element) => element.text.trim())
            .join('\n\n');

        return article.copyWith(
            answer: answer, question: question, youtubeLink: mediaLink);
      } else {
        final message =
            'Error fetching article content: ${response.statusCode},${response.body}';
        logError(message, null);
        throw Exception(message);
      }
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      throw Exception('Error fetching article content: $e');
    }
  }

  @override
  Future<QandAModel> translateArticleContent(QandAModel article) async {
    try {
      final outputTemplate = {
        'question': 'translated question',
        'answer': 'translated answer'
      };
      final query = {
        'question': article.question,
        'answer': article.answer,
        'lang': article.lang,
        'outputTemplate': outputTemplate
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
        You are an expert Biblical translator with deep knowledge of theological concepts.
        Follow these steps:
        1. Identify the target language from the provided language code: {lang}.
        2. Translate the following question and answer to the target language:
          Question: {question}
          Answer: {answer}
        3. Ensure the translation maintains the original Biblical and theological context.
        4. Adapt any cultural references or idioms to be understood in the target language while preserving the original meaning.
        5. Format the translated content as valid JSON using this structure:
          {outputTemplate}
        ''');
      final res = await aiDataSource.getAiResponse(promptTemplate, query);

      article =
          article.copyWith(question: res['question'], answer: res['answer']);

      firebaseDataSource.updateToFirebase(
          collectionName: FirebaseCollections.QandA.name,
          documentPath: article.documentRef,
          data: {
            'question': article.question,
            'answer': article.answer,
            'youtubeLink': article.youtubeLink
          });
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      throw Exception('Error translating article content: $e');
    }
    return article;
  }
}
