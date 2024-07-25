// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) {
  return _NotificationsModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationsModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  List<NotificationVersion> get notifications =>
      throw _privateConstructorUsedError;
  set notifications(List<NotificationVersion> value) =>
      throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  set isRead(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
          NotificationsModel value, $Res Function(NotificationsModel) then) =
      _$NotificationsModelCopyWithImpl<$Res, NotificationsModel>;
  @useResult
  $Res call({String id, List<NotificationVersion> notifications, bool isRead});
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res, $Val extends NotificationsModel>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifications = null,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationVersion>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsModelImplCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$$NotificationsModelImplCopyWith(_$NotificationsModelImpl value,
          $Res Function(_$NotificationsModelImpl) then) =
      __$$NotificationsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<NotificationVersion> notifications, bool isRead});
}

/// @nodoc
class __$$NotificationsModelImplCopyWithImpl<$Res>
    extends _$NotificationsModelCopyWithImpl<$Res, _$NotificationsModelImpl>
    implements _$$NotificationsModelImplCopyWith<$Res> {
  __$$NotificationsModelImplCopyWithImpl(_$NotificationsModelImpl _value,
      $Res Function(_$NotificationsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifications = null,
    Object? isRead = null,
  }) {
    return _then(_$NotificationsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationVersion>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationsModelImpl extends _NotificationsModel {
  _$NotificationsModelImpl(
      {required this.id, required this.notifications, this.isRead = false})
      : super._();

  factory _$NotificationsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsModelImplFromJson(json);

  @override
  String id;
  @override
  List<NotificationVersion> notifications;
  @override
  @JsonKey()
  bool isRead;

  @override
  String toString() {
    return 'NotificationsModel(id: $id, notifications: $notifications, isRead: $isRead)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsModelImplCopyWith<_$NotificationsModelImpl> get copyWith =>
      __$$NotificationsModelImplCopyWithImpl<_$NotificationsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationsModel extends NotificationsModel {
  factory _NotificationsModel(
      {required String id,
      required List<NotificationVersion> notifications,
      bool isRead}) = _$NotificationsModelImpl;
  _NotificationsModel._() : super._();

  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =
      _$NotificationsModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  List<NotificationVersion> get notifications;
  set notifications(List<NotificationVersion> value);
  @override
  bool get isRead;
  set isRead(bool value);
  @override
  @JsonKey(ignore: true)
  _$$NotificationsModelImplCopyWith<_$NotificationsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationVersion _$NotificationVersionFromJson(Map<String, dynamic> json) {
  return _NotificationVersion.fromJson(json);
}

/// @nodoc
mixin _$NotificationVersion {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationVersionCopyWith<NotificationVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationVersionCopyWith<$Res> {
  factory $NotificationVersionCopyWith(
          NotificationVersion value, $Res Function(NotificationVersion) then) =
      _$NotificationVersionCopyWithImpl<$Res, NotificationVersion>;
  @useResult
  $Res call({String id, String title, String text, String lang, String? link});
}

/// @nodoc
class _$NotificationVersionCopyWithImpl<$Res, $Val extends NotificationVersion>
    implements $NotificationVersionCopyWith<$Res> {
  _$NotificationVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? lang = null,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationVersionImplCopyWith<$Res>
    implements $NotificationVersionCopyWith<$Res> {
  factory _$$NotificationVersionImplCopyWith(_$NotificationVersionImpl value,
          $Res Function(_$NotificationVersionImpl) then) =
      __$$NotificationVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String text, String lang, String? link});
}

/// @nodoc
class __$$NotificationVersionImplCopyWithImpl<$Res>
    extends _$NotificationVersionCopyWithImpl<$Res, _$NotificationVersionImpl>
    implements _$$NotificationVersionImplCopyWith<$Res> {
  __$$NotificationVersionImplCopyWithImpl(_$NotificationVersionImpl _value,
      $Res Function(_$NotificationVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? lang = null,
    Object? link = freezed,
  }) {
    return _then(_$NotificationVersionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationVersionImpl extends _NotificationVersion {
  const _$NotificationVersionImpl(
      {required this.id,
      required this.title,
      required this.text,
      required this.lang,
      this.link})
      : super._();

  factory _$NotificationVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationVersionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String text;
  @override
  final String lang;
  @override
  final String? link;

  @override
  String toString() {
    return 'NotificationVersion(id: $id, title: $title, text: $text, lang: $lang, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationVersionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text, lang, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationVersionImplCopyWith<_$NotificationVersionImpl> get copyWith =>
      __$$NotificationVersionImplCopyWithImpl<_$NotificationVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationVersionImplToJson(
      this,
    );
  }
}

abstract class _NotificationVersion extends NotificationVersion {
  const factory _NotificationVersion(
      {required final String id,
      required final String title,
      required final String text,
      required final String lang,
      final String? link}) = _$NotificationVersionImpl;
  const _NotificationVersion._() : super._();

  factory _NotificationVersion.fromJson(Map<String, dynamic> json) =
      _$NotificationVersionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get text;
  @override
  String get lang;
  @override
  String? get link;
  @override
  @JsonKey(ignore: true)
  _$$NotificationVersionImplCopyWith<_$NotificationVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
