import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/core/constants.dart';

part 'bible_study.freezed.dart';
part 'bible_study.g.dart';

@freezed
abstract class BibleStudy with _$BibleStudy {
  @JsonSerializable(explicitToJson: true)
  const factory BibleStudy({
    required String topic,
    required String subtopic,
    required Languages lang,
    required int id,
    required List<Lesson> lessons,
  }) = _BibleStudy;

  factory BibleStudy.fromJson(Map<String, dynamic> json) =>
      _$BibleStudyFromJson(json);

  static const BibleStudy defaultBibleStudy = BibleStudy(
    lessons: [],
    topic: '',
    id: 0,
    subtopic: '',
    lang: Languages.defaultLang,
  );
}

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required int id,
    required String title,
    required String text,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  static const Lesson defaultLesson = Lesson(title: '', text: '', id: 0);
}
