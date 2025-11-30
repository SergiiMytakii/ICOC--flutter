// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      id: json['id'] as String,
      type: $enumDecode(_$PostTypeEnumMap, json['type']),
      language: json['language'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      articleUrl: json['articleUrl'] as String?,
      author: PostAuthor.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp),
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      shares: (json['shares'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$PostTypeEnumMap[instance.type]!,
      'language': instance.language,
      'title': instance.title,
      'content': instance.content,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'articleUrl': instance.articleUrl,
      'author': instance.author,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'likes': instance.likes,
      'shares': instance.shares,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.video: 'video',
};
