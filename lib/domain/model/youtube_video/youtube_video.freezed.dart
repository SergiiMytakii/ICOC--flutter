// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YoutubeVideo {
  Languages get lang;
  String? get title;
  String get link;
  String? get thumbnail;
  String? get artist;
  String? get publishedAt;
  String? get description;
  String? get playlistId;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YoutubeVideoCopyWith<YoutubeVideo> get copyWith =>
      _$YoutubeVideoCopyWithImpl<YoutubeVideo>(
          this as YoutubeVideo, _$identity);

  /// Serializes this YoutubeVideo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YoutubeVideo &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lang, title, link, thumbnail,
      artist, publishedAt, description, playlistId);

  @override
  String toString() {
    return 'YoutubeVideo(lang: $lang, title: $title, link: $link, thumbnail: $thumbnail, artist: $artist, publishedAt: $publishedAt, description: $description, playlistId: $playlistId)';
  }
}

/// @nodoc
abstract mixin class $YoutubeVideoCopyWith<$Res> {
  factory $YoutubeVideoCopyWith(
          YoutubeVideo value, $Res Function(YoutubeVideo) _then) =
      _$YoutubeVideoCopyWithImpl;
  @useResult
  $Res call(
      {Languages lang,
      String? title,
      String link,
      String? thumbnail,
      String? artist,
      String? publishedAt,
      String? description,
      String? playlistId});
}

/// @nodoc
class _$YoutubeVideoCopyWithImpl<$Res> implements $YoutubeVideoCopyWith<$Res> {
  _$YoutubeVideoCopyWithImpl(this._self, this._then);

  final YoutubeVideo _self;
  final $Res Function(YoutubeVideo) _then;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? title = freezed,
    Object? link = null,
    Object? thumbnail = freezed,
    Object? artist = freezed,
    Object? publishedAt = freezed,
    Object? description = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_self.copyWith(
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _self.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [YoutubeVideo].
extension YoutubeVideoPatterns on YoutubeVideo {
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
    TResult Function(_YoutubeVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo() when $default != null:
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
    TResult Function(_YoutubeVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo():
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
    TResult? Function(_YoutubeVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo() when $default != null:
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
            Languages lang,
            String? title,
            String link,
            String? thumbnail,
            String? artist,
            String? publishedAt,
            String? description,
            String? playlistId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo() when $default != null:
        return $default(
            _that.lang,
            _that.title,
            _that.link,
            _that.thumbnail,
            _that.artist,
            _that.publishedAt,
            _that.description,
            _that.playlistId);
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
            Languages lang,
            String? title,
            String link,
            String? thumbnail,
            String? artist,
            String? publishedAt,
            String? description,
            String? playlistId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo():
        return $default(
            _that.lang,
            _that.title,
            _that.link,
            _that.thumbnail,
            _that.artist,
            _that.publishedAt,
            _that.description,
            _that.playlistId);
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
            Languages lang,
            String? title,
            String link,
            String? thumbnail,
            String? artist,
            String? publishedAt,
            String? description,
            String? playlistId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _YoutubeVideo() when $default != null:
        return $default(
            _that.lang,
            _that.title,
            _that.link,
            _that.thumbnail,
            _that.artist,
            _that.publishedAt,
            _that.description,
            _that.playlistId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _YoutubeVideo extends YoutubeVideo {
  const _YoutubeVideo(
      {required this.lang,
      required this.title,
      required this.link,
      this.thumbnail,
      this.artist,
      this.publishedAt,
      this.description,
      this.playlistId})
      : super._();
  factory _YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);

  @override
  final Languages lang;
  @override
  final String? title;
  @override
  final String link;
  @override
  final String? thumbnail;
  @override
  final String? artist;
  @override
  final String? publishedAt;
  @override
  final String? description;
  @override
  final String? playlistId;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$YoutubeVideoCopyWith<_YoutubeVideo> get copyWith =>
      __$YoutubeVideoCopyWithImpl<_YoutubeVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$YoutubeVideoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YoutubeVideo &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lang, title, link, thumbnail,
      artist, publishedAt, description, playlistId);

  @override
  String toString() {
    return 'YoutubeVideo(lang: $lang, title: $title, link: $link, thumbnail: $thumbnail, artist: $artist, publishedAt: $publishedAt, description: $description, playlistId: $playlistId)';
  }
}

/// @nodoc
abstract mixin class _$YoutubeVideoCopyWith<$Res>
    implements $YoutubeVideoCopyWith<$Res> {
  factory _$YoutubeVideoCopyWith(
          _YoutubeVideo value, $Res Function(_YoutubeVideo) _then) =
      __$YoutubeVideoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Languages lang,
      String? title,
      String link,
      String? thumbnail,
      String? artist,
      String? publishedAt,
      String? description,
      String? playlistId});
}

/// @nodoc
class __$YoutubeVideoCopyWithImpl<$Res>
    implements _$YoutubeVideoCopyWith<$Res> {
  __$YoutubeVideoCopyWithImpl(this._self, this._then);

  final _YoutubeVideo _self;
  final $Res Function(_YoutubeVideo) _then;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lang = null,
    Object? title = freezed,
    Object? link = null,
    Object? thumbnail = freezed,
    Object? artist = freezed,
    Object? publishedAt = freezed,
    Object? description = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_YoutubeVideo(
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _self.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
