// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsModelImpl _$$NotificationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationsModelImpl(
      id: json['id'] as String,
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationsModelImplToJson(
        _$NotificationsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notifications': instance.notifications.map((e) => e.toJson()).toList(),
      'isRead': instance.isRead,
    };

_$NotificationVersionImpl _$$NotificationVersionImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationVersionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      lang: json['lang'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$NotificationVersionImplToJson(
        _$NotificationVersionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'lang': instance.lang,
      'link': instance.link,
    };
