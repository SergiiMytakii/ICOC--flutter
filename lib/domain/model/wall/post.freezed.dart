// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {
  String get id;
  PostType get type;
  String get language;
  String? get title;
  String? get content;
  String? get mediaUrl;
  String? get thumbnailUrl;
  String? get articleUrl;
  PostAuthor get author;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime get createdAt;
  int get likes;
  int get shares;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostCopyWith<Post> get copyWith =>
      _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.articleUrl, articleUrl) ||
                other.articleUrl == articleUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.shares, shares) || other.shares == shares));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      language,
      title,
      content,
      mediaUrl,
      thumbnailUrl,
      articleUrl,
      author,
      createdAt,
      likes,
      shares);

  @override
  String toString() {
    return 'Post(id: $id, type: $type, language: $language, title: $title, content: $content, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, articleUrl: $articleUrl, author: $author, createdAt: $createdAt, likes: $likes, shares: $shares)';
  }
}

/// @nodoc
abstract mixin class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) =
      _$PostCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      PostType type,
      String language,
      String? title,
      String? content,
      String? mediaUrl,
      String? thumbnailUrl,
      String? articleUrl,
      PostAuthor author,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime createdAt,
      int likes,
      int shares});

  $PostAuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? language = null,
    Object? title = freezed,
    Object? content = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? articleUrl = freezed,
    Object? author = null,
    Object? createdAt = null,
    Object? likes = null,
    Object? shares = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      articleUrl: freezed == articleUrl
          ? _self.articleUrl
          : articleUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthor,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _self.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostAuthorCopyWith<$Res> get author {
    return $PostAuthorCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
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
    TResult Function(_Post value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Post() when $default != null:
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
    TResult Function(_Post value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Post():
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
    TResult? Function(_Post value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Post() when $default != null:
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
            PostType type,
            String language,
            String? title,
            String? content,
            String? mediaUrl,
            String? thumbnailUrl,
            String? articleUrl,
            PostAuthor author,
            @JsonKey(
                fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
            DateTime createdAt,
            int likes,
            int shares)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Post() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.language,
            _that.title,
            _that.content,
            _that.mediaUrl,
            _that.thumbnailUrl,
            _that.articleUrl,
            _that.author,
            _that.createdAt,
            _that.likes,
            _that.shares);
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
            PostType type,
            String language,
            String? title,
            String? content,
            String? mediaUrl,
            String? thumbnailUrl,
            String? articleUrl,
            PostAuthor author,
            @JsonKey(
                fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
            DateTime createdAt,
            int likes,
            int shares)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Post():
        return $default(
            _that.id,
            _that.type,
            _that.language,
            _that.title,
            _that.content,
            _that.mediaUrl,
            _that.thumbnailUrl,
            _that.articleUrl,
            _that.author,
            _that.createdAt,
            _that.likes,
            _that.shares);
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
            PostType type,
            String language,
            String? title,
            String? content,
            String? mediaUrl,
            String? thumbnailUrl,
            String? articleUrl,
            PostAuthor author,
            @JsonKey(
                fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
            DateTime createdAt,
            int likes,
            int shares)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Post() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.language,
            _that.title,
            _that.content,
            _that.mediaUrl,
            _that.thumbnailUrl,
            _that.articleUrl,
            _that.author,
            _that.createdAt,
            _that.likes,
            _that.shares);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Post implements Post {
  const _Post(
      {required this.id,
      required this.type,
      required this.language,
      this.title,
      this.content,
      this.mediaUrl,
      this.thumbnailUrl,
      this.articleUrl,
      required this.author,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      required this.createdAt,
      this.likes = 0,
      this.shares = 0});
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  final String id;
  @override
  final PostType type;
  @override
  final String language;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? articleUrl;
  @override
  final PostAuthor author;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int shares;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.articleUrl, articleUrl) ||
                other.articleUrl == articleUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.shares, shares) || other.shares == shares));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      language,
      title,
      content,
      mediaUrl,
      thumbnailUrl,
      articleUrl,
      author,
      createdAt,
      likes,
      shares);

  @override
  String toString() {
    return 'Post(id: $id, type: $type, language: $language, title: $title, content: $content, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, articleUrl: $articleUrl, author: $author, createdAt: $createdAt, likes: $likes, shares: $shares)';
  }
}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) =
      __$PostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      PostType type,
      String language,
      String? title,
      String? content,
      String? mediaUrl,
      String? thumbnailUrl,
      String? articleUrl,
      PostAuthor author,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime createdAt,
      int likes,
      int shares});

  @override
  $PostAuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$PostCopyWithImpl<$Res> implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? language = null,
    Object? title = freezed,
    Object? content = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? articleUrl = freezed,
    Object? author = null,
    Object? createdAt = null,
    Object? likes = null,
    Object? shares = null,
  }) {
    return _then(_Post(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      articleUrl: freezed == articleUrl
          ? _self.articleUrl
          : articleUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthor,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      shares: null == shares
          ? _self.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostAuthorCopyWith<$Res> get author {
    return $PostAuthorCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }
}

// dart format on
