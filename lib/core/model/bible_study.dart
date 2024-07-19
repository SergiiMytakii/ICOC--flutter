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
  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'subtopic': subtopic,
      'lang': lang,
      'id': id,
      'lessons': {
        for (var lesson in lessons) lesson.id.toString(): lesson.toJson()
      },
    };
  }

  factory BibleStudy.fromJson(Map<String, dynamic> json) {
    return BibleStudy(
      lessons: (json['lessons'] as Map<String, dynamic>).entries.map((entry) {
        return Lesson.fromJson(entry.key, entry.value);
      }).toList()
        ..sort((a, b) => a.id.compareTo(b.id)),
      topic: json['topic'] as String,
      id: json['id'] as int,
      subtopic: json['subtopic'] as String,
      lang: json['lang'] as String,
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
    };
  }

  factory Lesson.fromJson(String id, Map<String, dynamic> json) {
    return Lesson(
      id: int.parse(id),
      title: json['title'] as String,
      text: json['text'] as String,
    );
  }
}
