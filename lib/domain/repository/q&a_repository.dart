import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';

abstract class QandARepository {
  Future<Either<Failure, List<QandAModel>>> getArticles(
      {Languages? lang, OrderEnum? order});

  Future<Either<Failure, List<Languages>>> getAllLangs();

  Future<Either<Failure, QandAModel>> getArticleContent(QandAModel article);

  Future<Either<Failure, QandAModel>> translateArticleContent(
      QandAModel article);
}
