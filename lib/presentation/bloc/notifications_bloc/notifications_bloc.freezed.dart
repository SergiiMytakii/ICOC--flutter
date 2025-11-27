// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String? id) markAsReadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String? id)? markAsReadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String? id)? markAsReadRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsListRequested value) listRequested,
    required TResult Function(NotificationMarkAsReadRequested value)
        markAsReadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsListRequested value)? listRequested,
    TResult? Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsListRequested value)? listRequested,
    TResult Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationsListRequestedImplCopyWith<$Res> {
  factory _$$NotificationsListRequestedImplCopyWith(
          _$NotificationsListRequestedImpl value,
          $Res Function(_$NotificationsListRequestedImpl) then) =
      __$$NotificationsListRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsListRequestedImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$NotificationsListRequestedImpl>
    implements _$$NotificationsListRequestedImplCopyWith<$Res> {
  __$$NotificationsListRequestedImplCopyWithImpl(
      _$NotificationsListRequestedImpl _value,
      $Res Function(_$NotificationsListRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationsListRequestedImpl implements NotificationsListRequested {
  const _$NotificationsListRequestedImpl();

  @override
  String toString() {
    return 'NotificationsEvent.listRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsListRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String? id) markAsReadRequested,
  }) {
    return listRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String? id)? markAsReadRequested,
  }) {
    return listRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String? id)? markAsReadRequested,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsListRequested value) listRequested,
    required TResult Function(NotificationMarkAsReadRequested value)
        markAsReadRequested,
  }) {
    return listRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsListRequested value)? listRequested,
    TResult? Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
  }) {
    return listRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsListRequested value)? listRequested,
    TResult Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested(this);
    }
    return orElse();
  }
}

abstract class NotificationsListRequested implements NotificationsEvent {
  const factory NotificationsListRequested() = _$NotificationsListRequestedImpl;
}

/// @nodoc
abstract class _$$NotificationMarkAsReadRequestedImplCopyWith<$Res> {
  factory _$$NotificationMarkAsReadRequestedImplCopyWith(
          _$NotificationMarkAsReadRequestedImpl value,
          $Res Function(_$NotificationMarkAsReadRequestedImpl) then) =
      __$$NotificationMarkAsReadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$NotificationMarkAsReadRequestedImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$NotificationMarkAsReadRequestedImpl>
    implements _$$NotificationMarkAsReadRequestedImplCopyWith<$Res> {
  __$$NotificationMarkAsReadRequestedImplCopyWithImpl(
      _$NotificationMarkAsReadRequestedImpl _value,
      $Res Function(_$NotificationMarkAsReadRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$NotificationMarkAsReadRequestedImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotificationMarkAsReadRequestedImpl
    implements NotificationMarkAsReadRequested {
  const _$NotificationMarkAsReadRequestedImpl({this.id});

  @override
  final String? id;

  @override
  String toString() {
    return 'NotificationsEvent.markAsReadRequested(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationMarkAsReadRequestedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationMarkAsReadRequestedImplCopyWith<
          _$NotificationMarkAsReadRequestedImpl>
      get copyWith => __$$NotificationMarkAsReadRequestedImplCopyWithImpl<
          _$NotificationMarkAsReadRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String? id) markAsReadRequested,
  }) {
    return markAsReadRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String? id)? markAsReadRequested,
  }) {
    return markAsReadRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String? id)? markAsReadRequested,
    required TResult orElse(),
  }) {
    if (markAsReadRequested != null) {
      return markAsReadRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsListRequested value) listRequested,
    required TResult Function(NotificationMarkAsReadRequested value)
        markAsReadRequested,
  }) {
    return markAsReadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsListRequested value)? listRequested,
    TResult? Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
  }) {
    return markAsReadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsListRequested value)? listRequested,
    TResult Function(NotificationMarkAsReadRequested value)?
        markAsReadRequested,
    required TResult orElse(),
  }) {
    if (markAsReadRequested != null) {
      return markAsReadRequested(this);
    }
    return orElse();
  }
}

abstract class NotificationMarkAsReadRequested implements NotificationsEvent {
  const factory NotificationMarkAsReadRequested({final String? id}) =
      _$NotificationMarkAsReadRequestedImpl;

  String? get id;
  @JsonKey(ignore: true)
  _$$NotificationMarkAsReadRequestedImplCopyWith<
          _$NotificationMarkAsReadRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationsInitialImplCopyWith<$Res> {
  factory _$$NotificationsInitialImplCopyWith(_$NotificationsInitialImpl value,
          $Res Function(_$NotificationsInitialImpl) then) =
      __$$NotificationsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsInitialImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsInitialImpl>
    implements _$$NotificationsInitialImplCopyWith<$Res> {
  __$$NotificationsInitialImplCopyWithImpl(_$NotificationsInitialImpl _value,
      $Res Function(_$NotificationsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationsInitialImpl implements NotificationsInitial {
  const _$NotificationsInitialImpl();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NotificationsInitial implements NotificationsState {
  const factory NotificationsInitial() = _$NotificationsInitialImpl;
}

/// @nodoc
abstract class _$$NotificationsLoadingStateImplCopyWith<$Res> {
  factory _$$NotificationsLoadingStateImplCopyWith(
          _$NotificationsLoadingStateImpl value,
          $Res Function(_$NotificationsLoadingStateImpl) then) =
      __$$NotificationsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsLoadingStateImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res,
        _$NotificationsLoadingStateImpl>
    implements _$$NotificationsLoadingStateImplCopyWith<$Res> {
  __$$NotificationsLoadingStateImplCopyWithImpl(
      _$NotificationsLoadingStateImpl _value,
      $Res Function(_$NotificationsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationsLoadingStateImpl implements NotificationsLoadingState {
  const _$NotificationsLoadingStateImpl();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotificationsLoadingState implements NotificationsState {
  const factory NotificationsLoadingState() = _$NotificationsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetNotificationsListSuccessStateImplCopyWith<$Res> {
  factory _$$GetNotificationsListSuccessStateImplCopyWith(
          _$GetNotificationsListSuccessStateImpl value,
          $Res Function(_$GetNotificationsListSuccessStateImpl) then) =
      __$$GetNotificationsListSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationsModel> notifications});
}

/// @nodoc
class __$$GetNotificationsListSuccessStateImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res,
        _$GetNotificationsListSuccessStateImpl>
    implements _$$GetNotificationsListSuccessStateImplCopyWith<$Res> {
  __$$GetNotificationsListSuccessStateImplCopyWithImpl(
      _$GetNotificationsListSuccessStateImpl _value,
      $Res Function(_$GetNotificationsListSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$GetNotificationsListSuccessStateImpl(
      null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsModel>,
    ));
  }
}

/// @nodoc

class _$GetNotificationsListSuccessStateImpl
    implements GetNotificationsListSuccessState {
  const _$GetNotificationsListSuccessStateImpl(
      final List<NotificationsModel> notifications)
      : _notifications = notifications;

  final List<NotificationsModel> _notifications;
  @override
  List<NotificationsModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsState.success(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsListSuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsListSuccessStateImplCopyWith<
          _$GetNotificationsListSuccessStateImpl>
      get copyWith => __$$GetNotificationsListSuccessStateImplCopyWithImpl<
          _$GetNotificationsListSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) {
    return success(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsListSuccessState implements NotificationsState {
  const factory GetNotificationsListSuccessState(
          final List<NotificationsModel> notifications) =
      _$GetNotificationsListSuccessStateImpl;

  List<NotificationsModel> get notifications;
  @JsonKey(ignore: true)
  _$$GetNotificationsListSuccessStateImplCopyWith<
          _$GetNotificationsListSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsErrorStateImplCopyWith<$Res> {
  factory _$$NotificationsErrorStateImplCopyWith(
          _$NotificationsErrorStateImpl value,
          $Res Function(_$NotificationsErrorStateImpl) then) =
      __$$NotificationsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotificationsErrorStateImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res,
        _$NotificationsErrorStateImpl>
    implements _$$NotificationsErrorStateImplCopyWith<$Res> {
  __$$NotificationsErrorStateImplCopyWithImpl(
      _$NotificationsErrorStateImpl _value,
      $Res Function(_$NotificationsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotificationsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationsErrorStateImpl implements NotificationsErrorState {
  const _$NotificationsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsErrorStateImplCopyWith<_$NotificationsErrorStateImpl>
      get copyWith => __$$NotificationsErrorStateImplCopyWithImpl<
          _$NotificationsErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationsModel> notifications) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationsModel> notifications)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationsModel> notifications)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoadingState value) loading,
    required TResult Function(GetNotificationsListSuccessState value) success,
    required TResult Function(NotificationsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoadingState value)? loading,
    TResult? Function(GetNotificationsListSuccessState value)? success,
    TResult? Function(NotificationsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoadingState value)? loading,
    TResult Function(GetNotificationsListSuccessState value)? success,
    TResult Function(NotificationsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NotificationsErrorState implements NotificationsState {
  const factory NotificationsErrorState(final String message) =
      _$NotificationsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$NotificationsErrorStateImplCopyWith<_$NotificationsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
