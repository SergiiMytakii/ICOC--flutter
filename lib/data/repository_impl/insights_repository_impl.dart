import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/insights_data_source.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InsightsRepository)
class InsightsRepositoryImpl implements InsightsRepository {
  final InsightsDataSource _insightsDataSource;

  InsightsRepositoryImpl(this._insightsDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts({Set<String> languages = const {}}) async {
    try {
      final posts = await _insightsDataSource.getPosts(languages: languages);
      return Right(posts);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }
}
