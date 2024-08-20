import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/domain/data_sources/remote/ai_data_source.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/domain/repository/q&a_repository.dart';

@dev
@prod
@Injectable(as: QandARepository)
class QandARepositoryImpl extends QandARepository {
  final FirebaseDataSource firebaseDataSource;
  final AiDataSource aiDataSource;
  QandARepositoryImpl(
    this.firebaseDataSource,
    this.aiDataSource,
  );
  @override
  Future<List<QandAModel>> getArticles({Languages? lang, String? query}) async {
    final QuerySnapshot snapshot = await firebaseDataSource.getFromFirebase(
        FirebaseCollections.QandA.name,
        filters: lang != null ? {'lang': lang.name} : null,
        search: query != null ? {'id': query} : null,
        orderBy: {'id': true});
    final List<QandAModel> articles = snapshot.docs.map(
      (doc) {
        final article = QandAModel.fromJson(doc.data() as Map<String, dynamic>);

        return article;
      },
    ).toList();

    return articles;
  }

  @override
  Future<List<Languages>> getAllLangs() async {
    final QuerySnapshot snapshot = await firebaseDataSource.getFromFirebase(
      FirebaseCollections.QandALangs.name,
    );
    final List<Languages> langs = [];

    snapshot.docs.forEach((doc) {
      final langsMap = doc.data() as Map<String, dynamic>;
      print(langsMap.toString());
      for (final lang in langsMap['QandAlangs']) {
        langs.add(convertLanguagesEnum(lang));
      }
    });

    return langs;
  }
}
