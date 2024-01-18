import 'bible_study_firebase_service.dart';
import '../models/bible_study.dart';
import '../../index.dart';

class BibleStudyController extends GetxController {
  QuerySnapshot? bibleStudies;
  RxList<BibleStudy> topics = <BibleStudy>[].obs;
  var log = Logger();
  GetStorage box = GetStorage();
  RxDouble fontSize = 16.0.obs;

  @override
  void onInit() async {
    bibleStudies = await BibleStudyServiceFirebase().bibleStudies;
    topics.value = _listFromSnapshot(bibleStudies!);
    loadFontSize();

    super.onInit();
  }

  List<BibleStudy> _listFromSnapshot(QuerySnapshot snapshot) {
    List<BibleStudy> bibleStudies = snapshot.docs.map((doc) {
      //получаем все уроки как Map
      Map lessons = doc.get('lessons') as Map;
      List<Lesson> less = [];
      //получаем все ключи и собираем их в List, упорядочиваем
      List<int> keys = [];
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
          topic: doc.id, subtopic: doc.get('subtopic'), lessons: less);
    }).toList();
    return bibleStudies;
  }

  void loadFontSize() {
    if (box.read('bible_fontSize') != null)
      fontSize.value = box.read('bible_fontSize');
  }

  altFontSize(double val) {
    fontSize.value = val;
    box.write('bible_fontSize', val);
  }
}
