class BibleStudy {
  String topic;
  String subtopic;

  List<Lesson> lessons;
  BibleStudy({
    required this.lessons,
    required this.topic,
    required this.subtopic,
  });
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
