import 'package:icoc/bible_study/logic/bible_study_firebase_service.dart';
import 'package:icoc/bible_study/models/bible_study.dart';
import 'package:icoc/index.dart';

class BibleStudyController extends GetxController {
  QuerySnapshot? bibleStudies;
  RxList<BibleStudy> topics = <BibleStudy>[].obs;
  var log = Logger();

  @override
  void onInit() async {
    bibleStudies = await BibleStudyServiceFirebase().bibleStudies;
    topics.value = _listFromSnapshot(bibleStudies!);
    // print(bibleStudies.docs.first.data());
    //log.d(FP.first.topic);

    super.onInit();
  }

  List<BibleStudy> _listFromSnapshot(QuerySnapshot snapshot) {
    List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
      Map lessons = doc.get('lessons') as Map;
      List<Lesson> less = [];
      List keys = lessons.keys.toList();
      keys.forEach((key) {
        less.add(Lesson(title: key, text: lessons[key]));
      });
      log.d(lessons);
      return BibleStudy(
          topic: doc.id, subtopic: doc.get('subtopic'), lessons: less);
    }).toList();
    return bibleStudies;
  }
}
