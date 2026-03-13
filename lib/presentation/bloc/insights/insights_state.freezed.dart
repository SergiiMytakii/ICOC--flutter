// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsightsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InsightsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InsightsState()';
  }
}

/// @nodoc
class $InsightsStateCopyWith<$Res> {
  $InsightsStateCopyWith(InsightsState _, $Res Function(InsightsState) __);
}

/// Adds pattern-matching-related methods to [InsightsState].
extension InsightsStatePatterns on InsightsState {
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    TResult Function(
            List<Post> posts,
            List<String> availableLanguages,
            Map<String, bool> selectedLanguages,
            Set<String> likedPostIds,
            Set<String> busyPostIds,
            String? actionMessage)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.posts,
            _that.availableLanguages,
            _that.selectedLanguages,
            _that.likedPostIds,
            _that.busyPostIds,
            _that.actionMessage);
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
    required TResult Function(
            List<Post> posts,
            List<String> availableLanguages,
            Map<String, bool> selectedLanguages,
            Set<String> likedPostIds,
            Set<String> busyPostIds,
            String? actionMessage)
        loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.posts,
            _that.availableLanguages,
            _that.selectedLanguages,
            _that.likedPostIds,
            _that.busyPostIds,
            _that.actionMessage);
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
    TResult? Function(
            List<Post> posts,
            List<String> availableLanguages,
            Map<String, bool> selectedLanguages,
            Set<String> likedPostIds,
            Set<String> busyPostIds,
            String? actionMessage)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.posts,
            _that.availableLanguages,
            _that.selectedLanguages,
            _that.likedPostIds,
            _that.busyPostIds,
            _that.actionMessage);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements InsightsState {
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
    return 'InsightsState.initial()';
  }
}

/// @nodoc

class _Loading implements InsightsState {
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
    return 'InsightsState.loading()';
  }
}

/// @nodoc

class _Loaded implements InsightsState {
  const _Loaded(
      {required final List<Post> posts,
      final List<String> availableLanguages = const <String>[],
      final Map<String, bool> selectedLanguages = const <String, bool>{},
      final Set<String> likedPostIds = const <String>{},
      final Set<String> busyPostIds = const <String>{},
      this.actionMessage})
      : _posts = posts,
        _availableLanguages = availableLanguages,
        _selectedLanguages = selectedLanguages,
        _likedPostIds = likedPostIds,
        _busyPostIds = busyPostIds;

  final List<Post> _posts;
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  final List<String> _availableLanguages;
  @JsonKey()
  List<String> get availableLanguages {
    if (_availableLanguages is EqualUnmodifiableListView)
      return _availableLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableLanguages);
  }

  final Map<String, bool> _selectedLanguages;
  @JsonKey()
  Map<String, bool> get selectedLanguages {
    if (_selectedLanguages is EqualUnmodifiableMapView)
      return _selectedLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedLanguages);
  }

  final Set<String> _likedPostIds;
  @JsonKey()
  Set<String> get likedPostIds {
    if (_likedPostIds is EqualUnmodifiableSetView) return _likedPostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_likedPostIds);
  }

  final Set<String> _busyPostIds;
  @JsonKey()
  Set<String> get busyPostIds {
    if (_busyPostIds is EqualUnmodifiableSetView) return _busyPostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_busyPostIds);
  }

  final String? actionMessage;

  /// Create a copy of InsightsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._availableLanguages, _availableLanguages) &&
            const DeepCollectionEquality()
                .equals(other._selectedLanguages, _selectedLanguages) &&
            const DeepCollectionEquality()
                .equals(other._likedPostIds, _likedPostIds) &&
            const DeepCollectionEquality()
                .equals(other._busyPostIds, _busyPostIds) &&
            (identical(other.actionMessage, actionMessage) ||
                other.actionMessage == actionMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_availableLanguages),
      const DeepCollectionEquality().hash(_selectedLanguages),
      const DeepCollectionEquality().hash(_likedPostIds),
      const DeepCollectionEquality().hash(_busyPostIds),
      actionMessage);

  @override
  String toString() {
    return 'InsightsState.loaded(posts: $posts, availableLanguages: $availableLanguages, selectedLanguages: $selectedLanguages, likedPostIds: $likedPostIds, busyPostIds: $busyPostIds, actionMessage: $actionMessage)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $InsightsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<Post> posts,
      List<String> availableLanguages,
      Map<String, bool> selectedLanguages,
      Set<String> likedPostIds,
      Set<String> busyPostIds,
      String? actionMessage});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of InsightsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? posts = null,
    Object? availableLanguages = null,
    Object? selectedLanguages = null,
    Object? likedPostIds = null,
    Object? busyPostIds = null,
    Object? actionMessage = freezed,
  }) {
    return _then(_Loaded(
      posts: null == posts
          ? _self._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      availableLanguages: null == availableLanguages
          ? _self._availableLanguages
          : availableLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedLanguages: null == selectedLanguages
          ? _self._selectedLanguages
          : selectedLanguages // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      likedPostIds: null == likedPostIds
          ? _self._likedPostIds
          : likedPostIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      busyPostIds: null == busyPostIds
          ? _self._busyPostIds
          : busyPostIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      actionMessage: freezed == actionMessage
          ? _self.actionMessage
          : actionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Error implements InsightsState {
  const _Error(this.message);

  final String message;

  /// Create a copy of InsightsState
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
    return 'InsightsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $InsightsStateCopyWith<$Res> {
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

  /// Create a copy of InsightsState
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
