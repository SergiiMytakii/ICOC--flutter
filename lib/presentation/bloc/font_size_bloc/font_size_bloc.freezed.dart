// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'font_size_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FontSizeEvent {
  double? get fontSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? fontSize) requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? fontSize)? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? fontSize)? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FontSizeRequested value) requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeRequested value)? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeRequested value)? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FontSizeEventCopyWith<FontSizeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontSizeEventCopyWith<$Res> {
  factory $FontSizeEventCopyWith(
          FontSizeEvent value, $Res Function(FontSizeEvent) then) =
      _$FontSizeEventCopyWithImpl<$Res, FontSizeEvent>;
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class _$FontSizeEventCopyWithImpl<$Res, $Val extends FontSizeEvent>
    implements $FontSizeEventCopyWith<$Res> {
  _$FontSizeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(_value.copyWith(
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FontSizeRequestedImplCopyWith<$Res>
    implements $FontSizeEventCopyWith<$Res> {
  factory _$$FontSizeRequestedImplCopyWith(_$FontSizeRequestedImpl value,
          $Res Function(_$FontSizeRequestedImpl) then) =
      __$$FontSizeRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class __$$FontSizeRequestedImplCopyWithImpl<$Res>
    extends _$FontSizeEventCopyWithImpl<$Res, _$FontSizeRequestedImpl>
    implements _$$FontSizeRequestedImplCopyWith<$Res> {
  __$$FontSizeRequestedImplCopyWithImpl(_$FontSizeRequestedImpl _value,
      $Res Function(_$FontSizeRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(_$FontSizeRequestedImpl(
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FontSizeRequestedImpl implements FontSizeRequested {
  const _$FontSizeRequestedImpl({this.fontSize});

  @override
  final double? fontSize;

  @override
  String toString() {
    return 'FontSizeEvent.requested(fontSize: $fontSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FontSizeRequestedImpl &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize);

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FontSizeRequestedImplCopyWith<_$FontSizeRequestedImpl> get copyWith =>
      __$$FontSizeRequestedImplCopyWithImpl<_$FontSizeRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? fontSize) requested,
  }) {
    return requested(fontSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? fontSize)? requested,
  }) {
    return requested?.call(fontSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? fontSize)? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested(fontSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FontSizeRequested value) requested,
  }) {
    return requested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeRequested value)? requested,
  }) {
    return requested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeRequested value)? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested(this);
    }
    return orElse();
  }
}

abstract class FontSizeRequested implements FontSizeEvent {
  const factory FontSizeRequested({final double? fontSize}) =
      _$FontSizeRequestedImpl;

  @override
  double? get fontSize;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FontSizeRequestedImplCopyWith<_$FontSizeRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FontSizeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? fontSize) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? fontSize)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? fontSize)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FontSizeInitial value) initial,
    required TResult Function(FontSizeSuccess value) success,
    required TResult Function(FontSizeErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeInitial value)? initial,
    TResult? Function(FontSizeSuccess value)? success,
    TResult? Function(FontSizeErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeInitial value)? initial,
    TResult Function(FontSizeSuccess value)? success,
    TResult Function(FontSizeErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontSizeStateCopyWith<$Res> {
  factory $FontSizeStateCopyWith(
          FontSizeState value, $Res Function(FontSizeState) then) =
      _$FontSizeStateCopyWithImpl<$Res, FontSizeState>;
}

/// @nodoc
class _$FontSizeStateCopyWithImpl<$Res, $Val extends FontSizeState>
    implements $FontSizeStateCopyWith<$Res> {
  _$FontSizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FontSizeInitialImplCopyWith<$Res> {
  factory _$$FontSizeInitialImplCopyWith(_$FontSizeInitialImpl value,
          $Res Function(_$FontSizeInitialImpl) then) =
      __$$FontSizeInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FontSizeInitialImplCopyWithImpl<$Res>
    extends _$FontSizeStateCopyWithImpl<$Res, _$FontSizeInitialImpl>
    implements _$$FontSizeInitialImplCopyWith<$Res> {
  __$$FontSizeInitialImplCopyWithImpl(
      _$FontSizeInitialImpl _value, $Res Function(_$FontSizeInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FontSizeInitialImpl implements FontSizeInitial {
  const _$FontSizeInitialImpl();

  @override
  String toString() {
    return 'FontSizeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FontSizeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? fontSize) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? fontSize)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? fontSize)? success,
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
    required TResult Function(FontSizeInitial value) initial,
    required TResult Function(FontSizeSuccess value) success,
    required TResult Function(FontSizeErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeInitial value)? initial,
    TResult? Function(FontSizeSuccess value)? success,
    TResult? Function(FontSizeErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeInitial value)? initial,
    TResult Function(FontSizeSuccess value)? success,
    TResult Function(FontSizeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FontSizeInitial implements FontSizeState {
  const factory FontSizeInitial() = _$FontSizeInitialImpl;
}

/// @nodoc
abstract class _$$FontSizeSuccessImplCopyWith<$Res> {
  factory _$$FontSizeSuccessImplCopyWith(_$FontSizeSuccessImpl value,
          $Res Function(_$FontSizeSuccessImpl) then) =
      __$$FontSizeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class __$$FontSizeSuccessImplCopyWithImpl<$Res>
    extends _$FontSizeStateCopyWithImpl<$Res, _$FontSizeSuccessImpl>
    implements _$$FontSizeSuccessImplCopyWith<$Res> {
  __$$FontSizeSuccessImplCopyWithImpl(
      _$FontSizeSuccessImpl _value, $Res Function(_$FontSizeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(_$FontSizeSuccessImpl(
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FontSizeSuccessImpl implements FontSizeSuccess {
  const _$FontSizeSuccessImpl({required this.fontSize});

  @override
  final double? fontSize;

  @override
  String toString() {
    return 'FontSizeState.success(fontSize: $fontSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FontSizeSuccessImpl &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize);

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FontSizeSuccessImplCopyWith<_$FontSizeSuccessImpl> get copyWith =>
      __$$FontSizeSuccessImplCopyWithImpl<_$FontSizeSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? fontSize) success,
    required TResult Function(String message) error,
  }) {
    return success(fontSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? fontSize)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(fontSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? fontSize)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(fontSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FontSizeInitial value) initial,
    required TResult Function(FontSizeSuccess value) success,
    required TResult Function(FontSizeErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeInitial value)? initial,
    TResult? Function(FontSizeSuccess value)? success,
    TResult? Function(FontSizeErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeInitial value)? initial,
    TResult Function(FontSizeSuccess value)? success,
    TResult Function(FontSizeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FontSizeSuccess implements FontSizeState {
  const factory FontSizeSuccess({required final double? fontSize}) =
      _$FontSizeSuccessImpl;

  double? get fontSize;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FontSizeSuccessImplCopyWith<_$FontSizeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FontSizeErrorStateImplCopyWith<$Res> {
  factory _$$FontSizeErrorStateImplCopyWith(_$FontSizeErrorStateImpl value,
          $Res Function(_$FontSizeErrorStateImpl) then) =
      __$$FontSizeErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FontSizeErrorStateImplCopyWithImpl<$Res>
    extends _$FontSizeStateCopyWithImpl<$Res, _$FontSizeErrorStateImpl>
    implements _$$FontSizeErrorStateImplCopyWith<$Res> {
  __$$FontSizeErrorStateImplCopyWithImpl(_$FontSizeErrorStateImpl _value,
      $Res Function(_$FontSizeErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FontSizeErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FontSizeErrorStateImpl implements FontSizeErrorState {
  const _$FontSizeErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FontSizeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FontSizeErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FontSizeErrorStateImplCopyWith<_$FontSizeErrorStateImpl> get copyWith =>
      __$$FontSizeErrorStateImplCopyWithImpl<_$FontSizeErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? fontSize) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? fontSize)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? fontSize)? success,
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
    required TResult Function(FontSizeInitial value) initial,
    required TResult Function(FontSizeSuccess value) success,
    required TResult Function(FontSizeErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FontSizeInitial value)? initial,
    TResult? Function(FontSizeSuccess value)? success,
    TResult? Function(FontSizeErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FontSizeInitial value)? initial,
    TResult Function(FontSizeSuccess value)? success,
    TResult Function(FontSizeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FontSizeErrorState implements FontSizeState {
  const factory FontSizeErrorState(final String message) =
      _$FontSizeErrorStateImpl;

  String get message;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FontSizeErrorStateImplCopyWith<_$FontSizeErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
