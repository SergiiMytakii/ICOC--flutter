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
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
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
}

/// @nodoc
abstract class _$$SongsRequestedImplCopyWith<$Res> {
  factory _$$SongsRequestedImplCopyWith(_$SongsRequestedImpl value,
          $Res Function(_$SongsRequestedImpl) then) =
      __$$SongsRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SongsRequestedImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SongsRequestedImpl>
    implements _$$SongsRequestedImplCopyWith<$Res> {
  __$$SongsRequestedImplCopyWithImpl(
      _$SongsRequestedImpl _value, $Res Function(_$SongsRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SongsRequestedImpl implements _SongsRequested {
  const _$SongsRequestedImpl();

  @override
  String toString() {
    return 'SongsEvent.songsRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SongsRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return songsRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return songsRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (songsRequested != null) {
      return songsRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return songsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return songsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) {
    if (songsRequested != null) {
      return songsRequested(this);
    }
    return orElse();
  }
}

abstract class _SongsRequested implements SongsEvent {
  const factory _SongsRequested() = _$SongsRequestedImpl;
}

/// @nodoc
abstract class _$$SearchSongByNumberImplCopyWith<$Res> {
  factory _$$SearchSongByNumberImplCopyWith(_$SearchSongByNumberImpl value,
          $Res Function(_$SearchSongByNumberImpl) then) =
      __$$SearchSongByNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchSongByNumberImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SearchSongByNumberImpl>
    implements _$$SearchSongByNumberImplCopyWith<$Res> {
  __$$SearchSongByNumberImplCopyWithImpl(_$SearchSongByNumberImpl _value,
      $Res Function(_$SearchSongByNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchSongByNumberImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSongByNumberImpl implements _SearchSongByNumber {
  const _$SearchSongByNumberImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SongsEvent.searchByNumber(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongByNumberImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongByNumberImplCopyWith<_$SearchSongByNumberImpl> get copyWith =>
      __$$SearchSongByNumberImplCopyWithImpl<_$SearchSongByNumberImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return searchByNumber(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return searchByNumber?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (searchByNumber != null) {
      return searchByNumber(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return searchByNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return searchByNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchByNumber != null) {
      return searchByNumber(this);
    }
    return orElse();
  }
}

abstract class _SearchSongByNumber implements SongsEvent {
  const factory _SearchSongByNumber(final String query) =
      _$SearchSongByNumberImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchSongByNumberImplCopyWith<_$SearchSongByNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSongByTextImplCopyWith<$Res> {
  factory _$$SearchSongByTextImplCopyWith(_$SearchSongByTextImpl value,
          $Res Function(_$SearchSongByTextImpl) then) =
      __$$SearchSongByTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchSongByTextImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SearchSongByTextImpl>
    implements _$$SearchSongByTextImplCopyWith<$Res> {
  __$$SearchSongByTextImplCopyWithImpl(_$SearchSongByTextImpl _value,
      $Res Function(_$SearchSongByTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchSongByTextImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSongByTextImpl implements _SearchSongByText {
  const _$SearchSongByTextImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SongsEvent.searchByText(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongByTextImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongByTextImplCopyWith<_$SearchSongByTextImpl> get copyWith =>
      __$$SearchSongByTextImplCopyWithImpl<_$SearchSongByTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return searchByText(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return searchByText?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (searchByText != null) {
      return searchByText(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return searchByText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return searchByText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchByText != null) {
      return searchByText(this);
    }
    return orElse();
  }
}

abstract class _SearchSongByText implements SongsEvent {
  const factory _SearchSongByText(final String query) = _$SearchSongByTextImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchSongByTextImplCopyWith<_$SearchSongByTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSongClearImplCopyWith<$Res> {
  factory _$$SearchSongClearImplCopyWith(_$SearchSongClearImpl value,
          $Res Function(_$SearchSongClearImpl) then) =
      __$$SearchSongClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchSongClearImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$SearchSongClearImpl>
    implements _$$SearchSongClearImplCopyWith<$Res> {
  __$$SearchSongClearImplCopyWithImpl(
      _$SearchSongClearImpl _value, $Res Function(_$SearchSongClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchSongClearImpl implements _SearchSongClear {
  const _$SearchSongClearImpl();

  @override
  String toString() {
    return 'SongsEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchSongClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _SearchSongClear implements SongsEvent {
  const factory _SearchSongClear() = _$SearchSongClearImpl;
}

/// @nodoc
mixin _$SongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
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
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
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
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
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
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
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
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
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
abstract class _$$EmptySongsStateImplCopyWith<$Res> {
  factory _$$EmptySongsStateImplCopyWith(_$EmptySongsStateImpl value,
          $Res Function(_$EmptySongsStateImpl) then) =
      __$$EmptySongsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptySongsStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$EmptySongsStateImpl>
    implements _$$EmptySongsStateImplCopyWith<$Res> {
  __$$EmptySongsStateImplCopyWithImpl(
      _$EmptySongsStateImpl _value, $Res Function(_$EmptySongsStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptySongsStateImpl implements EmptySongsState {
  const _$EmptySongsStateImpl();

  @override
  String toString() {
    return 'SongsState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptySongsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptySongsState implements SongsState {
  const factory EmptySongsState() = _$EmptySongsStateImpl;
}

/// @nodoc
abstract class _$$GetSongsSuccessStateImplCopyWith<$Res> {
  factory _$$GetSongsSuccessStateImplCopyWith(_$GetSongsSuccessStateImpl value,
          $Res Function(_$GetSongsSuccessStateImpl) then) =
      __$$GetSongsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongModel> songs});
}

/// @nodoc
class __$$GetSongsSuccessStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$GetSongsSuccessStateImpl>
    implements _$$GetSongsSuccessStateImplCopyWith<$Res> {
  __$$GetSongsSuccessStateImplCopyWithImpl(_$GetSongsSuccessStateImpl _value,
      $Res Function(_$GetSongsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$GetSongsSuccessStateImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class _$GetSongsSuccessStateImpl implements GetSongsSuccessState {
  const _$GetSongsSuccessStateImpl(final List<SongModel> songs)
      : _songs = songs;

  final List<SongModel> _songs;
  @override
  List<SongModel> get songs {
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

  @JsonKey(ignore: true)
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
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return success(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return success?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
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
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
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
  const factory GetSongsSuccessState(final List<SongModel> songs) =
      _$GetSongsSuccessStateImpl;

  List<SongModel> get songs;
  @JsonKey(ignore: true)
  _$$GetSongsSuccessStateImplCopyWith<_$GetSongsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSongsSuccessStateImplCopyWith<$Res> {
  factory _$$SearchSongsSuccessStateImplCopyWith(
          _$SearchSongsSuccessStateImpl value,
          $Res Function(_$SearchSongsSuccessStateImpl) then) =
      __$$SearchSongsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongVersionLocal> songVersions});
}

/// @nodoc
class __$$SearchSongsSuccessStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SearchSongsSuccessStateImpl>
    implements _$$SearchSongsSuccessStateImplCopyWith<$Res> {
  __$$SearchSongsSuccessStateImplCopyWithImpl(
      _$SearchSongsSuccessStateImpl _value,
      $Res Function(_$SearchSongsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songVersions = null,
  }) {
    return _then(_$SearchSongsSuccessStateImpl(
      null == songVersions
          ? _value._songVersions
          : songVersions // ignore: cast_nullable_to_non_nullable
              as List<SongVersionLocal>,
    ));
  }
}

/// @nodoc

class _$SearchSongsSuccessStateImpl implements SearchSongsSuccessState {
  const _$SearchSongsSuccessStateImpl(final List<SongVersionLocal> songVersions)
      : _songVersions = songVersions;

  final List<SongVersionLocal> _songVersions;
  @override
  List<SongVersionLocal> get songVersions {
    if (_songVersions is EqualUnmodifiableListView) return _songVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songVersions);
  }

  @override
  String toString() {
    return 'SongsState.searchSuccess(songVersions: $songVersions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongsSuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._songVersions, _songVersions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songVersions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongsSuccessStateImplCopyWith<_$SearchSongsSuccessStateImpl>
      get copyWith => __$$SearchSongsSuccessStateImplCopyWithImpl<
          _$SearchSongsSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return searchSuccess(songVersions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return searchSuccess?.call(songVersions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(songVersions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return searchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return searchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(this);
    }
    return orElse();
  }
}

abstract class SearchSongsSuccessState implements SongsState {
  const factory SearchSongsSuccessState(
          final List<SongVersionLocal> songVersions) =
      _$SearchSongsSuccessStateImpl;

  List<SongVersionLocal> get songVersions;
  @JsonKey(ignore: true)
  _$$SearchSongsSuccessStateImplCopyWith<_$SearchSongsSuccessStateImpl>
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

  @JsonKey(ignore: true)
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
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
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
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
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
  @JsonKey(ignore: true)
  _$$SongsErrorStateImplCopyWith<_$SongsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
