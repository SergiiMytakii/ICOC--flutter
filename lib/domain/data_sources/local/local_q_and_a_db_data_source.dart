import 'package:icoc/domain/model/q&a_model.dart';

abstract class LocalQandAdB {
  Future<List<QandAModel>> getAnsvers();
}
