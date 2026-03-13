// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsightComment _$InsightCommentFromJson(Map<String, dynamic> json) =>
    _InsightComment(
      id: json['id'] as String,
      postId: json['postId'] as String,
      displayName: json['displayName'] as String,
      text: json['text'] as String,
      createdAt: _commentDateTimeFromTimestamp(json['createdAt'] as Timestamp),
      status: json['status'] as String? ?? 'published',
    );

Map<String, dynamic> _$InsightCommentToJson(_InsightComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'displayName': instance.displayName,
      'text': instance.text,
      'createdAt': _commentDateTimeToTimestamp(instance.createdAt),
      'status': instance.status,
    };
