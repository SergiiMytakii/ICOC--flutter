// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongModel _$SongModelFromJson(Map<String, dynamic> json) {
  return _SongModel.fromJson(json);
}

/// @nodoc
mixin _$SongModel {
  int get id => throw _privateConstructorUsedError;
  Map<Languages, SongVersion> get songs => throw _privateConstructorUsedError;
  Map<Languages, Chords>? get chords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongModelCopyWith<SongModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongModelCopyWith<$Res> {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) then) =
      _$SongModelCopyWithImpl<$Res, SongModel>;
  @useResult
  $Res call(
      {int id,
      Map<Languages, SongVersion> songs,
      Map<Languages, Chords>? chords});
}

/// @nodoc
class _$SongModelCopyWithImpl<$Res, $Val extends SongModel>
    implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songs = null,
    Object? chords = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as Map<Languages, SongVersion>,
      chords: freezed == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as Map<Languages, Chords>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongModelImplCopyWith<$Res>
    implements $SongModelCopyWith<$Res> {
  factory _$$SongModelImplCopyWith(
          _$SongModelImpl value, $Res Function(_$SongModelImpl) then) =
      __$$SongModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Map<Languages, SongVersion> songs,
      Map<Languages, Chords>? chords});
}

/// @nodoc
class __$$SongModelImplCopyWithImpl<$Res>
    extends _$SongModelCopyWithImpl<$Res, _$SongModelImpl>
    implements _$$SongModelImplCopyWith<$Res> {
  __$$SongModelImplCopyWithImpl(
      _$SongModelImpl _value, $Res Function(_$SongModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songs = null,
    Object? chords = freezed,
  }) {
    return _then(_$SongModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as Map<Languages, SongVersion>,
      chords: freezed == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as Map<Languages, Chords>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SongModelImpl implements _SongModel {
  const _$SongModelImpl(
      {required this.id,
      required final Map<Languages, SongVersion> songs,
      final Map<Languages, Chords>? chords})
      : _songs = songs,
        _chords = chords;

  factory _$SongModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongModelImplFromJson(json);

  @override
  final int id;
  final Map<Languages, SongVersion> _songs;
  @override
  Map<Languages, SongVersion> get songs {
    if (_songs is EqualUnmodifiableMapView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_songs);
  }

  final Map<Languages, Chords>? _chords;
  @override
  Map<Languages, Chords>? get chords {
    final value = _chords;
    if (value == null) return null;
    if (_chords is EqualUnmodifiableMapView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SongModel(id: $id, songs: $songs, chords: $chords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality().equals(other._chords, _chords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_chords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongModelImplCopyWith<_$SongModelImpl> get copyWith =>
      __$$SongModelImplCopyWithImpl<_$SongModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongModelImplToJson(
      this,
    );
  }
}

abstract class _SongModel implements SongModel {
  const factory _SongModel(
      {required final int id,
      required final Map<Languages, SongVersion> songs,
      final Map<Languages, Chords>? chords}) = _$SongModelImpl;

  factory _SongModel.fromJson(Map<String, dynamic> json) =
      _$SongModelImpl.fromJson;

  @override
  int get id;
  @override
  Map<Languages, SongVersion> get songs;
  @override
  Map<Languages, Chords>? get chords;
  @override
  @JsonKey(ignore: true)
  _$$SongModelImplCopyWith<_$SongModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SongVersion _$SongVersionFromJson(Map<String, dynamic> json) {
  return _SongVersion.fromJson(json);
}

/// @nodoc
mixin _$SongVersion {
  int get id => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<YoutubeVideo>? get youtubeVideos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongVersionCopyWith<SongVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongVersionCopyWith<$Res> {
  factory $SongVersionCopyWith(
          SongVersion value, $Res Function(SongVersion) then) =
      _$SongVersionCopyWithImpl<$Res, SongVersion>;
  @useResult
  $Res call(
      {int id,
      String lang,
      String text,
      String title,
      String? description,
      List<YoutubeVideo>? youtubeVideos});
}

/// @nodoc
class _$SongVersionCopyWithImpl<$Res, $Val extends SongVersion>
    implements $SongVersionCopyWith<$Res> {
  _$SongVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
    Object? description = freezed,
    Object? youtubeVideos = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideos: freezed == youtubeVideos
          ? _value.youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongVersionImplCopyWith<$Res>
    implements $SongVersionCopyWith<$Res> {
  factory _$$SongVersionImplCopyWith(
          _$SongVersionImpl value, $Res Function(_$SongVersionImpl) then) =
      __$$SongVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String lang,
      String text,
      String title,
      String? description,
      List<YoutubeVideo>? youtubeVideos});
}

/// @nodoc
class __$$SongVersionImplCopyWithImpl<$Res>
    extends _$SongVersionCopyWithImpl<$Res, _$SongVersionImpl>
    implements _$$SongVersionImplCopyWith<$Res> {
  __$$SongVersionImplCopyWithImpl(
      _$SongVersionImpl _value, $Res Function(_$SongVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
    Object? description = freezed,
    Object? youtubeVideos = freezed,
  }) {
    return _then(_$SongVersionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideos: freezed == youtubeVideos
          ? _value._youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongVersionImpl implements _SongVersion {
  const _$SongVersionImpl(
      {required this.id,
      required this.lang,
      required this.text,
      required this.title,
      this.description,
      final List<YoutubeVideo>? youtubeVideos})
      : _youtubeVideos = youtubeVideos;

  factory _$SongVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongVersionImplFromJson(json);

  @override
  final int id;
  @override
  final String lang;
  @override
  final String text;
  @override
  final String title;
  @override
  final String? description;
  final List<YoutubeVideo>? _youtubeVideos;
  @override
  List<YoutubeVideo>? get youtubeVideos {
    final value = _youtubeVideos;
    if (value == null) return null;
    if (_youtubeVideos is EqualUnmodifiableListView) return _youtubeVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongVersion(id: $id, lang: $lang, text: $text, title: $title, description: $description, youtubeVideos: $youtubeVideos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongVersionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._youtubeVideos, _youtubeVideos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lang, text, title,
      description, const DeepCollectionEquality().hash(_youtubeVideos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongVersionImplCopyWith<_$SongVersionImpl> get copyWith =>
      __$$SongVersionImplCopyWithImpl<_$SongVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongVersionImplToJson(
      this,
    );
  }
}

abstract class _SongVersion implements SongVersion {
  const factory _SongVersion(
      {required final int id,
      required final String lang,
      required final String text,
      required final String title,
      final String? description,
      final List<YoutubeVideo>? youtubeVideos}) = _$SongVersionImpl;

  factory _SongVersion.fromJson(Map<String, dynamic> json) =
      _$SongVersionImpl.fromJson;

  @override
  int get id;
  @override
  String get lang;
  @override
  String get text;
  @override
  String get title;
  @override
  String? get description;
  @override
  List<YoutubeVideo>? get youtubeVideos;
  @override
  @JsonKey(ignore: true)
  _$$SongVersionImplCopyWith<_$SongVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chords _$ChordsFromJson(Map<String, dynamic> json) {
  return _Chords.fromJson(json);
}

/// @nodoc
mixin _$Chords {
  int get id => throw _privateConstructorUsedError;
  String get chords => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChordsCopyWith<Chords> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordsCopyWith<$Res> {
  factory $ChordsCopyWith(Chords value, $Res Function(Chords) then) =
      _$ChordsCopyWithImpl<$Res, Chords>;
  @useResult
  $Res call({int id, String chords, String? description});
}

/// @nodoc
class _$ChordsCopyWithImpl<$Res, $Val extends Chords>
    implements $ChordsCopyWith<$Res> {
  _$ChordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chords = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chords: null == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordsImplCopyWith<$Res> implements $ChordsCopyWith<$Res> {
  factory _$$ChordsImplCopyWith(
          _$ChordsImpl value, $Res Function(_$ChordsImpl) then) =
      __$$ChordsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String chords, String? description});
}

/// @nodoc
class __$$ChordsImplCopyWithImpl<$Res>
    extends _$ChordsCopyWithImpl<$Res, _$ChordsImpl>
    implements _$$ChordsImplCopyWith<$Res> {
  __$$ChordsImplCopyWithImpl(
      _$ChordsImpl _value, $Res Function(_$ChordsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chords = null,
    Object? description = freezed,
  }) {
    return _then(_$ChordsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chords: null == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChordsImpl implements _Chords {
  const _$ChordsImpl(
      {required this.id, required this.chords, this.description});

  factory _$ChordsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChordsImplFromJson(json);

  @override
  final int id;
  @override
  final String chords;
  @override
  final String? description;

  @override
  String toString() {
    return 'Chords(id: $id, chords: $chords, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chords, chords) || other.chords == chords) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chords, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordsImplCopyWith<_$ChordsImpl> get copyWith =>
      __$$ChordsImplCopyWithImpl<_$ChordsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChordsImplToJson(
      this,
    );
  }
}

abstract class _Chords implements Chords {
  const factory _Chords(
      {required final int id,
      required final String chords,
      final String? description}) = _$ChordsImpl;

  factory _Chords.fromJson(Map<String, dynamic> json) = _$ChordsImpl.fromJson;

  @override
  int get id;
  @override
  String get chords;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ChordsImplCopyWith<_$ChordsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
