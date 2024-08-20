import 'package:icoc/core/constants.dart';

abstract class QandARepository {
  Future getArticles({Languages? lang, String? query});

  Future<List<Languages>> getAllLangs();
}
