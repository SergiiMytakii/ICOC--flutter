// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    _NotificationsModel(
      id: json['id'] as String,
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationsModelToJson(_NotificationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notifications': instance.notifications.map((e) => e.toJson()).toList(),
      'isRead': instance.isRead,
    };

_NotificationVersion _$NotificationVersionFromJson(Map<String, dynamic> json) =>
    _NotificationVersion(
      id: json['id'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      lang: json['lang'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$NotificationVersionToJson(
        _NotificationVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'lang': instance.lang,
      'link': instance.link,
    };
