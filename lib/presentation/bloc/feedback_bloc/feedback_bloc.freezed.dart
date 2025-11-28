// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedbackEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedbackEvent()';
  }
}

/// @nodoc
class $FeedbackEventCopyWith<$Res> {
  $FeedbackEventCopyWith(FeedbackEvent _, $Res Function(FeedbackEvent) __);
}

/// Adds pattern-matching-related methods to [FeedbackEvent].
extension FeedbackEventPatterns on FeedbackEvent {
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
    TResult Function(FeedbackListRequested value)? listRequested,
    TResult Function(InsertFeedbackRequested value)? insertRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested() when listRequested != null:
        return listRequested(_that);
      case InsertFeedbackRequested() when insertRequested != null:
        return insertRequested(_that);
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
    required TResult Function(FeedbackListRequested value) listRequested,
    required TResult Function(InsertFeedbackRequested value) insertRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested():
        return listRequested(_that);
      case InsertFeedbackRequested():
        return insertRequested(_that);
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
    TResult? Function(FeedbackListRequested value)? listRequested,
    TResult? Function(InsertFeedbackRequested value)? insertRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested() when listRequested != null:
        return listRequested(_that);
      case InsertFeedbackRequested() when insertRequested != null:
        return insertRequested(_that);
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
    TResult Function(String feedback, String name)? insertRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested() when listRequested != null:
        return listRequested();
      case InsertFeedbackRequested() when insertRequested != null:
        return insertRequested(_that.feedback, _that.name);
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
    required TResult Function(String feedback, String name) insertRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested():
        return listRequested();
      case InsertFeedbackRequested():
        return insertRequested(_that.feedback, _that.name);
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
    TResult? Function(String feedback, String name)? insertRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackListRequested() when listRequested != null:
        return listRequested();
      case InsertFeedbackRequested() when insertRequested != null:
        return insertRequested(_that.feedback, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FeedbackListRequested implements FeedbackEvent {
  const FeedbackListRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedbackListRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedbackEvent.listRequested()';
  }
}

/// @nodoc

class InsertFeedbackRequested implements FeedbackEvent {
  const InsertFeedbackRequested({required this.feedback, required this.name});

  final String feedback;
  final String name;

  /// Create a copy of FeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsertFeedbackRequestedCopyWith<InsertFeedbackRequested> get copyWith =>
      _$InsertFeedbackRequestedCopyWithImpl<InsertFeedbackRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsertFeedbackRequested &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback, name);

  @override
  String toString() {
    return 'FeedbackEvent.insertRequested(feedback: $feedback, name: $name)';
  }
}

/// @nodoc
abstract mixin class $InsertFeedbackRequestedCopyWith<$Res>
    implements $FeedbackEventCopyWith<$Res> {
  factory $InsertFeedbackRequestedCopyWith(InsertFeedbackRequested value,
          $Res Function(InsertFeedbackRequested) _then) =
      _$InsertFeedbackRequestedCopyWithImpl;
  @useResult
  $Res call({String feedback, String name});
}

/// @nodoc
class _$InsertFeedbackRequestedCopyWithImpl<$Res>
    implements $InsertFeedbackRequestedCopyWith<$Res> {
  _$InsertFeedbackRequestedCopyWithImpl(this._self, this._then);

  final InsertFeedbackRequested _self;
  final $Res Function(InsertFeedbackRequested) _then;

  /// Create a copy of FeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? feedback = null,
    Object? name = null,
  }) {
    return _then(InsertFeedbackRequested(
      feedback: null == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FeedbackState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedbackState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedbackState()';
  }
}

/// @nodoc
class $FeedbackStateCopyWith<$Res> {
  $FeedbackStateCopyWith(FeedbackState _, $Res Function(FeedbackState) __);
}

/// Adds pattern-matching-related methods to [FeedbackState].
extension FeedbackStatePatterns on FeedbackState {
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
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial() when initial != null:
        return initial(_that);
      case FeedbackLoadingState() when loading != null:
        return loading(_that);
      case GetFeedbackListSuccessState() when getFeedbackListSuccess != null:
        return getFeedbackListSuccess(_that);
      case FeedbackErrorState() when error != null:
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
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial():
        return initial(_that);
      case FeedbackLoadingState():
        return loading(_that);
      case GetFeedbackListSuccessState():
        return getFeedbackListSuccess(_that);
      case FeedbackErrorState():
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
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial() when initial != null:
        return initial(_that);
      case FeedbackLoadingState() when loading != null:
        return loading(_that);
      case GetFeedbackListSuccessState() when getFeedbackListSuccess != null:
        return getFeedbackListSuccess(_that);
      case FeedbackErrorState() when error != null:
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
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial() when initial != null:
        return initial();
      case FeedbackLoadingState() when loading != null:
        return loading();
      case GetFeedbackListSuccessState() when getFeedbackListSuccess != null:
        return getFeedbackListSuccess(_that.feedbacks);
      case FeedbackErrorState() when error != null:
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
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial():
        return initial();
      case FeedbackLoadingState():
        return loading();
      case GetFeedbackListSuccessState():
        return getFeedbackListSuccess(_that.feedbacks);
      case FeedbackErrorState():
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
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedbackInitial() when initial != null:
        return initial();
      case FeedbackLoadingState() when loading != null:
        return loading();
      case GetFeedbackListSuccessState() when getFeedbackListSuccess != null:
        return getFeedbackListSuccess(_that.feedbacks);
      case FeedbackErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FeedbackInitial implements FeedbackState {
  const FeedbackInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedbackInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedbackState.initial()';
  }
}

/// @nodoc

class FeedbackLoadingState implements FeedbackState {
  const FeedbackLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedbackLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedbackState.loading()';
  }
}

/// @nodoc

class GetFeedbackListSuccessState implements FeedbackState {
  const GetFeedbackListSuccessState(final List<FeedbackModel> feedbacks)
      : _feedbacks = feedbacks;

  final List<FeedbackModel> _feedbacks;
  List<FeedbackModel> get feedbacks {
    if (_feedbacks is EqualUnmodifiableListView) return _feedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedbacks);
  }

  /// Create a copy of FeedbackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetFeedbackListSuccessStateCopyWith<GetFeedbackListSuccessState>
      get copyWith => _$GetFeedbackListSuccessStateCopyWithImpl<
          GetFeedbackListSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetFeedbackListSuccessState &&
            const DeepCollectionEquality()
                .equals(other._feedbacks, _feedbacks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_feedbacks));

  @override
  String toString() {
    return 'FeedbackState.getFeedbackListSuccess(feedbacks: $feedbacks)';
  }
}

/// @nodoc
abstract mixin class $GetFeedbackListSuccessStateCopyWith<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  factory $GetFeedbackListSuccessStateCopyWith(
          GetFeedbackListSuccessState value,
          $Res Function(GetFeedbackListSuccessState) _then) =
      _$GetFeedbackListSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<FeedbackModel> feedbacks});
}

/// @nodoc
class _$GetFeedbackListSuccessStateCopyWithImpl<$Res>
    implements $GetFeedbackListSuccessStateCopyWith<$Res> {
  _$GetFeedbackListSuccessStateCopyWithImpl(this._self, this._then);

  final GetFeedbackListSuccessState _self;
  final $Res Function(GetFeedbackListSuccessState) _then;

  /// Create a copy of FeedbackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? feedbacks = null,
  }) {
    return _then(GetFeedbackListSuccessState(
      null == feedbacks
          ? _self._feedbacks
          : feedbacks // ignore: cast_nullable_to_non_nullable
              as List<FeedbackModel>,
    ));
  }
}

/// @nodoc

class FeedbackErrorState implements FeedbackState {
  const FeedbackErrorState(this.message);

  final String message;

  /// Create a copy of FeedbackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedbackErrorStateCopyWith<FeedbackErrorState> get copyWith =>
      _$FeedbackErrorStateCopyWithImpl<FeedbackErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedbackErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FeedbackState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FeedbackErrorStateCopyWith<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  factory $FeedbackErrorStateCopyWith(
          FeedbackErrorState value, $Res Function(FeedbackErrorState) _then) =
      _$FeedbackErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FeedbackErrorStateCopyWithImpl<$Res>
    implements $FeedbackErrorStateCopyWith<$Res> {
  _$FeedbackErrorStateCopyWithImpl(this._self, this._then);

  final FeedbackErrorState _self;
  final $Res Function(FeedbackErrorState) _then;

  /// Create a copy of FeedbackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FeedbackErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
