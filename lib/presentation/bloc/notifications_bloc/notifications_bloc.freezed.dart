// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationsEvent()';
  }
}

/// @nodoc
class $NotificationsEventCopyWith<$Res> {
  $NotificationsEventCopyWith(
      NotificationsEvent _, $Res Function(NotificationsEvent) __);
}

/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsListRequested value)? listRequested,
    TResult Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested() when listRequested != null:
        return listRequested(_that);
      case NotificationMarkAsReadRequested() when markAsReadRequested != null:
        return markAsReadRequested(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsListRequested value) listRequested,
    required TResult Function(NotificationMarkAsReadRequested value)
        markAsReadRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested():
        return listRequested(_that);
      case NotificationMarkAsReadRequested():
        return markAsReadRequested(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsListRequested value)? listRequested,
    TResult? Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested() when listRequested != null:
        return listRequested(_that);
      case NotificationMarkAsReadRequested() when markAsReadRequested != null:
        return markAsReadRequested(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String? id)? markAsReadRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested() when listRequested != null:
        return listRequested();
      case NotificationMarkAsReadRequested() when markAsReadRequested != null:
        return markAsReadRequested(_that.id);
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
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String? id) markAsReadRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested():
        return listRequested();
      case NotificationMarkAsReadRequested():
        return markAsReadRequested(_that.id);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String? id)? markAsReadRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsListRequested() when listRequested != null:
        return listRequested();
      case NotificationMarkAsReadRequested() when markAsReadRequested != null:
        return markAsReadRequested(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationsListRequested implements NotificationsEvent {
  const NotificationsListRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsListRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationsEvent.listRequested()';
  }
}

/// @nodoc

class NotificationMarkAsReadRequested implements NotificationsEvent {
  const NotificationMarkAsReadRequested({this.id});

  final String? id;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationMarkAsReadRequestedCopyWith<NotificationMarkAsReadRequested>
      get copyWith => _$NotificationMarkAsReadRequestedCopyWithImpl<
          NotificationMarkAsReadRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationMarkAsReadRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'NotificationsEvent.markAsReadRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $NotificationMarkAsReadRequestedCopyWith<$Res>
    implements $NotificationsEventCopyWith<$Res> {
  factory $NotificationMarkAsReadRequestedCopyWith(
          NotificationMarkAsReadRequested value,
          $Res Function(NotificationMarkAsReadRequested) _then) =
      _$NotificationMarkAsReadRequestedCopyWithImpl;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$NotificationMarkAsReadRequestedCopyWithImpl<$Res>
    implements $NotificationMarkAsReadRequestedCopyWith<$Res> {
  _$NotificationMarkAsReadRequestedCopyWithImpl(this._self, this._then);

  final NotificationMarkAsReadRequested _self;
  final $Res Function(NotificationMarkAsReadRequested) _then;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
  }) {
    return _then(NotificationMarkAsReadRequested(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$NotificationsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationsState()';
  }
}

/// @nodoc
class $NotificationsStateCopyWith<$Res> {
  $NotificationsStateCopyWith(
      NotificationsState _, $Res Function(NotificationsState) __);
}

/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial() when initial != null:
        return initial(_that);
      case NotificationsLoadingState() when loading != null:
        return loading(_that);
      case GetNotificationsListSuccessState() when success != null:
        return success(_that);
      case NotificationsErrorState() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial():
        return initial(_that);
      case NotificationsLoadingState():
        return loading(_that);
      case GetNotificationsListSuccessState():
        return success(_that);
      case NotificationsErrorState():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial() when initial != null:
        return initial(_that);
      case NotificationsLoadingState() when loading != null:
        return loading(_that);
      case GetNotificationsListSuccessState() when success != null:
        return success(_that);
      case NotificationsErrorState() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial() when initial != null:
        return initial();
      case NotificationsLoadingState() when loading != null:
        return loading();
      case GetNotificationsListSuccessState() when success != null:
        return success(_that.notifications);
      case NotificationsErrorState() when error != null:
        return error(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial():
        return initial();
      case NotificationsLoadingState():
        return loading();
      case GetNotificationsListSuccessState():
        return success(_that.notifications);
      case NotificationsErrorState():
        return error(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationsInitial() when initial != null:
        return initial();
      case NotificationsLoadingState() when loading != null:
        return loading();
      case GetNotificationsListSuccessState() when success != null:
        return success(_that.notifications);
      case NotificationsErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationsInitial implements NotificationsState {
  const NotificationsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }
}

/// @nodoc

class NotificationsLoadingState implements NotificationsState {
  const NotificationsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }
}

/// @nodoc

class GetNotificationsListSuccessState implements NotificationsState {
  const GetNotificationsListSuccessState(
      final List<NotificationsModel> notifications)
      : _notifications = notifications;

  final List<NotificationsModel> _notifications;
  List<NotificationsModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNotificationsListSuccessStateCopyWith<GetNotificationsListSuccessState>
      get copyWith => _$GetNotificationsListSuccessStateCopyWithImpl<
          GetNotificationsListSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNotificationsListSuccessState &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @override
  String toString() {
    return 'NotificationsState.success(notifications: $notifications)';
  }
}

/// @nodoc
abstract mixin class $GetNotificationsListSuccessStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory $GetNotificationsListSuccessStateCopyWith(
          GetNotificationsListSuccessState value,
          $Res Function(GetNotificationsListSuccessState) _then) =
      _$GetNotificationsListSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<NotificationsModel> notifications});
}

/// @nodoc
class _$GetNotificationsListSuccessStateCopyWithImpl<$Res>
    implements $GetNotificationsListSuccessStateCopyWith<$Res> {
  _$GetNotificationsListSuccessStateCopyWithImpl(this._self, this._then);

  final GetNotificationsListSuccessState _self;
  final $Res Function(GetNotificationsListSuccessState) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
  }) {
    return _then(GetNotificationsListSuccessState(
      null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsModel>,
    ));
  }
}

/// @nodoc

class NotificationsErrorState implements NotificationsState {
  const NotificationsErrorState(this.message);

  final String message;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsErrorStateCopyWith<NotificationsErrorState> get copyWith =>
      _$NotificationsErrorStateCopyWithImpl<NotificationsErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NotificationsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NotificationsErrorStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsErrorStateCopyWith(NotificationsErrorState value,
          $Res Function(NotificationsErrorState) _then) =
      _$NotificationsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NotificationsErrorStateCopyWithImpl<$Res>
    implements $NotificationsErrorStateCopyWith<$Res> {
  _$NotificationsErrorStateCopyWithImpl(this._self, this._then);

  final NotificationsErrorState _self;
  final $Res Function(NotificationsErrorState) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NotificationsErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
