// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) {
  return _YoutubeVideo.fromJson(json);
}

/// @nodoc
mixin _$YoutubeVideo {
  String get lang => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get playlistId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YoutubeVideoCopyWith<YoutubeVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeVideoCopyWith<$Res> {
  factory $YoutubeVideoCopyWith(
          YoutubeVideo value, $Res Function(YoutubeVideo) then) =
      _$YoutubeVideoCopyWithImpl<$Res, YoutubeVideo>;
  @useResult
  $Res call(
      {String lang,
      String? title,
      String link,
      String? thumbnail,
      String? artist,
      String? publishedAt,
      String? description,
      String? playlistId});
}

/// @nodoc
class _$YoutubeVideoCopyWithImpl<$Res, $Val extends YoutubeVideo>
    implements $YoutubeVideoCopyWith<$Res> {
  _$YoutubeVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YoutubeVideoImplCopyWith<$Res>
    implements $YoutubeVideoCopyWith<$Res> {
  factory _$$YoutubeVideoImplCopyWith(
          _$YoutubeVideoImpl value, $Res Function(_$YoutubeVideoImpl) then) =
      __$$YoutubeVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lang,
      String? title,
      String link,
      String? thumbnail,
      String? artist,
      String? publishedAt,
      String? description,
      String? playlistId});
}

/// @nodoc
class __$$YoutubeVideoImplCopyWithImpl<$Res>
    extends _$YoutubeVideoCopyWithImpl<$Res, _$YoutubeVideoImpl>
    implements _$$YoutubeVideoImplCopyWith<$Res> {
  __$$YoutubeVideoImplCopyWithImpl(
      _$YoutubeVideoImpl _value, $Res Function(_$YoutubeVideoImpl) _then)
      : super(_value, _then);

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
    return _then(_$YoutubeVideoImpl(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeVideoImpl extends _YoutubeVideo {
  const _$YoutubeVideoImpl(
      {required this.lang,
      required this.title,
      required this.link,
      this.thumbnail,
      this.artist,
      this.publishedAt,
      this.description,
      this.playlistId})
      : super._();

  factory _$YoutubeVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeVideoImplFromJson(json);

  @override
  final String lang;
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

  @override
  String toString() {
    return 'YoutubeVideo(lang: $lang, title: $title, link: $link, thumbnail: $thumbnail, artist: $artist, publishedAt: $publishedAt, description: $description, playlistId: $playlistId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeVideoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lang, title, link, thumbnail,
      artist, publishedAt, description, playlistId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeVideoImplCopyWith<_$YoutubeVideoImpl> get copyWith =>
      __$$YoutubeVideoImplCopyWithImpl<_$YoutubeVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeVideoImplToJson(
      this,
    );
  }
}

abstract class _YoutubeVideo extends YoutubeVideo {
  const factory _YoutubeVideo(
      {required final String lang,
      required final String? title,
      required final String link,
      final String? thumbnail,
      final String? artist,
      final String? publishedAt,
      final String? description,
      final String? playlistId}) = _$YoutubeVideoImpl;
  const _YoutubeVideo._() : super._();

  factory _YoutubeVideo.fromJson(Map<String, dynamic> json) =
      _$YoutubeVideoImpl.fromJson;

  @override
  String get lang;
  @override
  String? get title;
  @override
  String get link;
  @override
  String? get thumbnail;
  @override
  String? get artist;
  @override
  String? get publishedAt;
  @override
  String? get description;
  @override
  String? get playlistId;
  @override
  @JsonKey(ignore: true)
  _$$YoutubeVideoImplCopyWith<_$YoutubeVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
