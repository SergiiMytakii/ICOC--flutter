import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/wall_data_source.dart';
import 'package:icoc/domain/model/wall/post.dart';
import 'package:icoc/domain/repository/wall_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WallRepository)
class WallRepositoryImpl implements WallRepository {
  final WallDataSource _wallDataSource;

  WallRepositoryImpl(this._wallDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts(
      {Set<String> languages = const {}}) async {
    try {
      final posts = await _wallDataSource.getPosts(languages: languages);
      return Right(posts);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }
}
