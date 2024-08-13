import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';
import 'package:icoc/domain/repository/bible_study_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: BibleStudyRepository)
class BibleStudyRepositoryImpl extends BibleStudyRepository {
  final FirebaseDataSource firebaseDataSource;

  BibleStudyRepositoryImpl({required this.firebaseDataSource});
  @override
  Future getBibleStudyList() async {
    final QuerySnapshot snapshot = await firebaseDataSource.getFromFirebase(
      FirebaseCollections.BibleStudyV2.name,
    );
    final List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return BibleStudy.fromJson(data);
    }).toList();
    return bibleStudies;
  }
}
