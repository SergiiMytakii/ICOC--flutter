// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostAuthor {
  String get name;
  String get avatarUrl;

  /// Create a copy of PostAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostAuthorCopyWith<PostAuthor> get copyWith =>
      _$PostAuthorCopyWithImpl<PostAuthor>(this as PostAuthor, _$identity);

  /// Serializes this PostAuthor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostAuthor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatarUrl);

  @override
  String toString() {
    return 'PostAuthor(name: $name, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $PostAuthorCopyWith<$Res> {
  factory $PostAuthorCopyWith(
          PostAuthor value, $Res Function(PostAuthor) _then) =
      _$PostAuthorCopyWithImpl;
  @useResult
  $Res call({String name, String avatarUrl});
}

/// @nodoc
class _$PostAuthorCopyWithImpl<$Res> implements $PostAuthorCopyWith<$Res> {
  _$PostAuthorCopyWithImpl(this._self, this._then);

  final PostAuthor _self;
  final $Res Function(PostAuthor) _then;

  /// Create a copy of PostAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PostAuthor].
extension PostAuthorPatterns on PostAuthor {
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
    TResult Function(_PostAuthor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostAuthor() when $default != null:
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
    TResult Function(_PostAuthor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthor():
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
    TResult? Function(_PostAuthor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthor() when $default != null:
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
    TResult Function(String name, String avatarUrl)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostAuthor() when $default != null:
        return $default(_that.name, _that.avatarUrl);
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
    TResult Function(String name, String avatarUrl) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthor():
        return $default(_that.name, _that.avatarUrl);
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
    TResult? Function(String name, String avatarUrl)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthor() when $default != null:
        return $default(_that.name, _that.avatarUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostAuthor implements PostAuthor {
  const _PostAuthor({required this.name, required this.avatarUrl});
  factory _PostAuthor.fromJson(Map<String, dynamic> json) =>
      _$PostAuthorFromJson(json);

  @override
  final String name;
  @override
  final String avatarUrl;

  /// Create a copy of PostAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostAuthorCopyWith<_PostAuthor> get copyWith =>
      __$PostAuthorCopyWithImpl<_PostAuthor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostAuthorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostAuthor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatarUrl);

  @override
  String toString() {
    return 'PostAuthor(name: $name, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$PostAuthorCopyWith<$Res>
    implements $PostAuthorCopyWith<$Res> {
  factory _$PostAuthorCopyWith(
          _PostAuthor value, $Res Function(_PostAuthor) _then) =
      __$PostAuthorCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String avatarUrl});
}

/// @nodoc
class __$PostAuthorCopyWithImpl<$Res> implements _$PostAuthorCopyWith<$Res> {
  __$PostAuthorCopyWithImpl(this._self, this._then);

  final _PostAuthor _self;
  final $Res Function(_PostAuthor) _then;

  /// Create a copy of PostAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
  }) {
    return _then(_PostAuthor(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
