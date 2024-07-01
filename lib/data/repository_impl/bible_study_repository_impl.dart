import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/core/repository/bible_study_repository.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: BibleStudyRepository)
class BibleStudyRepositoryImpl extends BibleStudyRepository {
  @override
  Future getBibleStudyList() async {
    final DatabaseServiceFirebase databaseServiceFirebase =
        DatabaseServiceFirebase();
    final QuerySnapshot snapshot =
        await databaseServiceFirebase.getBibleStudies();
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
