import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/wall/post.dart';

abstract class WallRepository {
  Future<Either<Failure, List<Post>>> getPosts({Set<String> languages});
}
