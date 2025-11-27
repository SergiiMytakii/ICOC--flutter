// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_songs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteSongsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongsListRequested value) getRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsListRequested value)? getRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsListRequested value)? getRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteSongsEventCopyWith<$Res> {
  factory $FavoriteSongsEventCopyWith(
          FavoriteSongsEvent value, $Res Function(FavoriteSongsEvent) then) =
      _$FavoriteSongsEventCopyWithImpl<$Res, FavoriteSongsEvent>;
}

/// @nodoc
class _$FavoriteSongsEventCopyWithImpl<$Res, $Val extends FavoriteSongsEvent>
    implements $FavoriteSongsEventCopyWith<$Res> {
  _$FavoriteSongsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteSongsListRequestedImplCopyWith<$Res> {
  factory _$$FavoriteSongsListRequestedImplCopyWith(
          _$FavoriteSongsListRequestedImpl value,
          $Res Function(_$FavoriteSongsListRequestedImpl) then) =
      __$$FavoriteSongsListRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteSongsListRequestedImplCopyWithImpl<$Res>
    extends _$FavoriteSongsEventCopyWithImpl<$Res,
        _$FavoriteSongsListRequestedImpl>
    implements _$$FavoriteSongsListRequestedImplCopyWith<$Res> {
  __$$FavoriteSongsListRequestedImplCopyWithImpl(
      _$FavoriteSongsListRequestedImpl _value,
      $Res Function(_$FavoriteSongsListRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteSongsListRequestedImpl implements FavoriteSongsListRequested {
  const _$FavoriteSongsListRequestedImpl();

  @override
  String toString() {
    return 'FavoriteSongsEvent.getRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongsListRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRequested,
  }) {
    return getRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRequested,
  }) {
    return getRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRequested,
    required TResult orElse(),
  }) {
    if (getRequested != null) {
      return getRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongsListRequested value) getRequested,
  }) {
    return getRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsListRequested value)? getRequested,
  }) {
    return getRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsListRequested value)? getRequested,
    required TResult orElse(),
  }) {
    if (getRequested != null) {
      return getRequested(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongsListRequested implements FavoriteSongsEvent {
  const factory FavoriteSongsListRequested() = _$FavoriteSongsListRequestedImpl;
}

/// @nodoc
mixin _$FavoriteSongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteSongsStateCopyWith<$Res> {
  factory $FavoriteSongsStateCopyWith(
          FavoriteSongsState value, $Res Function(FavoriteSongsState) then) =
      _$FavoriteSongsStateCopyWithImpl<$Res, FavoriteSongsState>;
}

/// @nodoc
class _$FavoriteSongsStateCopyWithImpl<$Res, $Val extends FavoriteSongsState>
    implements $FavoriteSongsStateCopyWith<$Res> {
  _$FavoriteSongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteSongsInitialImplCopyWith<$Res> {
  factory _$$FavoriteSongsInitialImplCopyWith(_$FavoriteSongsInitialImpl value,
          $Res Function(_$FavoriteSongsInitialImpl) then) =
      __$$FavoriteSongsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteSongsInitialImplCopyWithImpl<$Res>
    extends _$FavoriteSongsStateCopyWithImpl<$Res, _$FavoriteSongsInitialImpl>
    implements _$$FavoriteSongsInitialImplCopyWith<$Res> {
  __$$FavoriteSongsInitialImplCopyWithImpl(_$FavoriteSongsInitialImpl _value,
      $Res Function(_$FavoriteSongsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteSongsInitialImpl implements FavoriteSongsInitial {
  const _$FavoriteSongsInitialImpl();

  @override
  String toString() {
    return 'FavoriteSongsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongModel> songs)? success,
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
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongsInitial implements FavoriteSongsState {
  const factory FavoriteSongsInitial() = _$FavoriteSongsInitialImpl;
}

/// @nodoc
abstract class _$$FavoriteSongsLoadingStateImplCopyWith<$Res> {
  factory _$$FavoriteSongsLoadingStateImplCopyWith(
          _$FavoriteSongsLoadingStateImpl value,
          $Res Function(_$FavoriteSongsLoadingStateImpl) then) =
      __$$FavoriteSongsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteSongsLoadingStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongsStateCopyWithImpl<$Res,
        _$FavoriteSongsLoadingStateImpl>
    implements _$$FavoriteSongsLoadingStateImplCopyWith<$Res> {
  __$$FavoriteSongsLoadingStateImplCopyWithImpl(
      _$FavoriteSongsLoadingStateImpl _value,
      $Res Function(_$FavoriteSongsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteSongsLoadingStateImpl implements FavoriteSongsLoadingState {
  const _$FavoriteSongsLoadingStateImpl();

  @override
  String toString() {
    return 'FavoriteSongsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongModel> songs)? success,
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
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongsLoadingState implements FavoriteSongsState {
  const factory FavoriteSongsLoadingState() = _$FavoriteSongsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetFavoriteSongsSuccessStateImplCopyWith<$Res> {
  factory _$$GetFavoriteSongsSuccessStateImplCopyWith(
          _$GetFavoriteSongsSuccessStateImpl value,
          $Res Function(_$GetFavoriteSongsSuccessStateImpl) then) =
      __$$GetFavoriteSongsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongModel> songs});
}

/// @nodoc
class __$$GetFavoriteSongsSuccessStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongsStateCopyWithImpl<$Res,
        _$GetFavoriteSongsSuccessStateImpl>
    implements _$$GetFavoriteSongsSuccessStateImplCopyWith<$Res> {
  __$$GetFavoriteSongsSuccessStateImplCopyWithImpl(
      _$GetFavoriteSongsSuccessStateImpl _value,
      $Res Function(_$GetFavoriteSongsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$GetFavoriteSongsSuccessStateImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class _$GetFavoriteSongsSuccessStateImpl
    implements GetFavoriteSongsSuccessState {
  const _$GetFavoriteSongsSuccessStateImpl(final List<SongModel> songs)
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
    return 'FavoriteSongsState.success(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavoriteSongsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFavoriteSongsSuccessStateImplCopyWith<
          _$GetFavoriteSongsSuccessStateImpl>
      get copyWith => __$$GetFavoriteSongsSuccessStateImplCopyWithImpl<
          _$GetFavoriteSongsSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) {
    return success(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongModel> songs)? success,
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
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteSongsSuccessState implements FavoriteSongsState {
  const factory GetFavoriteSongsSuccessState(final List<SongModel> songs) =
      _$GetFavoriteSongsSuccessStateImpl;

  List<SongModel> get songs;
  @JsonKey(ignore: true)
  _$$GetFavoriteSongsSuccessStateImplCopyWith<
          _$GetFavoriteSongsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteSongsErrorStateImplCopyWith<$Res> {
  factory _$$FavoriteSongsErrorStateImplCopyWith(
          _$FavoriteSongsErrorStateImpl value,
          $Res Function(_$FavoriteSongsErrorStateImpl) then) =
      __$$FavoriteSongsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FavoriteSongsErrorStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongsStateCopyWithImpl<$Res,
        _$FavoriteSongsErrorStateImpl>
    implements _$$FavoriteSongsErrorStateImplCopyWith<$Res> {
  __$$FavoriteSongsErrorStateImplCopyWithImpl(
      _$FavoriteSongsErrorStateImpl _value,
      $Res Function(_$FavoriteSongsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FavoriteSongsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteSongsErrorStateImpl implements FavoriteSongsErrorState {
  const _$FavoriteSongsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteSongsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSongsErrorStateImplCopyWith<_$FavoriteSongsErrorStateImpl>
      get copyWith => __$$FavoriteSongsErrorStateImplCopyWithImpl<
          _$FavoriteSongsErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SongModel> songs)? success,
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
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongsErrorState implements FavoriteSongsState {
  const factory FavoriteSongsErrorState(final String message) =
      _$FavoriteSongsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FavoriteSongsErrorStateImplCopyWith<_$FavoriteSongsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
