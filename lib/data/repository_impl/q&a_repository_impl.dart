import 'package:injectable/injectable.dart';

import 'package:icoc/core/data_sources/local/local_q_and_a_db_data_source.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/core/repository/q&a_repository.dart';

@dev
@prod
@Injectable(as: QandARepository)
class QandARepositoryImpl extends QandARepository {
  LocalQandAdB localQandAdB;
  QandARepositoryImpl(
    this.localQandAdB,
  );
  @override
  Future getArticles() async {
    final List<QandAModel> articles = await localQandAdB.getAnsvers();
    return articles;
  }
}
