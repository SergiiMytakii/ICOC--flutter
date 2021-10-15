import 'package:icoc/index.dart';

class BibleStudy {
  String topic;
  String subtopic;

  List<Lesson> lessons;
  BibleStudy({
    required this.lessons,
    required this.topic,
    required this.subtopic,
  });

  // factory BibleStudy.fromJson(Map<String, dynamic> json) {
  //   return BibleStudy(topic: , lesson: Lesson);
  // }
}

class Lesson {
  String title;
  String text;
  Lesson({
    required this.title,
    required this.text,
  });

//   factory Lesson.fromJson (Map<String, dynamic> json){
// return Lesson(text: json('text'), title: json)
//   }
}
