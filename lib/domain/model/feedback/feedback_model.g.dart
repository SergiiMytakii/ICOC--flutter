// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    _FeedbackModel(
      id: json['id'] as String,
      text: json['text'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$FeedbackModelToJson(_FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'name': instance.name,
      'date': instance.date,
      'comment': instance.comment,
    };
