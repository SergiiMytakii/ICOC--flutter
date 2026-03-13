// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongModel {
  int get id;
  List<SongVersion> get songVersions;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongModelCopyWith<SongModel> get copyWith =>
      _$SongModelCopyWithImpl<SongModel>(this as SongModel, _$identity);

  /// Serializes this SongModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.songVersions, songVersions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(songVersions));

  @override
  String toString() {
    return 'SongModel(id: $id, songVersions: $songVersions)';
  }
}

/// @nodoc
abstract mixin class $SongModelCopyWith<$Res> {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) _then) =
      _$SongModelCopyWithImpl;
  @useResult
  $Res call({int id, List<SongVersion> songVersions});
}

/// @nodoc
class _$SongModelCopyWithImpl<$Res> implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._self, this._then);

  final SongModel _self;
  final $Res Function(SongModel) _then;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songVersions = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songVersions: null == songVersions
          ? _self.songVersions
          : songVersions // ignore: cast_nullable_to_non_nullable
              as List<SongVersion>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongModel].
extension SongModelPatterns on SongModel {
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
    TResult Function(_SongModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
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
    TResult Function(_SongModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel():
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
    TResult? Function(_SongModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
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
    TResult Function(int id, List<SongVersion> songVersions)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(_that.id, _that.songVersions);
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
    TResult Function(int id, List<SongVersion> songVersions) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel():
        return $default(_that.id, _that.songVersions);
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
    TResult? Function(int id, List<SongVersion> songVersions)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(_that.id, _that.songVersions);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SongModel extends SongModel {
  const _SongModel(
      {required this.id, required final List<SongVersion> songVersions})
      : _songVersions = songVersions,
        super._();
  factory _SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  @override
  final int id;
  final List<SongVersion> _songVersions;
  @override
  List<SongVersion> get songVersions {
    if (_songVersions is EqualUnmodifiableListView) return _songVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songVersions);
  }

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongModelCopyWith<_SongModel> get copyWith =>
      __$SongModelCopyWithImpl<_SongModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SongModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._songVersions, _songVersions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_songVersions));

  @override
  String toString() {
    return 'SongModel(id: $id, songVersions: $songVersions)';
  }
}

/// @nodoc
abstract mixin class _$SongModelCopyWith<$Res>
    implements $SongModelCopyWith<$Res> {
  factory _$SongModelCopyWith(
          _SongModel value, $Res Function(_SongModel) _then) =
      __$SongModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, List<SongVersion> songVersions});
}

/// @nodoc
class __$SongModelCopyWithImpl<$Res> implements _$SongModelCopyWith<$Res> {
  __$SongModelCopyWithImpl(this._self, this._then);

  final _SongModel _self;
  final $Res Function(_SongModel) _then;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? songVersions = null,
  }) {
    return _then(_SongModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songVersions: null == songVersions
          ? _self._songVersions
          : songVersions // ignore: cast_nullable_to_non_nullable
              as List<SongVersion>,
    ));
  }
}

/// @nodoc
mixin _$SongVersion {
  int get id;
  Languages get lang;
  String get text;
  String get title;
  bool get isChords;
  String? get description;
  List<YoutubeVideo>? get youtubeVideos;

  /// Create a copy of SongVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongVersionCopyWith<SongVersion> get copyWith =>
      _$SongVersionCopyWithImpl<SongVersion>(this as SongVersion, _$identity);

  /// Serializes this SongVersion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isChords, isChords) ||
                other.isChords == isChords) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.youtubeVideos, youtubeVideos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lang, text, title, isChords,
      description, const DeepCollectionEquality().hash(youtubeVideos));

  @override
  String toString() {
    return 'SongVersion(id: $id, lang: $lang, text: $text, title: $title, isChords: $isChords, description: $description, youtubeVideos: $youtubeVideos)';
  }
}

/// @nodoc
abstract mixin class $SongVersionCopyWith<$Res> {
  factory $SongVersionCopyWith(
          SongVersion value, $Res Function(SongVersion) _then) =
      _$SongVersionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      Languages lang,
      String text,
      String title,
      bool isChords,
      String? description,
      List<YoutubeVideo>? youtubeVideos});
}

/// @nodoc
class _$SongVersionCopyWithImpl<$Res> implements $SongVersionCopyWith<$Res> {
  _$SongVersionCopyWithImpl(this._self, this._then);

  final SongVersion _self;
  final $Res Function(SongVersion) _then;

  /// Create a copy of SongVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
    Object? isChords = null,
    Object? description = freezed,
    Object? youtubeVideos = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isChords: null == isChords
          ? _self.isChords
          : isChords // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideos: freezed == youtubeVideos
          ? _self.youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongVersion].
extension SongVersionPatterns on SongVersion {
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
    TResult Function(_SongVersion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongVersion() when $default != null:
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
    TResult Function(_SongVersion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersion():
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
    TResult? Function(_SongVersion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersion() when $default != null:
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
            int id,
            Languages lang,
            String text,
            String title,
            bool isChords,
            String? description,
            List<YoutubeVideo>? youtubeVideos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongVersion() when $default != null:
        return $default(_that.id, _that.lang, _that.text, _that.title,
            _that.isChords, _that.description, _that.youtubeVideos);
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
            int id,
            Languages lang,
            String text,
            String title,
            bool isChords,
            String? description,
            List<YoutubeVideo>? youtubeVideos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersion():
        return $default(_that.id, _that.lang, _that.text, _that.title,
            _that.isChords, _that.description, _that.youtubeVideos);
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
            int id,
            Languages lang,
            String text,
            String title,
            bool isChords,
            String? description,
            List<YoutubeVideo>? youtubeVideos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersion() when $default != null:
        return $default(_that.id, _that.lang, _that.text, _that.title,
            _that.isChords, _that.description, _that.youtubeVideos);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SongVersion implements SongVersion {
  const _SongVersion(
      {required this.id,
      required this.lang,
      required this.text,
      required this.title,
      this.isChords = false,
      this.description,
      final List<YoutubeVideo>? youtubeVideos})
      : _youtubeVideos = youtubeVideos;
  factory _SongVersion.fromJson(Map<String, dynamic> json) =>
      _$SongVersionFromJson(json);

  @override
  final int id;
  @override
  final Languages lang;
  @override
  final String text;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isChords;
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

  /// Create a copy of SongVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongVersionCopyWith<_SongVersion> get copyWith =>
      __$SongVersionCopyWithImpl<_SongVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SongVersionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isChords, isChords) ||
                other.isChords == isChords) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._youtubeVideos, _youtubeVideos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lang, text, title, isChords,
      description, const DeepCollectionEquality().hash(_youtubeVideos));

  @override
  String toString() {
    return 'SongVersion(id: $id, lang: $lang, text: $text, title: $title, isChords: $isChords, description: $description, youtubeVideos: $youtubeVideos)';
  }
}

/// @nodoc
abstract mixin class _$SongVersionCopyWith<$Res>
    implements $SongVersionCopyWith<$Res> {
  factory _$SongVersionCopyWith(
          _SongVersion value, $Res Function(_SongVersion) _then) =
      __$SongVersionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      Languages lang,
      String text,
      String title,
      bool isChords,
      String? description,
      List<YoutubeVideo>? youtubeVideos});
}

/// @nodoc
class __$SongVersionCopyWithImpl<$Res> implements _$SongVersionCopyWith<$Res> {
  __$SongVersionCopyWithImpl(this._self, this._then);

  final _SongVersion _self;
  final $Res Function(_SongVersion) _then;

  /// Create a copy of SongVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
    Object? isChords = null,
    Object? description = freezed,
    Object? youtubeVideos = freezed,
  }) {
    return _then(_SongVersion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isChords: null == isChords
          ? _self.isChords
          : isChords // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideos: freezed == youtubeVideos
          ? _self._youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>?,
    ));
  }
}

/// @nodoc
mixin _$SongVersionLocal {
  int get id;
  String get lang;
  String get text;
  String get title;

  /// Create a copy of SongVersionLocal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongVersionLocalCopyWith<SongVersionLocal> get copyWith =>
      _$SongVersionLocalCopyWithImpl<SongVersionLocal>(
          this as SongVersionLocal, _$identity);

  /// Serializes this SongVersionLocal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongVersionLocal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lang, text, title);

  @override
  String toString() {
    return 'SongVersionLocal(id: $id, lang: $lang, text: $text, title: $title)';
  }
}

/// @nodoc
abstract mixin class $SongVersionLocalCopyWith<$Res> {
  factory $SongVersionLocalCopyWith(
          SongVersionLocal value, $Res Function(SongVersionLocal) _then) =
      _$SongVersionLocalCopyWithImpl;
  @useResult
  $Res call({int id, String lang, String text, String title});
}

/// @nodoc
class _$SongVersionLocalCopyWithImpl<$Res>
    implements $SongVersionLocalCopyWith<$Res> {
  _$SongVersionLocalCopyWithImpl(this._self, this._then);

  final SongVersionLocal _self;
  final $Res Function(SongVersionLocal) _then;

  /// Create a copy of SongVersionLocal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongVersionLocal].
extension SongVersionLocalPatterns on SongVersionLocal {
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
    TResult Function(_SongVersionLocal value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal() when $default != null:
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
    TResult Function(_SongVersionLocal value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal():
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
    TResult? Function(_SongVersionLocal value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal() when $default != null:
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
    TResult Function(int id, String lang, String text, String title)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal() when $default != null:
        return $default(_that.id, _that.lang, _that.text, _that.title);
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
    TResult Function(int id, String lang, String text, String title) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal():
        return $default(_that.id, _that.lang, _that.text, _that.title);
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
    TResult? Function(int id, String lang, String text, String title)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongVersionLocal() when $default != null:
        return $default(_that.id, _that.lang, _that.text, _that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SongVersionLocal implements SongVersionLocal {
  const _SongVersionLocal(
      {required this.id,
      required this.lang,
      required this.text,
      required this.title});
  factory _SongVersionLocal.fromJson(Map<String, dynamic> json) =>
      _$SongVersionLocalFromJson(json);

  @override
  final int id;
  @override
  final String lang;
  @override
  final String text;
  @override
  final String title;

  /// Create a copy of SongVersionLocal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongVersionLocalCopyWith<_SongVersionLocal> get copyWith =>
      __$SongVersionLocalCopyWithImpl<_SongVersionLocal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SongVersionLocalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongVersionLocal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lang, text, title);

  @override
  String toString() {
    return 'SongVersionLocal(id: $id, lang: $lang, text: $text, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$SongVersionLocalCopyWith<$Res>
    implements $SongVersionLocalCopyWith<$Res> {
  factory _$SongVersionLocalCopyWith(
          _SongVersionLocal value, $Res Function(_SongVersionLocal) _then) =
      __$SongVersionLocalCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String lang, String text, String title});
}

/// @nodoc
class __$SongVersionLocalCopyWithImpl<$Res>
    implements _$SongVersionLocalCopyWith<$Res> {
  __$SongVersionLocalCopyWithImpl(this._self, this._then);

  final _SongVersionLocal _self;
  final $Res Function(_SongVersionLocal) _then;

  /// Create a copy of SongVersionLocal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? text = null,
    Object? title = null,
  }) {
    return _then(_SongVersionLocal(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
