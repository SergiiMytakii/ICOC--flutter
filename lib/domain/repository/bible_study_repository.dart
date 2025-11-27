import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';

abstract class BibleStudyRepository {
  Future<Either<Failure, List<BibleStudy>>> getBibleStudyList();
}
