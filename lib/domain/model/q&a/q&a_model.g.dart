// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'q&a_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QandAModelImpl _$$QandAModelImplFromJson(Map<String, dynamic> json) =>
    _$QandAModelImpl(
      id: (json['id'] as num).toInt(),
      documentRef: json['documentRef'] as String,
      title: json['title'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      lang: $enumDecode(_$LanguagesEnumMap, json['lang']),
      date: json['date'] as String?,
      author: json['author'] as String?,
      link: json['link'] as String?,
      image: json['image'] as String?,
      source: json['source'] as String?,
      translatedBy: json['translatedBy'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QandAModelImplToJson(_$QandAModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question': instance.question,
      'answer': instance.answer,
      'lang': _$LanguagesEnumMap[instance.lang]!,
      'date': instance.date,
      'author': instance.author,
      'link': instance.link,
      'image': instance.image,
      'source': instance.source,
      'translatedBy': instance.translatedBy,
      'youtubeLink': instance.youtubeLink,
      'tags': instance.tags,
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
