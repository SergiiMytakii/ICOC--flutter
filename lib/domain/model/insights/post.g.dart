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
      mediaUrls: json['mediaUrls'] == null
          ? const <String>[]
          : _stringListFromJson(json['mediaUrls'] as List?),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      youtubeId: json['youtubeId'] as String?,
      articleUrl: json['articleUrl'] as String?,
      mediaAspectRatios: json['mediaAspectRatios'] == null
          ? const <double>[]
          : _doubleListFromJson(json['mediaAspectRatios'] as List?),
      author: PostAuthor.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp),
      status: json['status'] as String? ?? 'published',
      allowComments: json['allowComments'] as bool? ?? true,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      commentsCount: (json['commentsCount'] as num?)?.toInt() ?? 0,
      shares: (json['shares'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$PostTypeEnumMap[instance.type]!,
      'language': instance.language,
      'title': instance.title,
      'content': instance.content,
      'mediaUrls': instance.mediaUrls,
      'thumbnailUrl': instance.thumbnailUrl,
      'youtubeId': instance.youtubeId,
      'articleUrl': instance.articleUrl,
      'mediaAspectRatios': instance.mediaAspectRatios,
      'author': instance.author,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'status': instance.status,
      'allowComments': instance.allowComments,
      'likes': instance.likes,
      'commentsCount': instance.commentsCount,
      'shares': instance.shares,
    };

const _$PostTypeEnumMap = {
  PostType.image: 'image',
  PostType.video: 'video',
};
