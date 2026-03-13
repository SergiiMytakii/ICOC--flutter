import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_model.freezed.dart';
part 'notifications_model.g.dart';

@unfreezed
abstract class NotificationsModel with _$NotificationsModel {
  @JsonSerializable(explicitToJson: true)
  factory NotificationsModel({
    required String id,
    required List<NotificationVersion> notifications,
    @Default(false) bool isRead,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  const NotificationsModel._();

  factory NotificationsModel.defaultNotification() => NotificationsModel(
        id: 'initial',
        notifications: [
          const NotificationVersion(
            title: '',
            text: '',
            id: 'initial',
            lang: 'en',
          ),
        ],
      );

  NotificationsModel addVersion({
    required String title,
    required String description,
    required String text,
    String? url,
    required String lang,
  }) {
    final newNotification = NotificationVersion(
      title: title,
      text: text,
      id: notifications.length.toString(),
      lang: lang,
    );
    return copyWith(
      notifications: [...notifications, newNotification],
    );
  }

  List<String> getLanguages() {
    return notifications
        .map((notification) => notification.lang)
        .toSet()
        .toList();
  }
}

@freezed
abstract class NotificationVersion with _$NotificationVersion {
  const factory NotificationVersion({
    required String id,
    required String title,
    required String text,
    required String lang,
    String? link,
  }) = _NotificationVersion;

  factory NotificationVersion.fromJson(Map<String, dynamic> json) =>
      _$NotificationVersionFromJson(json);

  const NotificationVersion._();
}
