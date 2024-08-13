// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BibleStudyImpl _$$BibleStudyImplFromJson(Map<String, dynamic> json) =>
    _$BibleStudyImpl(
      topic: json['topic'] as String,
      subtopic: json['subtopic'] as String,
      lang: $enumDecode(_$LanguagesEnumMap, json['lang']),
      id: (json['id'] as num).toInt(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BibleStudyImplToJson(_$BibleStudyImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'subtopic': instance.subtopic,
      'lang': _$LanguagesEnumMap[instance.lang]!,
      'id': instance.id,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
  Languages.et: 'et',
  Languages.fr: 'fr',
  Languages.de: 'de',
  Languages.bg: 'bg',
  Languages.it: 'it',
  Languages.lv: 'lv',
  Languages.lt: 'lt',
  Languages.no: 'no',
  Languages.pl: 'pl',
  Languages.ro: 'ro',
  Languages.ru: 'ru',
  Languages.es: 'es',
  Languages.sv: 'sv',
  Languages.uk: 'uk',
  Languages.sk: 'sk',
  Languages.sl: 'sl',
  Languages.fi: 'fi',
  Languages.sq: 'sq',
  Languages.eu: 'eu',
  Languages.be: 'be',
  Languages.bs: 'bs',
  Languages.ca: 'ca',
  Languages.hr: 'hr',
  Languages.cs: 'cs',
  Languages.da: 'da',
  Languages.nl: 'nl',
  Languages.el: 'el',
  Languages.hu: 'hu',
  Languages.ga: 'ga',
  Languages.lb: 'lb',
  Languages.mk: 'mk',
  Languages.pt: 'pt',
  Languages.sr: 'sr',
  Languages.defaultLang: 'defaultLang',
};

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
    };
