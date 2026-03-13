// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsightComment {
  String get id;
  String get postId;
  String get displayName;
  String get text;
  @JsonKey(
      fromJson: _commentDateTimeFromTimestamp,
      toJson: _commentDateTimeToTimestamp)
  DateTime get createdAt;
  String get status;

  /// Create a copy of InsightComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsightCommentCopyWith<InsightComment> get copyWith =>
      _$InsightCommentCopyWithImpl<InsightComment>(
          this as InsightComment, _$identity);

  /// Serializes this InsightComment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsightComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, postId, displayName, text, createdAt, status);

  @override
  String toString() {
    return 'InsightComment(id: $id, postId: $postId, displayName: $displayName, text: $text, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class $InsightCommentCopyWith<$Res> {
  factory $InsightCommentCopyWith(
          InsightComment value, $Res Function(InsightComment) _then) =
      _$InsightCommentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String postId,
      String displayName,
      String text,
      @JsonKey(
          fromJson: _commentDateTimeFromTimestamp,
          toJson: _commentDateTimeToTimestamp)
      DateTime createdAt,
      String status});
}

/// @nodoc
class _$InsightCommentCopyWithImpl<$Res>
    implements $InsightCommentCopyWith<$Res> {
  _$InsightCommentCopyWithImpl(this._self, this._then);

  final InsightComment _self;
  final $Res Function(InsightComment) _then;

  /// Create a copy of InsightComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? displayName = null,
    Object? text = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InsightComment].
extension InsightCommentPatterns on InsightComment {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InsightComment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InsightComment() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_InsightComment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightComment():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InsightComment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightComment() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String postId,
            String displayName,
            String text,
            @JsonKey(
                fromJson: _commentDateTimeFromTimestamp,
                toJson: _commentDateTimeToTimestamp)
            DateTime createdAt,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InsightComment() when $default != null:
        return $default(_that.id, _that.postId, _that.displayName, _that.text,
            _that.createdAt, _that.status);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String postId,
            String displayName,
            String text,
            @JsonKey(
                fromJson: _commentDateTimeFromTimestamp,
                toJson: _commentDateTimeToTimestamp)
            DateTime createdAt,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightComment():
        return $default(_that.id, _that.postId, _that.displayName, _that.text,
            _that.createdAt, _that.status);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String postId,
            String displayName,
            String text,
            @JsonKey(
                fromJson: _commentDateTimeFromTimestamp,
                toJson: _commentDateTimeToTimestamp)
            DateTime createdAt,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InsightComment() when $default != null:
        return $default(_that.id, _that.postId, _that.displayName, _that.text,
            _that.createdAt, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InsightComment implements InsightComment {
  const _InsightComment(
      {required this.id,
      required this.postId,
      required this.displayName,
      required this.text,
      @JsonKey(
          fromJson: _commentDateTimeFromTimestamp,
          toJson: _commentDateTimeToTimestamp)
      required this.createdAt,
      this.status = 'published'});
  factory _InsightComment.fromJson(Map<String, dynamic> json) =>
      _$InsightCommentFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String displayName;
  @override
  final String text;
  @override
  @JsonKey(
      fromJson: _commentDateTimeFromTimestamp,
      toJson: _commentDateTimeToTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey()
  final String status;

  /// Create a copy of InsightComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InsightCommentCopyWith<_InsightComment> get copyWith =>
      __$InsightCommentCopyWithImpl<_InsightComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InsightCommentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InsightComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, postId, displayName, text, createdAt, status);

  @override
  String toString() {
    return 'InsightComment(id: $id, postId: $postId, displayName: $displayName, text: $text, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$InsightCommentCopyWith<$Res>
    implements $InsightCommentCopyWith<$Res> {
  factory _$InsightCommentCopyWith(
          _InsightComment value, $Res Function(_InsightComment) _then) =
      __$InsightCommentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      String displayName,
      String text,
      @JsonKey(
          fromJson: _commentDateTimeFromTimestamp,
          toJson: _commentDateTimeToTimestamp)
      DateTime createdAt,
      String status});
}

/// @nodoc
class __$InsightCommentCopyWithImpl<$Res>
    implements _$InsightCommentCopyWith<$Res> {
  __$InsightCommentCopyWithImpl(this._self, this._then);

  final _InsightComment _self;
  final $Res Function(_InsightComment) _then;

  /// Create a copy of InsightComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? displayName = null,
    Object? text = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_InsightComment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
