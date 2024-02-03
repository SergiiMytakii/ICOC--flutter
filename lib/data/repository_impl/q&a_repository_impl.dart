import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/core/repository/q&a_repository.dart';
import 'package:icoc/data/local/sqlite_database_service.dart';

class QandARepositoryImpl extends QandARepository {
  @override
  Future getArticles() async {
    final List<QandAModel> articles =
        await SqliteDatabaseService().getAnsvers();
    return articles;
  }
}
