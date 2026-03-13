// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'font_size_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FontSizeEvent {
  double? get fontSize;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FontSizeEventCopyWith<FontSizeEvent> get copyWith =>
      _$FontSizeEventCopyWithImpl<FontSizeEvent>(
          this as FontSizeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FontSizeEvent &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize);

  @override
  String toString() {
    return 'FontSizeEvent(fontSize: $fontSize)';
  }
}

/// @nodoc
abstract mixin class $FontSizeEventCopyWith<$Res> {
  factory $FontSizeEventCopyWith(
          FontSizeEvent value, $Res Function(FontSizeEvent) _then) =
      _$FontSizeEventCopyWithImpl;
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class _$FontSizeEventCopyWithImpl<$Res>
    implements $FontSizeEventCopyWith<$Res> {
  _$FontSizeEventCopyWithImpl(this._self, this._then);

  final FontSizeEvent _self;
  final $Res Function(FontSizeEvent) _then;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(_self.copyWith(
      fontSize: freezed == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FontSizeEvent].
extension FontSizeEventPatterns on FontSizeEvent {
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
    TResult Function(FontSizeRequested value)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested() when requested != null:
        return requested(_that);
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
    required TResult Function(FontSizeRequested value) requested,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested():
        return requested(_that);
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
    TResult? Function(FontSizeRequested value)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested() when requested != null:
        return requested(_that);
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
    TResult Function(double? fontSize)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested() when requested != null:
        return requested(_that.fontSize);
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
    required TResult Function(double? fontSize) requested,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested():
        return requested(_that.fontSize);
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
    TResult? Function(double? fontSize)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeRequested() when requested != null:
        return requested(_that.fontSize);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FontSizeRequested implements FontSizeEvent {
  const FontSizeRequested({this.fontSize});

  @override
  final double? fontSize;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FontSizeRequestedCopyWith<FontSizeRequested> get copyWith =>
      _$FontSizeRequestedCopyWithImpl<FontSizeRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FontSizeRequested &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize);

  @override
  String toString() {
    return 'FontSizeEvent.requested(fontSize: $fontSize)';
  }
}

/// @nodoc
abstract mixin class $FontSizeRequestedCopyWith<$Res>
    implements $FontSizeEventCopyWith<$Res> {
  factory $FontSizeRequestedCopyWith(
          FontSizeRequested value, $Res Function(FontSizeRequested) _then) =
      _$FontSizeRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class _$FontSizeRequestedCopyWithImpl<$Res>
    implements $FontSizeRequestedCopyWith<$Res> {
  _$FontSizeRequestedCopyWithImpl(this._self, this._then);

  final FontSizeRequested _self;
  final $Res Function(FontSizeRequested) _then;

  /// Create a copy of FontSizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(FontSizeRequested(
      fontSize: freezed == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$FontSizeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FontSizeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FontSizeState()';
  }
}

/// @nodoc
class $FontSizeStateCopyWith<$Res> {
  $FontSizeStateCopyWith(FontSizeState _, $Res Function(FontSizeState) __);
}

/// Adds pattern-matching-related methods to [FontSizeState].
extension FontSizeStatePatterns on FontSizeState {
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
    TResult Function(FontSizeInitial value)? initial,
    TResult Function(FontSizeSuccess value)? success,
    TResult Function(FontSizeErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial() when initial != null:
        return initial(_that);
      case FontSizeSuccess() when success != null:
        return success(_that);
      case FontSizeErrorState() when error != null:
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
    required TResult Function(FontSizeInitial value) initial,
    required TResult Function(FontSizeSuccess value) success,
    required TResult Function(FontSizeErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial():
        return initial(_that);
      case FontSizeSuccess():
        return success(_that);
      case FontSizeErrorState():
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
    TResult? Function(FontSizeInitial value)? initial,
    TResult? Function(FontSizeSuccess value)? success,
    TResult? Function(FontSizeErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial() when initial != null:
        return initial(_that);
      case FontSizeSuccess() when success != null:
        return success(_that);
      case FontSizeErrorState() when error != null:
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
    TResult Function(double? fontSize)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial() when initial != null:
        return initial();
      case FontSizeSuccess() when success != null:
        return success(_that.fontSize);
      case FontSizeErrorState() when error != null:
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
    required TResult Function(double? fontSize) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial():
        return initial();
      case FontSizeSuccess():
        return success(_that.fontSize);
      case FontSizeErrorState():
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
    TResult? Function(double? fontSize)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FontSizeInitial() when initial != null:
        return initial();
      case FontSizeSuccess() when success != null:
        return success(_that.fontSize);
      case FontSizeErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FontSizeInitial implements FontSizeState {
  const FontSizeInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FontSizeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FontSizeState.initial()';
  }
}

/// @nodoc

class FontSizeSuccess implements FontSizeState {
  const FontSizeSuccess({required this.fontSize});

  final double? fontSize;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FontSizeSuccessCopyWith<FontSizeSuccess> get copyWith =>
      _$FontSizeSuccessCopyWithImpl<FontSizeSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FontSizeSuccess &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize);

  @override
  String toString() {
    return 'FontSizeState.success(fontSize: $fontSize)';
  }
}

/// @nodoc
abstract mixin class $FontSizeSuccessCopyWith<$Res>
    implements $FontSizeStateCopyWith<$Res> {
  factory $FontSizeSuccessCopyWith(
          FontSizeSuccess value, $Res Function(FontSizeSuccess) _then) =
      _$FontSizeSuccessCopyWithImpl;
  @useResult
  $Res call({double? fontSize});
}

/// @nodoc
class _$FontSizeSuccessCopyWithImpl<$Res>
    implements $FontSizeSuccessCopyWith<$Res> {
  _$FontSizeSuccessCopyWithImpl(this._self, this._then);

  final FontSizeSuccess _self;
  final $Res Function(FontSizeSuccess) _then;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fontSize = freezed,
  }) {
    return _then(FontSizeSuccess(
      fontSize: freezed == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class FontSizeErrorState implements FontSizeState {
  const FontSizeErrorState(this.message);

  final String message;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FontSizeErrorStateCopyWith<FontSizeErrorState> get copyWith =>
      _$FontSizeErrorStateCopyWithImpl<FontSizeErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FontSizeErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FontSizeState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FontSizeErrorStateCopyWith<$Res>
    implements $FontSizeStateCopyWith<$Res> {
  factory $FontSizeErrorStateCopyWith(
          FontSizeErrorState value, $Res Function(FontSizeErrorState) _then) =
      _$FontSizeErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FontSizeErrorStateCopyWithImpl<$Res>
    implements $FontSizeErrorStateCopyWith<$Res> {
  _$FontSizeErrorStateCopyWithImpl(this._self, this._then);

  final FontSizeErrorState _self;
  final $Res Function(FontSizeErrorState) _then;

  /// Create a copy of FontSizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FontSizeErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
