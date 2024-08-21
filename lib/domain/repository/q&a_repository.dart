import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';

abstract class QandARepository {
  Future<List<QandAModel>> getArticles({Languages? lang, String? query});

  Future<List<Languages>> getAllLangs();

  Future<QandAModel> getArticleContent(QandAModel article);

  Future<QandAModel> translateArticleContent(QandAModel article);
}
