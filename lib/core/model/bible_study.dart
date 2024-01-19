class BibleStudy {
  String topic;
  String subtopic;
  String lang;
  List<Lesson> lessons;
  BibleStudy(
      {required this.lessons,
      required this.topic,
      required this.subtopic,
      required this.lang});
}

class Lesson {
  int id;
  String title;
  String text;
  Lesson({
    required this.title,
    required this.text,
    required this.id,
  });
}
