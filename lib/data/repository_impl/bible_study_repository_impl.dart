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
    final List<BibleStudy> topics = _listFromSnapshot(snapshot);
    return topics;
  }
}

List<BibleStudy> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
    //получаем все уроки как Map
    final Map lessons = doc.get('lessons') as Map;
    final List<Lesson> less = [];

    lessons.forEach((key, lesson) {
      less.add(Lesson(
          id: int.parse(key),
          title: lessons[key]['title'] ?? lessons[key]['titile'],
          text: lessons[key]['text']));
    });
    less.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    return BibleStudy(
        topic: doc.id,
        id: doc.get('id'),
        subtopic: doc.get('subtopic'),
        lessons: less,
        lang: doc.get('lang'));
  }).toList();
  return bibleStudies;
}
