import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/insights/post.dart';

abstract class InsightsRepository {
  Future<Either<Failure, List<Post>>> getPosts({Set<String> languages});
}
