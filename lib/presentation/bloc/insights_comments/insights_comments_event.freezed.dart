// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights_comments_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsightsCommentsEvent {
  String get postId;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsightsCommentsEventCopyWith<InsightsCommentsEvent> get copyWith =>
      _$InsightsCommentsEventCopyWithImpl<InsightsCommentsEvent>(
          this as InsightsCommentsEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsightsCommentsEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsCommentsEvent(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class $InsightsCommentsEventCopyWith<$Res> {
  factory $InsightsCommentsEventCopyWith(InsightsCommentsEvent value,
          $Res Function(InsightsCommentsEvent) _then) =
      _$InsightsCommentsEventCopyWithImpl;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class _$InsightsCommentsEventCopyWithImpl<$Res>
    implements $InsightsCommentsEventCopyWith<$Res> {
  _$InsightsCommentsEventCopyWithImpl(this._self, this._then);

  final InsightsCommentsEvent _self;
  final $Res Function(InsightsCommentsEvent) _then;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_self.copyWith(
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InsightsCommentsEvent].
extension InsightsCommentsEventPatterns on InsightsCommentsEvent {
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
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _Refresh() when refresh != null:
        return refresh(_that);
      case _Submit() when submit != null:
        return submit(_that);
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Submit value) submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that);
      case _Refresh():
        return refresh(_that);
      case _Submit():
        return submit(_that);
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
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Submit value)? submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _Refresh() when refresh != null:
        return refresh(_that);
      case _Submit() when submit != null:
        return submit(_that);
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
    TResult Function(String postId)? fetch,
    TResult Function(String postId)? refresh,
    TResult Function(String postId, String text, String displayName)? submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that.postId);
      case _Refresh() when refresh != null:
        return refresh(_that.postId);
      case _Submit() when submit != null:
        return submit(_that.postId, _that.text, _that.displayName);
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
    required TResult Function(String postId) fetch,
    required TResult Function(String postId) refresh,
    required TResult Function(String postId, String text, String displayName)
        submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that.postId);
      case _Refresh():
        return refresh(_that.postId);
      case _Submit():
        return submit(_that.postId, _that.text, _that.displayName);
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
    TResult? Function(String postId)? fetch,
    TResult? Function(String postId)? refresh,
    TResult? Function(String postId, String text, String displayName)? submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that.postId);
      case _Refresh() when refresh != null:
        return refresh(_that.postId);
      case _Submit() when submit != null:
        return submit(_that.postId, _that.text, _that.displayName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Fetch implements InsightsCommentsEvent {
  const _Fetch(this.postId);

  @override
  final String postId;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsCommentsEvent.fetch(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $InsightsCommentsEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @override
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
  }) {
    return _then(_Fetch(
      null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Refresh implements InsightsCommentsEvent {
  const _Refresh(this.postId);

  @override
  final String postId;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RefreshCopyWith<_Refresh> get copyWith =>
      __$RefreshCopyWithImpl<_Refresh>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Refresh &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsCommentsEvent.refresh(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res>
    implements $InsightsCommentsEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) =
      __$RefreshCopyWithImpl;
  @override
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$RefreshCopyWithImpl<$Res> implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
  }) {
    return _then(_Refresh(
      null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Submit implements InsightsCommentsEvent {
  const _Submit(
      {required this.postId, required this.text, required this.displayName});

  @override
  final String postId;
  final String text;
  final String displayName;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmitCopyWith<_Submit> get copyWith =>
      __$SubmitCopyWithImpl<_Submit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Submit &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, text, displayName);

  @override
  String toString() {
    return 'InsightsCommentsEvent.submit(postId: $postId, text: $text, displayName: $displayName)';
  }
}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res>
    implements $InsightsCommentsEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) =
      __$SubmitCopyWithImpl;
  @override
  @useResult
  $Res call({String postId, String text, String displayName});
}

/// @nodoc
class __$SubmitCopyWithImpl<$Res> implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

  /// Create a copy of InsightsCommentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
    Object? text = null,
    Object? displayName = null,
  }) {
    return _then(_Submit(
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
