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
        orderBy: 'lessons',
        descending: true);
    final List<BibleStudy> topics = _listFromSnapshot(snapshot);
    return topics;
  }
}

List<BibleStudy> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
    //получаем все уроки как Map
    final Map lessons = doc.get('lessons') as Map;
    final List<Lesson> less = [];
    //получаем все ключи и собираем их в List, упорядочиваем
    final List<int> keys = [];
    lessons.keys.forEach((key) {
      keys.add(int.parse(key));
    });
    keys.sort();
    keys.forEach((key) {
      less.add(Lesson(
          id: key,
          title: lessons[key.toString()]['title'] ??
              lessons[key.toString()]['titile'],
          text: lessons[key.toString()]['text']));
    });
    return BibleStudy(
        topic: doc.id,
        subtopic: doc.get('subtopic'),
        lessons: less,
        lang: doc.get('lang'));
  }).toList();
  return bibleStudies;
}
