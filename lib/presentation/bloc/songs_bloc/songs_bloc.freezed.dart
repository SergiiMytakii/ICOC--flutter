// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SongsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool useCache) songsRequested,
    required TResult Function(String query) searchSongRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool useCache)? songsRequested,
    TResult? Function(String query)? searchSongRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool useCache)? songsRequested,
    TResult Function(String query)? searchSongRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsRequested value) songsRequested,
    required TResult Function(SearchSongRequested value) searchSongRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsRequested value)? songsRequested,
    TResult? Function(SearchSongRequested value)? searchSongRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsRequested value)? songsRequested,
    TResult Function(SearchSongRequested value)? searchSongRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsEventCopyWith<$Res> {
  factory $SongsEventCopyWith(
          SongsEvent value, $Res Function(SongsEvent) then) =
      _$SongsEventCopyWithImpl<$Res, SongsEvent>;
}

/// @nodoc
class _$SongsEventCopyWithImpl<$Res, $Val extends SongsEvent>
    implements $SongsEventCopyWith<$Res> {
  _$SongsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SongsRequestedImplCopyWith<$Res> {
  factory _$$SongsRequestedImplCopyWith(_$SongsRequestedImpl value,
          $Res Function(_$SongsRequestedImpl) then) =
      __$$SongsRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool useCache});
}

/// @nodoc
class __$$SongsRequestedImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SongsRequestedImpl>
    implements _$$SongsRequestedImplCopyWith<$Res> {
  __$$SongsRequestedImplCopyWithImpl(
      _$SongsRequestedImpl _value, $Res Function(_$SongsRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useCache = null,
  }) {
    return _then(_$SongsRequestedImpl(
      useCache: null == useCache
          ? _value.useCache
          : useCache // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SongsRequestedImpl implements SongsRequested {
  const _$SongsRequestedImpl({this.useCache = true});

  @override
  @JsonKey()
  final bool useCache;

  @override
  String toString() {
    return 'SongsEvent.songsRequested(useCache: $useCache)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsRequestedImpl &&
            (identical(other.useCache, useCache) ||
                other.useCache == useCache));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useCache);

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsRequestedImplCopyWith<_$SongsRequestedImpl> get copyWith =>
      __$$SongsRequestedImplCopyWithImpl<_$SongsRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool useCache) songsRequested,
    required TResult Function(String query) searchSongRequested,
  }) {
    return songsRequested(useCache);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool useCache)? songsRequested,
    TResult? Function(String query)? searchSongRequested,
  }) {
    return songsRequested?.call(useCache);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool useCache)? songsRequested,
    TResult Function(String query)? searchSongRequested,
    required TResult orElse(),
  }) {
    if (songsRequested != null) {
      return songsRequested(useCache);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsRequested value) songsRequested,
    required TResult Function(SearchSongRequested value) searchSongRequested,
  }) {
    return songsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsRequested value)? songsRequested,
    TResult? Function(SearchSongRequested value)? searchSongRequested,
  }) {
    return songsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsRequested value)? songsRequested,
    TResult Function(SearchSongRequested value)? searchSongRequested,
    required TResult orElse(),
  }) {
    if (songsRequested != null) {
      return songsRequested(this);
    }
    return orElse();
  }
}

abstract class SongsRequested implements SongsEvent {
  const factory SongsRequested({final bool useCache}) = _$SongsRequestedImpl;

  bool get useCache;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongsRequestedImplCopyWith<_$SongsRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSongRequestedImplCopyWith<$Res> {
  factory _$$SearchSongRequestedImplCopyWith(_$SearchSongRequestedImpl value,
          $Res Function(_$SearchSongRequestedImpl) then) =
      __$$SearchSongRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchSongRequestedImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SearchSongRequestedImpl>
    implements _$$SearchSongRequestedImplCopyWith<$Res> {
  __$$SearchSongRequestedImplCopyWithImpl(_$SearchSongRequestedImpl _value,
      $Res Function(_$SearchSongRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchSongRequestedImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSongRequestedImpl implements SearchSongRequested {
  const _$SearchSongRequestedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SongsEvent.searchSongRequested(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongRequestedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongRequestedImplCopyWith<_$SearchSongRequestedImpl> get copyWith =>
      __$$SearchSongRequestedImplCopyWithImpl<_$SearchSongRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool useCache) songsRequested,
    required TResult Function(String query) searchSongRequested,
  }) {
    return searchSongRequested(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool useCache)? songsRequested,
    TResult? Function(String query)? searchSongRequested,
  }) {
    return searchSongRequested?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool useCache)? songsRequested,
    TResult Function(String query)? searchSongRequested,
    required TResult orElse(),
  }) {
    if (searchSongRequested != null) {
      return searchSongRequested(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsRequested value) songsRequested,
    required TResult Function(SearchSongRequested value) searchSongRequested,
  }) {
    return searchSongRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsRequested value)? songsRequested,
    TResult? Function(SearchSongRequested value)? searchSongRequested,
  }) {
    return searchSongRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsRequested value)? songsRequested,
    TResult Function(SearchSongRequested value)? searchSongRequested,
    required TResult orElse(),
  }) {
    if (searchSongRequested != null) {
      return searchSongRequested(this);
    }
    return orElse();
  }
}

abstract class SearchSongRequested implements SongsEvent {
  const factory SearchSongRequested(final String query) =
      _$SearchSongRequestedImpl;

  String get query;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSongRequestedImplCopyWith<_$SearchSongRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongDetail> songs) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongDetail> songs)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongDetail> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SongsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SongsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsStateCopyWith<$Res> {
  factory $SongsStateCopyWith(
          SongsState value, $Res Function(SongsState) then) =
      _$SongsStateCopyWithImpl<$Res, SongsState>;
}

/// @nodoc
class _$SongsStateCopyWithImpl<$Res, $Val extends SongsState>
    implements $SongsStateCopyWith<$Res> {
  _$SongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SongsInitialImplCopyWith<$Res> {
  factory _$$SongsInitialImplCopyWith(
          _$SongsInitialImpl value, $Res Function(_$SongsInitialImpl) then) =
      __$$SongsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SongsInitialImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SongsInitialImpl>
    implements _$$SongsInitialImplCopyWith<$Res> {
  __$$SongsInitialImplCopyWithImpl(
      _$SongsInitialImpl _value, $Res Function(_$SongsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SongsInitialImpl implements SongsInitial {
  const _$SongsInitialImpl();

  @override
  String toString() {
    return 'SongsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SongsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongDetail> songs) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongDetail> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongDetail> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SongsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SongsInitial implements SongsState {
  const factory SongsInitial() = _$SongsInitialImpl;
}

/// @nodoc
abstract class _$$SongsLoadingStateImplCopyWith<$Res> {
  factory _$$SongsLoadingStateImplCopyWith(_$SongsLoadingStateImpl value,
          $Res Function(_$SongsLoadingStateImpl) then) =
      __$$SongsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SongsLoadingStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SongsLoadingStateImpl>
    implements _$$SongsLoadingStateImplCopyWith<$Res> {
  __$$SongsLoadingStateImplCopyWithImpl(_$SongsLoadingStateImpl _value,
      $Res Function(_$SongsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SongsLoadingStateImpl implements SongsLoadingState {
  const _$SongsLoadingStateImpl();

  @override
  String toString() {
    return 'SongsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SongsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongDetail> songs) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongDetail> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongDetail> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SongsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SongsLoadingState implements SongsState {
  const factory SongsLoadingState() = _$SongsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetSongsSuccessStateImplCopyWith<$Res> {
  factory _$$GetSongsSuccessStateImplCopyWith(_$GetSongsSuccessStateImpl value,
          $Res Function(_$GetSongsSuccessStateImpl) then) =
      __$$GetSongsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongDetail> songs});
}

/// @nodoc
class __$$GetSongsSuccessStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$GetSongsSuccessStateImpl>
    implements _$$GetSongsSuccessStateImplCopyWith<$Res> {
  __$$GetSongsSuccessStateImplCopyWithImpl(_$GetSongsSuccessStateImpl _value,
      $Res Function(_$GetSongsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$GetSongsSuccessStateImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongDetail>,
    ));
  }
}

/// @nodoc

class _$GetSongsSuccessStateImpl implements GetSongsSuccessState {
  const _$GetSongsSuccessStateImpl(final List<SongDetail> songs)
      : _songs = songs;

  final List<SongDetail> _songs;
  @override
  List<SongDetail> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SongsState.success(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSongsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSongsSuccessStateImplCopyWith<_$GetSongsSuccessStateImpl>
      get copyWith =>
          __$$GetSongsSuccessStateImplCopyWithImpl<_$GetSongsSuccessStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongDetail> songs) success,
    required TResult Function(String message) error,
  }) {
    return success(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongDetail> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongDetail> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SongsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetSongsSuccessState implements SongsState {
  const factory GetSongsSuccessState(final List<SongDetail> songs) =
      _$GetSongsSuccessStateImpl;

  List<SongDetail> get songs;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSongsSuccessStateImplCopyWith<_$GetSongsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SongsErrorStateImplCopyWith<$Res> {
  factory _$$SongsErrorStateImplCopyWith(_$SongsErrorStateImpl value,
          $Res Function(_$SongsErrorStateImpl) then) =
      __$$SongsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SongsErrorStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SongsErrorStateImpl>
    implements _$$SongsErrorStateImplCopyWith<$Res> {
  __$$SongsErrorStateImplCopyWithImpl(
      _$SongsErrorStateImpl _value, $Res Function(_$SongsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SongsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SongsErrorStateImpl implements SongsErrorState {
  const _$SongsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SongsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsErrorStateImplCopyWith<_$SongsErrorStateImpl> get copyWith =>
      __$$SongsErrorStateImplCopyWithImpl<_$SongsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongDetail> songs) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongDetail> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongDetail> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SongsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SongsErrorState implements SongsState {
  const factory SongsErrorState(final String message) = _$SongsErrorStateImpl;

  String get message;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongsErrorStateImplCopyWith<_$SongsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
