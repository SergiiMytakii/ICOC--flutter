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
    TResult Function(BibleStudyScreenOpened value)? screenOpened,
    TResult Function(_TopicOpened value)? topicOpened,
    TResult Function(_LessonOpened value)? lessonOpened,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested(_that);
      case BibleStudyScreenOpened() when screenOpened != null:
        return screenOpened(_that);
      case _TopicOpened() when topicOpened != null:
        return topicOpened(_that);
      case _LessonOpened() when lessonOpened != null:
        return lessonOpened(_that);
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
    required TResult Function(BibleStudyScreenOpened value) screenOpened,
    required TResult Function(_TopicOpened value) topicOpened,
    required TResult Function(_LessonOpened value) lessonOpened,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested():
        return listRequested(_that);
      case BibleStudyScreenOpened():
        return screenOpened(_that);
      case _TopicOpened():
        return topicOpened(_that);
      case _LessonOpened():
        return lessonOpened(_that);
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
    TResult? Function(BibleStudyScreenOpened value)? screenOpened,
    TResult? Function(_TopicOpened value)? topicOpened,
    TResult? Function(_LessonOpened value)? lessonOpened,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested(_that);
      case BibleStudyScreenOpened() when screenOpened != null:
        return screenOpened(_that);
      case _TopicOpened() when topicOpened != null:
        return topicOpened(_that);
      case _LessonOpened() when lessonOpened != null:
        return lessonOpened(_that);
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
    TResult Function()? screenOpened,
    TResult Function(int topicId)? topicOpened,
    TResult Function(int lessonId)? lessonOpened,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested();
      case BibleStudyScreenOpened() when screenOpened != null:
        return screenOpened();
      case _TopicOpened() when topicOpened != null:
        return topicOpened(_that.topicId);
      case _LessonOpened() when lessonOpened != null:
        return lessonOpened(_that.lessonId);
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
    required TResult Function() screenOpened,
    required TResult Function(int topicId) topicOpened,
    required TResult Function(int lessonId) lessonOpened,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested():
        return listRequested();
      case BibleStudyScreenOpened():
        return screenOpened();
      case _TopicOpened():
        return topicOpened(_that.topicId);
      case _LessonOpened():
        return lessonOpened(_that.lessonId);
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
    TResult? Function()? screenOpened,
    TResult? Function(int topicId)? topicOpened,
    TResult? Function(int lessonId)? lessonOpened,
  }) {
    final _that = this;
    switch (_that) {
      case BibleStudyListRequested() when listRequested != null:
        return listRequested();
      case BibleStudyScreenOpened() when screenOpened != null:
        return screenOpened();
      case _TopicOpened() when topicOpened != null:
        return topicOpened(_that.topicId);
      case _LessonOpened() when lessonOpened != null:
        return lessonOpened(_that.lessonId);
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

class BibleStudyScreenOpened implements BibleStudyEvent {
  const BibleStudyScreenOpened();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BibleStudyScreenOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BibleStudyEvent.screenOpened()';
  }
}

/// @nodoc

class _TopicOpened implements BibleStudyEvent {
  const _TopicOpened(this.topicId);

  final int topicId;

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicOpenedCopyWith<_TopicOpened> get copyWith =>
      __$TopicOpenedCopyWithImpl<_TopicOpened>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicOpened &&
            (identical(other.topicId, topicId) || other.topicId == topicId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topicId);

  @override
  String toString() {
    return 'BibleStudyEvent.topicOpened(topicId: $topicId)';
  }
}

/// @nodoc
abstract mixin class _$TopicOpenedCopyWith<$Res>
    implements $BibleStudyEventCopyWith<$Res> {
  factory _$TopicOpenedCopyWith(
          _TopicOpened value, $Res Function(_TopicOpened) _then) =
      __$TopicOpenedCopyWithImpl;
  @useResult
  $Res call({int topicId});
}

/// @nodoc
class __$TopicOpenedCopyWithImpl<$Res> implements _$TopicOpenedCopyWith<$Res> {
  __$TopicOpenedCopyWithImpl(this._self, this._then);

  final _TopicOpened _self;
  final $Res Function(_TopicOpened) _then;

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topicId = null,
  }) {
    return _then(_TopicOpened(
      null == topicId
          ? _self.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _LessonOpened implements BibleStudyEvent {
  const _LessonOpened(this.lessonId);

  final int lessonId;

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LessonOpenedCopyWith<_LessonOpened> get copyWith =>
      __$LessonOpenedCopyWithImpl<_LessonOpened>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LessonOpened &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId);

  @override
  String toString() {
    return 'BibleStudyEvent.lessonOpened(lessonId: $lessonId)';
  }
}

/// @nodoc
abstract mixin class _$LessonOpenedCopyWith<$Res>
    implements $BibleStudyEventCopyWith<$Res> {
  factory _$LessonOpenedCopyWith(
          _LessonOpened value, $Res Function(_LessonOpened) _then) =
      __$LessonOpenedCopyWithImpl;
  @useResult
  $Res call({int lessonId});
}

/// @nodoc
class __$LessonOpenedCopyWithImpl<$Res>
    implements _$LessonOpenedCopyWith<$Res> {
  __$LessonOpenedCopyWithImpl(this._self, this._then);

  final _LessonOpened _self;
  final $Res Function(_LessonOpened) _then;

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(_LessonOpened(
      null == lessonId
          ? _self.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
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
    TResult Function(List<BibleStudy> topics, int unreadCount,
            Set<int> newTopicIds, Set<int> newLessonIds)?
        success,
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
        return success(_that.topics, _that.unreadCount, _that.newTopicIds,
            _that.newLessonIds);
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
    required TResult Function(List<BibleStudy> topics, int unreadCount,
            Set<int> newTopicIds, Set<int> newLessonIds)
        success,
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
        return success(_that.topics, _that.unreadCount, _that.newTopicIds,
            _that.newLessonIds);
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
    TResult? Function(List<BibleStudy> topics, int unreadCount,
            Set<int> newTopicIds, Set<int> newLessonIds)?
        success,
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
        return success(_that.topics, _that.unreadCount, _that.newTopicIds,
            _that.newLessonIds);
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
  const GetBibleStudyListSuccessState(
      {required final List<BibleStudy> topics,
      this.unreadCount = 0,
      final Set<int> newTopicIds = const <int>{},
      final Set<int> newLessonIds = const <int>{}})
      : _topics = topics,
        _newTopicIds = newTopicIds,
        _newLessonIds = newLessonIds;

  final List<BibleStudy> _topics;
  List<BibleStudy> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @JsonKey()
  final int unreadCount;
  final Set<int> _newTopicIds;
  @JsonKey()
  Set<int> get newTopicIds {
    if (_newTopicIds is EqualUnmodifiableSetView) return _newTopicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_newTopicIds);
  }

  final Set<int> _newLessonIds;
  @JsonKey()
  Set<int> get newLessonIds {
    if (_newLessonIds is EqualUnmodifiableSetView) return _newLessonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_newLessonIds);
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
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            const DeepCollectionEquality()
                .equals(other._newTopicIds, _newTopicIds) &&
            const DeepCollectionEquality()
                .equals(other._newLessonIds, _newLessonIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      unreadCount,
      const DeepCollectionEquality().hash(_newTopicIds),
      const DeepCollectionEquality().hash(_newLessonIds));

  @override
  String toString() {
    return 'BibleStudyState.success(topics: $topics, unreadCount: $unreadCount, newTopicIds: $newTopicIds, newLessonIds: $newLessonIds)';
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
  $Res call(
      {List<BibleStudy> topics,
      int unreadCount,
      Set<int> newTopicIds,
      Set<int> newLessonIds});
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
    Object? unreadCount = null,
    Object? newTopicIds = null,
    Object? newLessonIds = null,
  }) {
    return _then(GetBibleStudyListSuccessState(
      topics: null == topics
          ? _self._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<BibleStudy>,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      newTopicIds: null == newTopicIds
          ? _self._newTopicIds
          : newTopicIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      newLessonIds: null == newLessonIds
          ? _self._newLessonIds
          : newLessonIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
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
