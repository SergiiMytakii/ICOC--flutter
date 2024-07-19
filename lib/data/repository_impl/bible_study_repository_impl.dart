import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/core/repository/bible_study_repository.dart';
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
      FirebaseCollections.BibleStudy.name,
    );
    final List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return BibleStudy.fromJson(data);
    }).toList();
    return bibleStudies;
  }
}
