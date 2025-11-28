// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsModel {
  String get id;
  set id(String value);
  List<NotificationVersion> get notifications;
  set notifications(List<NotificationVersion> value);
  bool get isRead;
  set isRead(bool value);

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      _$NotificationsModelCopyWithImpl<NotificationsModel>(
          this as NotificationsModel, _$identity);

  /// Serializes this NotificationsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'NotificationsModel(id: $id, notifications: $notifications, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
          NotificationsModel value, $Res Function(NotificationsModel) _then) =
      _$NotificationsModelCopyWithImpl;
  @useResult
  $Res call({String id, List<NotificationVersion> notifications, bool isRead});
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._self, this._then);

  final NotificationsModel _self;
  final $Res Function(NotificationsModel) _then;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifications = null,
    Object? isRead = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationVersion>,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationsModel].
extension NotificationsModelPatterns on NotificationsModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, List<NotificationVersion> notifications, bool isRead)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that.id, _that.notifications, _that.isRead);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, List<NotificationVersion> notifications, bool isRead)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel():
        return $default(_that.id, _that.notifications, _that.isRead);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, List<NotificationVersion> notifications, bool isRead)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that.id, _that.notifications, _that.isRead);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _NotificationsModel extends NotificationsModel {
  _NotificationsModel(
      {required this.id, required this.notifications, this.isRead = false})
      : super._();
  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  @override
  String id;
  @override
  List<NotificationVersion> notifications;
  @override
  @JsonKey()
  bool isRead;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsModelCopyWith<_NotificationsModel> get copyWith =>
      __$NotificationsModelCopyWithImpl<_NotificationsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationsModelToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'NotificationsModel(id: $id, notifications: $notifications, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsModelCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$NotificationsModelCopyWith(
          _NotificationsModel value, $Res Function(_NotificationsModel) _then) =
      __$NotificationsModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, List<NotificationVersion> notifications, bool isRead});
}

/// @nodoc
class __$NotificationsModelCopyWithImpl<$Res>
    implements _$NotificationsModelCopyWith<$Res> {
  __$NotificationsModelCopyWithImpl(this._self, this._then);

  final _NotificationsModel _self;
  final $Res Function(_NotificationsModel) _then;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? notifications = null,
    Object? isRead = null,
  }) {
    return _then(_NotificationsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationVersion>,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$NotificationVersion {
  String get id;
  String get title;
  String get text;
  String get lang;
  String? get link;

  /// Create a copy of NotificationVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationVersionCopyWith<NotificationVersion> get copyWith =>
      _$NotificationVersionCopyWithImpl<NotificationVersion>(
          this as NotificationVersion, _$identity);

  /// Serializes this NotificationVersion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text, lang, link);

  @override
  String toString() {
    return 'NotificationVersion(id: $id, title: $title, text: $text, lang: $lang, link: $link)';
  }
}

/// @nodoc
abstract mixin class $NotificationVersionCopyWith<$Res> {
  factory $NotificationVersionCopyWith(
          NotificationVersion value, $Res Function(NotificationVersion) _then) =
      _$NotificationVersionCopyWithImpl;
  @useResult
  $Res call({String id, String title, String text, String lang, String? link});
}

/// @nodoc
class _$NotificationVersionCopyWithImpl<$Res>
    implements $NotificationVersionCopyWith<$Res> {
  _$NotificationVersionCopyWithImpl(this._self, this._then);

  final NotificationVersion _self;
  final $Res Function(NotificationVersion) _then;

  /// Create a copy of NotificationVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? lang = null,
    Object? link = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationVersion].
extension NotificationVersionPatterns on NotificationVersion {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationVersion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationVersion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationVersion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, String title, String text, String lang, String? link)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion() when $default != null:
        return $default(
            _that.id, _that.title, _that.text, _that.lang, _that.link);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, String title, String text, String lang, String? link)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion():
        return $default(
            _that.id, _that.title, _that.text, _that.lang, _that.link);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, String title, String text, String lang, String? link)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationVersion() when $default != null:
        return $default(
            _that.id, _that.title, _that.text, _that.lang, _that.link);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationVersion extends NotificationVersion {
  const _NotificationVersion(
      {required this.id,
      required this.title,
      required this.text,
      required this.lang,
      this.link})
      : super._();
  factory _NotificationVersion.fromJson(Map<String, dynamic> json) =>
      _$NotificationVersionFromJson(json);

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

  /// Create a copy of NotificationVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationVersionCopyWith<_NotificationVersion> get copyWith =>
      __$NotificationVersionCopyWithImpl<_NotificationVersion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationVersionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text, lang, link);

  @override
  String toString() {
    return 'NotificationVersion(id: $id, title: $title, text: $text, lang: $lang, link: $link)';
  }
}

/// @nodoc
abstract mixin class _$NotificationVersionCopyWith<$Res>
    implements $NotificationVersionCopyWith<$Res> {
  factory _$NotificationVersionCopyWith(_NotificationVersion value,
          $Res Function(_NotificationVersion) _then) =
      __$NotificationVersionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, String text, String lang, String? link});
}

/// @nodoc
class __$NotificationVersionCopyWithImpl<$Res>
    implements _$NotificationVersionCopyWith<$Res> {
  __$NotificationVersionCopyWithImpl(this._self, this._then);

  final _NotificationVersion _self;
  final $Res Function(_NotificationVersion) _then;

  /// Create a copy of NotificationVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? lang = null,
    Object? link = freezed,
  }) {
    return _then(_NotificationVersion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
