// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_songs_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteSongStatusEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) statusRequested,
    required TResult Function(int id, bool isFavorite) setStatusRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? statusRequested,
    TResult? Function(int id, bool isFavorite)? setStatusRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? statusRequested,
    TResult Function(int id, bool isFavorite)? setStatusRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusRequested value)
        statusRequested,
    required TResult Function(SetFavoriteSongStatusRequested value)
        setStatusRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult? Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteSongStatusEventCopyWith<FavoriteSongStatusEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteSongStatusEventCopyWith<$Res> {
  factory $FavoriteSongStatusEventCopyWith(FavoriteSongStatusEvent value,
          $Res Function(FavoriteSongStatusEvent) then) =
      _$FavoriteSongStatusEventCopyWithImpl<$Res, FavoriteSongStatusEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FavoriteSongStatusEventCopyWithImpl<$Res,
        $Val extends FavoriteSongStatusEvent>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  _$FavoriteSongStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteSongStatusRequestedImplCopyWith<$Res>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  factory _$$FavoriteSongStatusRequestedImplCopyWith(
          _$FavoriteSongStatusRequestedImpl value,
          $Res Function(_$FavoriteSongStatusRequestedImpl) then) =
      __$$FavoriteSongStatusRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FavoriteSongStatusRequestedImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusEventCopyWithImpl<$Res,
        _$FavoriteSongStatusRequestedImpl>
    implements _$$FavoriteSongStatusRequestedImplCopyWith<$Res> {
  __$$FavoriteSongStatusRequestedImplCopyWithImpl(
      _$FavoriteSongStatusRequestedImpl _value,
      $Res Function(_$FavoriteSongStatusRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FavoriteSongStatusRequestedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FavoriteSongStatusRequestedImpl implements FavoriteSongStatusRequested {
  const _$FavoriteSongStatusRequestedImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteSongStatusEvent.statusRequested(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongStatusRequestedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSongStatusRequestedImplCopyWith<_$FavoriteSongStatusRequestedImpl>
      get copyWith => __$$FavoriteSongStatusRequestedImplCopyWithImpl<
          _$FavoriteSongStatusRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) statusRequested,
    required TResult Function(int id, bool isFavorite) setStatusRequested,
  }) {
    return statusRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? statusRequested,
    TResult? Function(int id, bool isFavorite)? setStatusRequested,
  }) {
    return statusRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? statusRequested,
    TResult Function(int id, bool isFavorite)? setStatusRequested,
    required TResult orElse(),
  }) {
    if (statusRequested != null) {
      return statusRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusRequested value)
        statusRequested,
    required TResult Function(SetFavoriteSongStatusRequested value)
        setStatusRequested,
  }) {
    return statusRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult? Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
  }) {
    return statusRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
    required TResult orElse(),
  }) {
    if (statusRequested != null) {
      return statusRequested(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongStatusRequested implements FavoriteSongStatusEvent {
  const factory FavoriteSongStatusRequested({required final int id}) =
      _$FavoriteSongStatusRequestedImpl;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteSongStatusRequestedImplCopyWith<_$FavoriteSongStatusRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFavoriteSongStatusRequestedImplCopyWith<$Res>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  factory _$$SetFavoriteSongStatusRequestedImplCopyWith(
          _$SetFavoriteSongStatusRequestedImpl value,
          $Res Function(_$SetFavoriteSongStatusRequestedImpl) then) =
      __$$SetFavoriteSongStatusRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool isFavorite});
}

/// @nodoc
class __$$SetFavoriteSongStatusRequestedImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusEventCopyWithImpl<$Res,
        _$SetFavoriteSongStatusRequestedImpl>
    implements _$$SetFavoriteSongStatusRequestedImplCopyWith<$Res> {
  __$$SetFavoriteSongStatusRequestedImplCopyWithImpl(
      _$SetFavoriteSongStatusRequestedImpl _value,
      $Res Function(_$SetFavoriteSongStatusRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
  }) {
    return _then(_$SetFavoriteSongStatusRequestedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetFavoriteSongStatusRequestedImpl
    implements SetFavoriteSongStatusRequested {
  const _$SetFavoriteSongStatusRequestedImpl(
      {required this.id, required this.isFavorite});

  @override
  final int id;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteSongStatusEvent.setStatusRequested(id: $id, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFavoriteSongStatusRequestedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFavoriteSongStatusRequestedImplCopyWith<
          _$SetFavoriteSongStatusRequestedImpl>
      get copyWith => __$$SetFavoriteSongStatusRequestedImplCopyWithImpl<
          _$SetFavoriteSongStatusRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) statusRequested,
    required TResult Function(int id, bool isFavorite) setStatusRequested,
  }) {
    return setStatusRequested(id, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? statusRequested,
    TResult? Function(int id, bool isFavorite)? setStatusRequested,
  }) {
    return setStatusRequested?.call(id, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? statusRequested,
    TResult Function(int id, bool isFavorite)? setStatusRequested,
    required TResult orElse(),
  }) {
    if (setStatusRequested != null) {
      return setStatusRequested(id, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusRequested value)
        statusRequested,
    required TResult Function(SetFavoriteSongStatusRequested value)
        setStatusRequested,
  }) {
    return setStatusRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult? Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
  }) {
    return setStatusRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
    required TResult orElse(),
  }) {
    if (setStatusRequested != null) {
      return setStatusRequested(this);
    }
    return orElse();
  }
}

abstract class SetFavoriteSongStatusRequested
    implements FavoriteSongStatusEvent {
  const factory SetFavoriteSongStatusRequested(
      {required final int id,
      required final bool isFavorite}) = _$SetFavoriteSongStatusRequestedImpl;

  @override
  int get id;
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$SetFavoriteSongStatusRequestedImplCopyWith<
          _$SetFavoriteSongStatusRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteSongStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteSongStatusStateCopyWith<$Res> {
  factory $FavoriteSongStatusStateCopyWith(FavoriteSongStatusState value,
          $Res Function(FavoriteSongStatusState) then) =
      _$FavoriteSongStatusStateCopyWithImpl<$Res, FavoriteSongStatusState>;
}

/// @nodoc
class _$FavoriteSongStatusStateCopyWithImpl<$Res,
        $Val extends FavoriteSongStatusState>
    implements $FavoriteSongStatusStateCopyWith<$Res> {
  _$FavoriteSongStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteSongStatusInitialImplCopyWith<$Res> {
  factory _$$FavoriteSongStatusInitialImplCopyWith(
          _$FavoriteSongStatusInitialImpl value,
          $Res Function(_$FavoriteSongStatusInitialImpl) then) =
      __$$FavoriteSongStatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteSongStatusInitialImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusStateCopyWithImpl<$Res,
        _$FavoriteSongStatusInitialImpl>
    implements _$$FavoriteSongStatusInitialImplCopyWith<$Res> {
  __$$FavoriteSongStatusInitialImplCopyWithImpl(
      _$FavoriteSongStatusInitialImpl _value,
      $Res Function(_$FavoriteSongStatusInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteSongStatusInitialImpl implements FavoriteSongStatusInitial {
  const _$FavoriteSongStatusInitialImpl();

  @override
  String toString() {
    return 'FavoriteSongStatusState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongStatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
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
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongStatusInitial implements FavoriteSongStatusState {
  const factory FavoriteSongStatusInitial() = _$FavoriteSongStatusInitialImpl;
}

/// @nodoc
abstract class _$$FavoriteSongStatusLoadingStateImplCopyWith<$Res> {
  factory _$$FavoriteSongStatusLoadingStateImplCopyWith(
          _$FavoriteSongStatusLoadingStateImpl value,
          $Res Function(_$FavoriteSongStatusLoadingStateImpl) then) =
      __$$FavoriteSongStatusLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteSongStatusLoadingStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusStateCopyWithImpl<$Res,
        _$FavoriteSongStatusLoadingStateImpl>
    implements _$$FavoriteSongStatusLoadingStateImplCopyWith<$Res> {
  __$$FavoriteSongStatusLoadingStateImplCopyWithImpl(
      _$FavoriteSongStatusLoadingStateImpl _value,
      $Res Function(_$FavoriteSongStatusLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteSongStatusLoadingStateImpl
    implements FavoriteSongStatusLoadingState {
  const _$FavoriteSongStatusLoadingStateImpl();

  @override
  String toString() {
    return 'FavoriteSongStatusState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongStatusLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
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
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongStatusLoadingState
    implements FavoriteSongStatusState {
  const factory FavoriteSongStatusLoadingState() =
      _$FavoriteSongStatusLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetFavoriteSongStatusSuccessStateImplCopyWith<$Res> {
  factory _$$GetFavoriteSongStatusSuccessStateImplCopyWith(
          _$GetFavoriteSongStatusSuccessStateImpl value,
          $Res Function(_$GetFavoriteSongStatusSuccessStateImpl) then) =
      __$$GetFavoriteSongStatusSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class __$$GetFavoriteSongStatusSuccessStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusStateCopyWithImpl<$Res,
        _$GetFavoriteSongStatusSuccessStateImpl>
    implements _$$GetFavoriteSongStatusSuccessStateImplCopyWith<$Res> {
  __$$GetFavoriteSongStatusSuccessStateImplCopyWithImpl(
      _$GetFavoriteSongStatusSuccessStateImpl _value,
      $Res Function(_$GetFavoriteSongStatusSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
  }) {
    return _then(_$GetFavoriteSongStatusSuccessStateImpl(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetFavoriteSongStatusSuccessStateImpl
    implements GetFavoriteSongStatusSuccessState {
  const _$GetFavoriteSongStatusSuccessStateImpl({required this.isFavorite});

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteSongStatusState.success(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavoriteSongStatusSuccessStateImpl &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFavoriteSongStatusSuccessStateImplCopyWith<
          _$GetFavoriteSongStatusSuccessStateImpl>
      get copyWith => __$$GetFavoriteSongStatusSuccessStateImplCopyWithImpl<
          _$GetFavoriteSongStatusSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) {
    return success(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteSongStatusSuccessState
    implements FavoriteSongStatusState {
  const factory GetFavoriteSongStatusSuccessState(
          {required final bool isFavorite}) =
      _$GetFavoriteSongStatusSuccessStateImpl;

  bool get isFavorite;
  @JsonKey(ignore: true)
  _$$GetFavoriteSongStatusSuccessStateImplCopyWith<
          _$GetFavoriteSongStatusSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteSongStatusErrorStateImplCopyWith<$Res> {
  factory _$$FavoriteSongStatusErrorStateImplCopyWith(
          _$FavoriteSongStatusErrorStateImpl value,
          $Res Function(_$FavoriteSongStatusErrorStateImpl) then) =
      __$$FavoriteSongStatusErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FavoriteSongStatusErrorStateImplCopyWithImpl<$Res>
    extends _$FavoriteSongStatusStateCopyWithImpl<$Res,
        _$FavoriteSongStatusErrorStateImpl>
    implements _$$FavoriteSongStatusErrorStateImplCopyWith<$Res> {
  __$$FavoriteSongStatusErrorStateImplCopyWithImpl(
      _$FavoriteSongStatusErrorStateImpl _value,
      $Res Function(_$FavoriteSongStatusErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FavoriteSongStatusErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteSongStatusErrorStateImpl
    implements FavoriteSongStatusErrorState {
  const _$FavoriteSongStatusErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteSongStatusState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSongStatusErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSongStatusErrorStateImplCopyWith<
          _$FavoriteSongStatusErrorStateImpl>
      get copyWith => __$$FavoriteSongStatusErrorStateImplCopyWithImpl<
          _$FavoriteSongStatusErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
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
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoriteSongStatusErrorState implements FavoriteSongStatusState {
  const factory FavoriteSongStatusErrorState({required final String message}) =
      _$FavoriteSongStatusErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FavoriteSongStatusErrorStateImplCopyWith<
          _$FavoriteSongStatusErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
