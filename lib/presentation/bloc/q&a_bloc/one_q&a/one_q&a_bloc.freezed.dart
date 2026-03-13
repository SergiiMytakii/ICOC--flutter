// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_q&a_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OneQandAEvent {
  QandAModel get article;

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OneQandAEventCopyWith<OneQandAEvent> get copyWith =>
      _$OneQandAEventCopyWithImpl<OneQandAEvent>(
          this as OneQandAEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OneQandAEvent &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @override
  String toString() {
    return 'OneQandAEvent(article: $article)';
  }
}

/// @nodoc
abstract mixin class $OneQandAEventCopyWith<$Res> {
  factory $OneQandAEventCopyWith(
          OneQandAEvent value, $Res Function(OneQandAEvent) _then) =
      _$OneQandAEventCopyWithImpl;
  @useResult
  $Res call({QandAModel article});

  $QandAModelCopyWith<$Res> get article;
}

/// @nodoc
class _$OneQandAEventCopyWithImpl<$Res>
    implements $OneQandAEventCopyWith<$Res> {
  _$OneQandAEventCopyWithImpl(this._self, this._then);

  final OneQandAEvent _self;
  final $Res Function(OneQandAEvent) _then;

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
  }) {
    return _then(_self.copyWith(
      article: null == article
          ? _self.article
          : article // ignore: cast_nullable_to_non_nullable
              as QandAModel,
    ));
  }

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QandAModelCopyWith<$Res> get article {
    return $QandAModelCopyWith<$Res>(_self.article, (value) {
      return _then(_self.copyWith(article: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OneQandAEvent].
extension OneQandAEventPatterns on OneQandAEvent {
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
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Requested() when requested != null:
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
    required TResult Function(_Requested value) requested,
  }) {
    final _that = this;
    switch (_that) {
      case _Requested():
        return requested(_that);
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
    TResult? Function(_Requested value)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case _Requested() when requested != null:
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
    TResult Function(QandAModel article)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Requested() when requested != null:
        return requested(_that.article);
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
    required TResult Function(QandAModel article) requested,
  }) {
    final _that = this;
    switch (_that) {
      case _Requested():
        return requested(_that.article);
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
    TResult? Function(QandAModel article)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case _Requested() when requested != null:
        return requested(_that.article);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Requested implements OneQandAEvent {
  const _Requested(this.article);

  @override
  final QandAModel article;

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestedCopyWith<_Requested> get copyWith =>
      __$RequestedCopyWithImpl<_Requested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Requested &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @override
  String toString() {
    return 'OneQandAEvent.requested(article: $article)';
  }
}

/// @nodoc
abstract mixin class _$RequestedCopyWith<$Res>
    implements $OneQandAEventCopyWith<$Res> {
  factory _$RequestedCopyWith(
          _Requested value, $Res Function(_Requested) _then) =
      __$RequestedCopyWithImpl;
  @override
  @useResult
  $Res call({QandAModel article});

  @override
  $QandAModelCopyWith<$Res> get article;
}

/// @nodoc
class __$RequestedCopyWithImpl<$Res> implements _$RequestedCopyWith<$Res> {
  __$RequestedCopyWithImpl(this._self, this._then);

  final _Requested _self;
  final $Res Function(_Requested) _then;

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? article = null,
  }) {
    return _then(_Requested(
      null == article
          ? _self.article
          : article // ignore: cast_nullable_to_non_nullable
              as QandAModel,
    ));
  }

  /// Create a copy of OneQandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QandAModelCopyWith<$Res> get article {
    return $QandAModelCopyWith<$Res>(_self.article, (value) {
      return _then(_self.copyWith(article: value));
    });
  }
}

/// @nodoc
mixin _$OneQandAState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OneQandAState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OneQandAState()';
  }
}

/// @nodoc
class $OneQandAStateCopyWith<$Res> {
  $OneQandAStateCopyWith(OneQandAState _, $Res Function(OneQandAState) __);
}

/// Adds pattern-matching-related methods to [OneQandAState].
extension OneQandAStatePatterns on OneQandAState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Translating value)? translating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Translating() when translating != null:
        return translating(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Translating value) translating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Translating():
        return translating(_that);
      case _Success():
        return success(_that);
      case _Error():
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Translating value)? translating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Translating() when translating != null:
        return translating(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
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
    TResult Function()? translating,
    TResult Function(QandAModel article)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Translating() when translating != null:
        return translating();
      case _Success() when success != null:
        return success(_that.article);
      case _Error() when error != null:
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
    required TResult Function() translating,
    required TResult Function(QandAModel article) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Translating():
        return translating();
      case _Success():
        return success(_that.article);
      case _Error():
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
    TResult? Function()? translating,
    TResult? Function(QandAModel article)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Translating() when translating != null:
        return translating();
      case _Success() when success != null:
        return success(_that.article);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements OneQandAState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OneQandAState.initial()';
  }
}

/// @nodoc

class _Loading implements OneQandAState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OneQandAState.loading()';
  }
}

/// @nodoc

class _Translating implements OneQandAState {
  const _Translating();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Translating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OneQandAState.translating()';
  }
}

/// @nodoc

class _Success implements OneQandAState {
  const _Success(this.article);

  final QandAModel article;

  /// Create a copy of OneQandAState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @override
  String toString() {
    return 'OneQandAState.success(article: $article)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $OneQandAStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({QandAModel article});

  $QandAModelCopyWith<$Res> get article;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of OneQandAState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? article = null,
  }) {
    return _then(_Success(
      null == article
          ? _self.article
          : article // ignore: cast_nullable_to_non_nullable
              as QandAModel,
    ));
  }

  /// Create a copy of OneQandAState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QandAModelCopyWith<$Res> get article {
    return $QandAModelCopyWith<$Res>(_self.article, (value) {
      return _then(_self.copyWith(article: value));
    });
  }
}

/// @nodoc

class _Error implements OneQandAState {
  const _Error(this.message);

  final String message;

  /// Create a copy of OneQandAState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'OneQandAState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $OneQandAStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of OneQandAState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
