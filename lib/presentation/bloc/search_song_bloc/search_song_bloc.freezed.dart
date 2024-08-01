// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_song_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchSongEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSongEventCopyWith<$Res> {
  factory $SearchSongEventCopyWith(
          SearchSongEvent value, $Res Function(SearchSongEvent) then) =
      _$SearchSongEventCopyWithImpl<$Res, SearchSongEvent>;
}

/// @nodoc
class _$SearchSongEventCopyWithImpl<$Res, $Val extends SearchSongEvent>
    implements $SearchSongEventCopyWith<$Res> {
  _$SearchSongEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$SearchSongEventCopyWithImpl<$Res, _$SearchSongByNumberImpl>
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
    return 'SearchSongEvent.searchByNumber(query: $query)';
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
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return searchByNumber(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return searchByNumber?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return searchByNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return searchByNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SearchSongByNumber implements SearchSongEvent {
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
    extends _$SearchSongEventCopyWithImpl<$Res, _$SearchSongByTextImpl>
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
    return 'SearchSongEvent.searchByText(query: $query)';
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
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return searchByText(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return searchByText?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return searchByText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return searchByText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SearchSongByText implements SearchSongEvent {
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
    extends _$SearchSongEventCopyWithImpl<$Res, _$SearchSongClearImpl>
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
    return 'SearchSongEvent.clearSearch()';
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
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SearchSongClear implements SearchSongEvent {
  const factory _SearchSongClear() = _$SearchSongClearImpl;
}

/// @nodoc
mixin _$SearchSongState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> songs) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> songs)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSongInitial value) initial,
    required TResult Function(_SearchSongLoading value) loading,
    required TResult Function(_SearchSongSuccess value) success,
    required TResult Function(_SearchSongError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongInitial value)? initial,
    TResult? Function(_SearchSongLoading value)? loading,
    TResult? Function(_SearchSongSuccess value)? success,
    TResult? Function(_SearchSongError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongInitial value)? initial,
    TResult Function(_SearchSongLoading value)? loading,
    TResult Function(_SearchSongSuccess value)? success,
    TResult Function(_SearchSongError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSongStateCopyWith<$Res> {
  factory $SearchSongStateCopyWith(
          SearchSongState value, $Res Function(SearchSongState) then) =
      _$SearchSongStateCopyWithImpl<$Res, SearchSongState>;
}

/// @nodoc
class _$SearchSongStateCopyWithImpl<$Res, $Val extends SearchSongState>
    implements $SearchSongStateCopyWith<$Res> {
  _$SearchSongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchSongInitialImplCopyWith<$Res> {
  factory _$$SearchSongInitialImplCopyWith(_$SearchSongInitialImpl value,
          $Res Function(_$SearchSongInitialImpl) then) =
      __$$SearchSongInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchSongInitialImplCopyWithImpl<$Res>
    extends _$SearchSongStateCopyWithImpl<$Res, _$SearchSongInitialImpl>
    implements _$$SearchSongInitialImplCopyWith<$Res> {
  __$$SearchSongInitialImplCopyWithImpl(_$SearchSongInitialImpl _value,
      $Res Function(_$SearchSongInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchSongInitialImpl implements _SearchSongInitial {
  const _$SearchSongInitialImpl();

  @override
  String toString() {
    return 'SearchSongState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchSongInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> songs) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> songs)? success,
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
    required TResult Function(_SearchSongInitial value) initial,
    required TResult Function(_SearchSongLoading value) loading,
    required TResult Function(_SearchSongSuccess value) success,
    required TResult Function(_SearchSongError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongInitial value)? initial,
    TResult? Function(_SearchSongLoading value)? loading,
    TResult? Function(_SearchSongSuccess value)? success,
    TResult? Function(_SearchSongError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongInitial value)? initial,
    TResult Function(_SearchSongLoading value)? loading,
    TResult Function(_SearchSongSuccess value)? success,
    TResult Function(_SearchSongError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchSongInitial implements SearchSongState {
  const factory _SearchSongInitial() = _$SearchSongInitialImpl;
}

/// @nodoc
abstract class _$$SearchSongLoadingImplCopyWith<$Res> {
  factory _$$SearchSongLoadingImplCopyWith(_$SearchSongLoadingImpl value,
          $Res Function(_$SearchSongLoadingImpl) then) =
      __$$SearchSongLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchSongLoadingImplCopyWithImpl<$Res>
    extends _$SearchSongStateCopyWithImpl<$Res, _$SearchSongLoadingImpl>
    implements _$$SearchSongLoadingImplCopyWith<$Res> {
  __$$SearchSongLoadingImplCopyWithImpl(_$SearchSongLoadingImpl _value,
      $Res Function(_$SearchSongLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchSongLoadingImpl implements _SearchSongLoading {
  const _$SearchSongLoadingImpl();

  @override
  String toString() {
    return 'SearchSongState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchSongLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> songs) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> songs)? success,
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
    required TResult Function(_SearchSongInitial value) initial,
    required TResult Function(_SearchSongLoading value) loading,
    required TResult Function(_SearchSongSuccess value) success,
    required TResult Function(_SearchSongError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongInitial value)? initial,
    TResult? Function(_SearchSongLoading value)? loading,
    TResult? Function(_SearchSongSuccess value)? success,
    TResult? Function(_SearchSongError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongInitial value)? initial,
    TResult Function(_SearchSongLoading value)? loading,
    TResult Function(_SearchSongSuccess value)? success,
    TResult Function(_SearchSongError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SearchSongLoading implements SearchSongState {
  const factory _SearchSongLoading() = _$SearchSongLoadingImpl;
}

/// @nodoc
abstract class _$$SearchSongSuccessImplCopyWith<$Res> {
  factory _$$SearchSongSuccessImplCopyWith(_$SearchSongSuccessImpl value,
          $Res Function(_$SearchSongSuccessImpl) then) =
      __$$SearchSongSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> songs});
}

/// @nodoc
class __$$SearchSongSuccessImplCopyWithImpl<$Res>
    extends _$SearchSongStateCopyWithImpl<$Res, _$SearchSongSuccessImpl>
    implements _$$SearchSongSuccessImplCopyWith<$Res> {
  __$$SearchSongSuccessImplCopyWithImpl(_$SearchSongSuccessImpl _value,
      $Res Function(_$SearchSongSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$SearchSongSuccessImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$SearchSongSuccessImpl implements _SearchSongSuccess {
  const _$SearchSongSuccessImpl(final List<dynamic> songs) : _songs = songs;

  final List<dynamic> _songs;
  @override
  List<dynamic> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SearchSongState.success(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongSuccessImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongSuccessImplCopyWith<_$SearchSongSuccessImpl> get copyWith =>
      __$$SearchSongSuccessImplCopyWithImpl<_$SearchSongSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> songs) success,
    required TResult Function(String message) error,
  }) {
    return success(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> songs)? success,
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
    required TResult Function(_SearchSongInitial value) initial,
    required TResult Function(_SearchSongLoading value) loading,
    required TResult Function(_SearchSongSuccess value) success,
    required TResult Function(_SearchSongError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongInitial value)? initial,
    TResult? Function(_SearchSongLoading value)? loading,
    TResult? Function(_SearchSongSuccess value)? success,
    TResult? Function(_SearchSongError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongInitial value)? initial,
    TResult Function(_SearchSongLoading value)? loading,
    TResult Function(_SearchSongSuccess value)? success,
    TResult Function(_SearchSongError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SearchSongSuccess implements SearchSongState {
  const factory _SearchSongSuccess(final List<dynamic> songs) =
      _$SearchSongSuccessImpl;

  List<dynamic> get songs;
  @JsonKey(ignore: true)
  _$$SearchSongSuccessImplCopyWith<_$SearchSongSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSongErrorImplCopyWith<$Res> {
  factory _$$SearchSongErrorImplCopyWith(_$SearchSongErrorImpl value,
          $Res Function(_$SearchSongErrorImpl) then) =
      __$$SearchSongErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SearchSongErrorImplCopyWithImpl<$Res>
    extends _$SearchSongStateCopyWithImpl<$Res, _$SearchSongErrorImpl>
    implements _$$SearchSongErrorImplCopyWith<$Res> {
  __$$SearchSongErrorImplCopyWithImpl(
      _$SearchSongErrorImpl _value, $Res Function(_$SearchSongErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SearchSongErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSongErrorImpl implements _SearchSongError {
  const _$SearchSongErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SearchSongState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongErrorImplCopyWith<_$SearchSongErrorImpl> get copyWith =>
      __$$SearchSongErrorImplCopyWithImpl<_$SearchSongErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> songs) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> songs)? success,
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
    required TResult Function(_SearchSongInitial value) initial,
    required TResult Function(_SearchSongLoading value) loading,
    required TResult Function(_SearchSongSuccess value) success,
    required TResult Function(_SearchSongError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSongInitial value)? initial,
    TResult? Function(_SearchSongLoading value)? loading,
    TResult? Function(_SearchSongSuccess value)? success,
    TResult? Function(_SearchSongError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSongInitial value)? initial,
    TResult Function(_SearchSongLoading value)? loading,
    TResult Function(_SearchSongSuccess value)? success,
    TResult Function(_SearchSongError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SearchSongError implements SearchSongState {
  const factory _SearchSongError(final String message) = _$SearchSongErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SearchSongErrorImplCopyWith<_$SearchSongErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
