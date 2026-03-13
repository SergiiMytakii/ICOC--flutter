// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_study_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BibleStudyEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyEvent()';
  }
}

/// @nodoc
class $BibleStudyEventCopyWith<$Res> {
  $BibleStudyEventCopyWith(
      BibleStudyEvent _, $Res Function(BibleStudyEvent) __);
}

/// Adds pattern-matching-related methods to [BibleStudyEvent].
extension BibleStudyEventPatterns on BibleStudyEvent {
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
    TResult Function(BibleStudyListRequested value)? listRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested(_that);
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
    required TResult Function(BibleStudyListRequested value) listRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested():
        return listRequested(_that);
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
    TResult? Function(BibleStudyListRequested value)? listRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested(_that);
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
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested();
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
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested():
        return listRequested();
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
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class BibleStudyListRequested implements BibleStudyEvent {
  const BibleStudyListRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyListRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyEvent.listRequested()';
  }
}

/// @nodoc
mixin _$BibleStudyState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyState()';
  }
}

/// @nodoc
class $BibleStudyStateCopyWith<$Res> {
  $BibleStudyStateCopyWith(
      BibleStudyState _, $Res Function(BibleStudyState) __);
}

/// Adds pattern-matching-related methods to [BibleStudyState].
extension BibleStudyStatePatterns on BibleStudyState {
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
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(BibleStudyEmptyState value)? empty,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial() when initial != null:
        return initial(_that);
      case BibleStudyLoadingState() when loading != null:
        return loading(_that);
      case BibleStudyEmptyState() when empty != null:
        return empty(_that);
      case GetBibleStudyListSuccessState() when success != null:
        return success(_that);
      case BibleStudyErrorState() when error != null:
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
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(BibleStudyEmptyState value) empty,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial():
        return initial(_that);
      case BibleStudyLoadingState():
        return loading(_that);
      case BibleStudyEmptyState():
        return empty(_that);
      case GetBibleStudyListSuccessState():
        return success(_that);
      case BibleStudyErrorState():
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
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(BibleStudyEmptyState value)? empty,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial() when initial != null:
        return initial(_that);
      case BibleStudyLoadingState() when loading != null:
        return loading(_that);
      case BibleStudyEmptyState() when empty != null:
        return empty(_that);
      case GetBibleStudyListSuccessState() when success != null:
        return success(_that);
      case BibleStudyErrorState() when error != null:
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
    TResult Function()? empty,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial() when initial != null:
        return initial();
      case BibleStudyLoadingState() when loading != null:
        return loading();
      case BibleStudyEmptyState() when empty != null:
        return empty();
      case GetBibleStudyListSuccessState() when success != null:
        return success(_that.topics);
      case BibleStudyErrorState() when error != null:
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
    required TResult Function() empty,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial():
        return initial();
      case BibleStudyLoadingState():
        return loading();
      case BibleStudyEmptyState():
        return empty();
      case GetBibleStudyListSuccessState():
        return success(_that.topics);
      case BibleStudyErrorState():
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
    TResult? Function()? empty,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyInitial() when initial != null:
        return initial();
      case BibleStudyLoadingState() when loading != null:
        return loading();
      case BibleStudyEmptyState() when empty != null:
        return empty();
      case GetBibleStudyListSuccessState() when success != null:
        return success(_that.topics);
      case BibleStudyErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class BibleStudyInitial implements BibleStudyState {
  const BibleStudyInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyState.initial()';
  }
}

/// @nodoc

class BibleStudyLoadingState implements BibleStudyState {
  const BibleStudyLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyState.loading()';
  }
}

/// @nodoc

class BibleStudyEmptyState implements BibleStudyState {
  const BibleStudyEmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyState.empty()';
  }
}

/// @nodoc

class GetBibleStudyListSuccessState implements BibleStudyState {
  const GetBibleStudyListSuccessState(final List<BibleStudy> topics)
      : _topics = topics;

  final List<BibleStudy> _topics;
  List<BibleStudy> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetBibleStudyListSuccessStateCopyWith<GetBibleStudyListSuccessState>
      get copyWith => _$GetBibleStudyListSuccessStateCopyWithImpl<
          GetBibleStudyListSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetBibleStudyListSuccessState &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  @override
  String toString() {
    return 'BibleStudyState.success(topics: $topics)';
  }
}

/// @nodoc
abstract mixin class $GetBibleStudyListSuccessStateCopyWith<$Res>
    implements $BibleStudyStateCopyWith<$Res> {
  factory $GetBibleStudyListSuccessStateCopyWith(
          GetBibleStudyListSuccessState value,
          $Res Function(GetBibleStudyListSuccessState) _then) =
      _$GetBibleStudyListSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<BibleStudy> topics});
}

/// @nodoc
class _$GetBibleStudyListSuccessStateCopyWithImpl<$Res>
    implements $GetBibleStudyListSuccessStateCopyWith<$Res> {
  _$GetBibleStudyListSuccessStateCopyWithImpl(this._self, this._then);

  final GetBibleStudyListSuccessState _self;
  final $Res Function(GetBibleStudyListSuccessState) _then;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topics = null,
  }) {
    return _then(GetBibleStudyListSuccessState(
      null == topics
          ? _self._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<BibleStudy>,
    ));
  }
}

/// @nodoc

class BibleStudyErrorState implements BibleStudyState {
  const BibleStudyErrorState(this.message);

  final String message;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BibleStudyErrorStateCopyWith<BibleStudyErrorState> get copyWith =>
      _$BibleStudyErrorStateCopyWithImpl<BibleStudyErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BibleStudyErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BibleStudyState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $BibleStudyErrorStateCopyWith<$Res>
    implements $BibleStudyStateCopyWith<$Res> {
  factory $BibleStudyErrorStateCopyWith(BibleStudyErrorState value,
          $Res Function(BibleStudyErrorState) _then) =
      _$BibleStudyErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$BibleStudyErrorStateCopyWithImpl<$Res>
    implements $BibleStudyErrorStateCopyWith<$Res> {
  _$BibleStudyErrorStateCopyWithImpl(this._self, this._then);

  final BibleStudyErrorState _self;
  final $Res Function(BibleStudyErrorState) _then;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(BibleStudyErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
