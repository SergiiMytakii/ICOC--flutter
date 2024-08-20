// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'q&a_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QandAModelImpl _$$QandAModelImplFromJson(Map<String, dynamic> json) =>
    _$QandAModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      lang: json['lang'] as String,
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
      'lang': instance.lang,
      'date': instance.date,
      'author': instance.author,
      'link': instance.link,
      'image': instance.image,
      'source': instance.source,
      'translatedBy': instance.translatedBy,
      'youtubeLink': instance.youtubeLink,
      'tags': instance.tags,
    };
