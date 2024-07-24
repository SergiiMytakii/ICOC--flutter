// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeVideoImpl _$$YoutubeVideoImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeVideoImpl(
      lang: json['lang'] as String,
      title: json['title'] as String?,
      link: json['link'] as String,
      thumbnail: json['thumbnail'] as String?,
      artist: json['artist'] as String?,
      publishedAt: json['publishedAt'] as String?,
      description: json['description'] as String?,
      playlistId: json['playlistId'] as String?,
    );

Map<String, dynamic> _$$YoutubeVideoImplToJson(_$YoutubeVideoImpl instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'title': instance.title,
      'link': instance.link,
      'thumbnail': instance.thumbnail,
      'artist': instance.artist,
      'publishedAt': instance.publishedAt,
      'description': instance.description,
      'playlistId': instance.playlistId,
    };
