class BibleStudy {
  String topic;
  String subtopic;
  String lang;
  int id;
  List<Lesson> lessons;
  BibleStudy(
      {required this.lessons,
      required this.topic,
      required this.id,
      required this.subtopic,
      required this.lang});
  static BibleStudy defaultBibleStudy =
      BibleStudy(lessons: [], topic: '', id: 0, subtopic: '', lang: 'en');
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
  static Lesson defaultLesson = Lesson(title: '', text: '', id: 0);
}
