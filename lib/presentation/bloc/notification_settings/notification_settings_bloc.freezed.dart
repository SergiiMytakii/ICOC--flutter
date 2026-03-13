// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationSettingsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationSettingsEvent()';
  }
}

/// @nodoc
class $NotificationSettingsEventCopyWith<$Res> {
  $NotificationSettingsEventCopyWith(
      NotificationSettingsEvent _, $Res Function(NotificationSettingsEvent) __);
}

/// Adds pattern-matching-related methods to [NotificationSettingsEvent].
extension NotificationSettingsEventPatterns on NotificationSettingsEvent {
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
    TResult Function(NotificationSettingsLoadRequested value)? loadRequested,
    TResult Function(NotificationTopicToggleRequested value)? toggleRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case NotificationTopicToggleRequested() when toggleRequested != null:
        return toggleRequested(_that);
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
    required TResult Function(NotificationSettingsLoadRequested value)
        loadRequested,
    required TResult Function(NotificationTopicToggleRequested value)
        toggleRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested():
        return loadRequested(_that);
      case NotificationTopicToggleRequested():
        return toggleRequested(_that);
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
    TResult? Function(NotificationSettingsLoadRequested value)? loadRequested,
    TResult? Function(NotificationTopicToggleRequested value)? toggleRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case NotificationTopicToggleRequested() when toggleRequested != null:
        return toggleRequested(_that);
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
    TResult Function()? loadRequested,
    TResult Function(String topic, bool enabled)? toggleRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested() when loadRequested != null:
        return loadRequested();
      case NotificationTopicToggleRequested() when toggleRequested != null:
        return toggleRequested(_that.topic, _that.enabled);
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
    required TResult Function() loadRequested,
    required TResult Function(String topic, bool enabled) toggleRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested():
        return loadRequested();
      case NotificationTopicToggleRequested():
        return toggleRequested(_that.topic, _that.enabled);
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
    TResult? Function()? loadRequested,
    TResult? Function(String topic, bool enabled)? toggleRequested,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsLoadRequested() when loadRequested != null:
        return loadRequested();
      case NotificationTopicToggleRequested() when toggleRequested != null:
        return toggleRequested(_that.topic, _that.enabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationSettingsLoadRequested implements NotificationSettingsEvent {
  const NotificationSettingsLoadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsLoadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationSettingsEvent.loadRequested()';
  }
}

/// @nodoc

class NotificationTopicToggleRequested implements NotificationSettingsEvent {
  const NotificationTopicToggleRequested(
      {required this.topic, required this.enabled});

  final String topic;
  final bool enabled;

  /// Create a copy of NotificationSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationTopicToggleRequestedCopyWith<NotificationTopicToggleRequested>
      get copyWith => _$NotificationTopicToggleRequestedCopyWithImpl<
          NotificationTopicToggleRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationTopicToggleRequested &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topic, enabled);

  @override
  String toString() {
    return 'NotificationSettingsEvent.toggleRequested(topic: $topic, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $NotificationTopicToggleRequestedCopyWith<$Res>
    implements $NotificationSettingsEventCopyWith<$Res> {
  factory $NotificationTopicToggleRequestedCopyWith(
          NotificationTopicToggleRequested value,
          $Res Function(NotificationTopicToggleRequested) _then) =
      _$NotificationTopicToggleRequestedCopyWithImpl;
  @useResult
  $Res call({String topic, bool enabled});
}

/// @nodoc
class _$NotificationTopicToggleRequestedCopyWithImpl<$Res>
    implements $NotificationTopicToggleRequestedCopyWith<$Res> {
  _$NotificationTopicToggleRequestedCopyWithImpl(this._self, this._then);

  final NotificationTopicToggleRequested _self;
  final $Res Function(NotificationTopicToggleRequested) _then;

  /// Create a copy of NotificationSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topic = null,
    Object? enabled = null,
  }) {
    return _then(NotificationTopicToggleRequested(
      topic: null == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$NotificationSettingsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationSettingsState()';
  }
}

/// @nodoc
class $NotificationSettingsStateCopyWith<$Res> {
  $NotificationSettingsStateCopyWith(
      NotificationSettingsState _, $Res Function(NotificationSettingsState) __);
}

/// Adds pattern-matching-related methods to [NotificationSettingsState].
extension NotificationSettingsStatePatterns on NotificationSettingsState {
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
    TResult Function(NotificationSettingsInitial value)? initial,
    TResult Function(NotificationSettingsLoading value)? loading,
    TResult Function(NotificationSettingsLoaded value)? loaded,
    TResult Function(NotificationSettingsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial() when initial != null:
        return initial(_that);
      case NotificationSettingsLoading() when loading != null:
        return loading(_that);
      case NotificationSettingsLoaded() when loaded != null:
        return loaded(_that);
      case NotificationSettingsError() when error != null:
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
    required TResult Function(NotificationSettingsInitial value) initial,
    required TResult Function(NotificationSettingsLoading value) loading,
    required TResult Function(NotificationSettingsLoaded value) loaded,
    required TResult Function(NotificationSettingsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial():
        return initial(_that);
      case NotificationSettingsLoading():
        return loading(_that);
      case NotificationSettingsLoaded():
        return loaded(_that);
      case NotificationSettingsError():
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
    TResult? Function(NotificationSettingsInitial value)? initial,
    TResult? Function(NotificationSettingsLoading value)? loading,
    TResult? Function(NotificationSettingsLoaded value)? loaded,
    TResult? Function(NotificationSettingsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial() when initial != null:
        return initial(_that);
      case NotificationSettingsLoading() when loading != null:
        return loading(_that);
      case NotificationSettingsLoaded() when loaded != null:
        return loaded(_that);
      case NotificationSettingsError() when error != null:
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
    TResult Function(Map<String, bool> topicStates)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial() when initial != null:
        return initial();
      case NotificationSettingsLoading() when loading != null:
        return loading();
      case NotificationSettingsLoaded() when loaded != null:
        return loaded(_that.topicStates);
      case NotificationSettingsError() when error != null:
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
    required TResult Function(Map<String, bool> topicStates) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial():
        return initial();
      case NotificationSettingsLoading():
        return loading();
      case NotificationSettingsLoaded():
        return loaded(_that.topicStates);
      case NotificationSettingsError():
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
    TResult? Function(Map<String, bool> topicStates)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationSettingsInitial() when initial != null:
        return initial();
      case NotificationSettingsLoading() when loading != null:
        return loading();
      case NotificationSettingsLoaded() when loaded != null:
        return loaded(_that.topicStates);
      case NotificationSettingsError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationSettingsInitial implements NotificationSettingsState {
  const NotificationSettingsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationSettingsState.initial()';
  }
}

/// @nodoc

class NotificationSettingsLoading implements NotificationSettingsState {
  const NotificationSettingsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationSettingsState.loading()';
  }
}

/// @nodoc

class NotificationSettingsLoaded implements NotificationSettingsState {
  const NotificationSettingsLoaded(final Map<String, bool> topicStates)
      : _topicStates = topicStates;

  final Map<String, bool> _topicStates;
  Map<String, bool> get topicStates {
    if (_topicStates is EqualUnmodifiableMapView) return _topicStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topicStates);
  }

  /// Create a copy of NotificationSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationSettingsLoadedCopyWith<NotificationSettingsLoaded>
      get copyWith =>
          _$NotificationSettingsLoadedCopyWithImpl<NotificationSettingsLoaded>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsLoaded &&
            const DeepCollectionEquality()
                .equals(other._topicStates, _topicStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_topicStates));

  @override
  String toString() {
    return 'NotificationSettingsState.loaded(topicStates: $topicStates)';
  }
}

/// @nodoc
abstract mixin class $NotificationSettingsLoadedCopyWith<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  factory $NotificationSettingsLoadedCopyWith(NotificationSettingsLoaded value,
          $Res Function(NotificationSettingsLoaded) _then) =
      _$NotificationSettingsLoadedCopyWithImpl;
  @useResult
  $Res call({Map<String, bool> topicStates});
}

/// @nodoc
class _$NotificationSettingsLoadedCopyWithImpl<$Res>
    implements $NotificationSettingsLoadedCopyWith<$Res> {
  _$NotificationSettingsLoadedCopyWithImpl(this._self, this._then);

  final NotificationSettingsLoaded _self;
  final $Res Function(NotificationSettingsLoaded) _then;

  /// Create a copy of NotificationSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topicStates = null,
  }) {
    return _then(NotificationSettingsLoaded(
      null == topicStates
          ? _self._topicStates
          : topicStates // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class NotificationSettingsError implements NotificationSettingsState {
  const NotificationSettingsError(this.message);

  final String message;

  /// Create a copy of NotificationSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationSettingsErrorCopyWith<NotificationSettingsError> get copyWith =>
      _$NotificationSettingsErrorCopyWithImpl<NotificationSettingsError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettingsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NotificationSettingsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NotificationSettingsErrorCopyWith<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  factory $NotificationSettingsErrorCopyWith(NotificationSettingsError value,
          $Res Function(NotificationSettingsError) _then) =
      _$NotificationSettingsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NotificationSettingsErrorCopyWithImpl<$Res>
    implements $NotificationSettingsErrorCopyWith<$Res> {
  _$NotificationSettingsErrorCopyWithImpl(this._self, this._then);

  final NotificationSettingsError _self;
  final $Res Function(NotificationSettingsError) _then;

  /// Create a copy of NotificationSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NotificationSettingsError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
