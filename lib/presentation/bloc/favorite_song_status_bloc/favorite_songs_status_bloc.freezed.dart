// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_songs_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteSongStatusEvent {
  int get id;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteSongStatusEventCopyWith<FavoriteSongStatusEvent> get copyWith =>
      _$FavoriteSongStatusEventCopyWithImpl<FavoriteSongStatusEvent>(
          this as FavoriteSongStatusEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongStatusEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'FavoriteSongStatusEvent(id: $id)';
  }
}

/// @nodoc
abstract mixin class $FavoriteSongStatusEventCopyWith<$Res> {
  factory $FavoriteSongStatusEventCopyWith(FavoriteSongStatusEvent value,
          $Res Function(FavoriteSongStatusEvent) _then) =
      _$FavoriteSongStatusEventCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FavoriteSongStatusEventCopyWithImpl<$Res>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  _$FavoriteSongStatusEventCopyWithImpl(this._self, this._then);

  final FavoriteSongStatusEvent _self;
  final $Res Function(FavoriteSongStatusEvent) _then;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoriteSongStatusEvent].
extension FavoriteSongStatusEventPatterns on FavoriteSongStatusEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested() when statusRequested != null:
        return statusRequested(_that);
      case SetFavoriteSongStatusRequested() when setStatusRequested != null:
        return setStatusRequested(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusRequested value)
        statusRequested,
    required TResult Function(SetFavoriteSongStatusRequested value)
        setStatusRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested():
        return statusRequested(_that);
      case SetFavoriteSongStatusRequested():
        return setStatusRequested(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusRequested value)? statusRequested,
    TResult? Function(SetFavoriteSongStatusRequested value)? setStatusRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested() when statusRequested != null:
        return statusRequested(_that);
      case SetFavoriteSongStatusRequested() when setStatusRequested != null:
        return setStatusRequested(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? statusRequested,
    TResult Function(int id, bool isFavorite)? setStatusRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested() when statusRequested != null:
        return statusRequested(_that.id);
      case SetFavoriteSongStatusRequested() when setStatusRequested != null:
        return setStatusRequested(_that.id, _that.isFavorite);
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
  TResult when<TResult extends Object?>({
    required TResult Function(int id) statusRequested,
    required TResult Function(int id, bool isFavorite) setStatusRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested():
        return statusRequested(_that.id);
      case SetFavoriteSongStatusRequested():
        return setStatusRequested(_that.id, _that.isFavorite);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? statusRequested,
    TResult? Function(int id, bool isFavorite)? setStatusRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusRequested() when statusRequested != null:
        return statusRequested(_that.id);
      case SetFavoriteSongStatusRequested() when setStatusRequested != null:
        return setStatusRequested(_that.id, _that.isFavorite);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FavoriteSongStatusRequested implements FavoriteSongStatusEvent {
  const FavoriteSongStatusRequested({required this.id});

  @override
  final int id;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteSongStatusRequestedCopyWith<FavoriteSongStatusRequested>
      get copyWith => _$FavoriteSongStatusRequestedCopyWithImpl<
          FavoriteSongStatusRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongStatusRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'FavoriteSongStatusEvent.statusRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $FavoriteSongStatusRequestedCopyWith<$Res>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  factory $FavoriteSongStatusRequestedCopyWith(
          FavoriteSongStatusRequested value,
          $Res Function(FavoriteSongStatusRequested) _then) =
      _$FavoriteSongStatusRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FavoriteSongStatusRequestedCopyWithImpl<$Res>
    implements $FavoriteSongStatusRequestedCopyWith<$Res> {
  _$FavoriteSongStatusRequestedCopyWithImpl(this._self, this._then);

  final FavoriteSongStatusRequested _self;
  final $Res Function(FavoriteSongStatusRequested) _then;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(FavoriteSongStatusRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SetFavoriteSongStatusRequested implements FavoriteSongStatusEvent {
  const SetFavoriteSongStatusRequested(
      {required this.id, required this.isFavorite});

  @override
  final int id;
  final bool isFavorite;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetFavoriteSongStatusRequestedCopyWith<SetFavoriteSongStatusRequested>
      get copyWith => _$SetFavoriteSongStatusRequestedCopyWithImpl<
          SetFavoriteSongStatusRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetFavoriteSongStatusRequested &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isFavorite);

  @override
  String toString() {
    return 'FavoriteSongStatusEvent.setStatusRequested(id: $id, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $SetFavoriteSongStatusRequestedCopyWith<$Res>
    implements $FavoriteSongStatusEventCopyWith<$Res> {
  factory $SetFavoriteSongStatusRequestedCopyWith(
          SetFavoriteSongStatusRequested value,
          $Res Function(SetFavoriteSongStatusRequested) _then) =
      _$SetFavoriteSongStatusRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({int id, bool isFavorite});
}

/// @nodoc
class _$SetFavoriteSongStatusRequestedCopyWithImpl<$Res>
    implements $SetFavoriteSongStatusRequestedCopyWith<$Res> {
  _$SetFavoriteSongStatusRequestedCopyWithImpl(this._self, this._then);

  final SetFavoriteSongStatusRequested _self;
  final $Res Function(SetFavoriteSongStatusRequested) _then;

  /// Create a copy of FavoriteSongStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
  }) {
    return _then(SetFavoriteSongStatusRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FavoriteSongStatusState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteSongStatusState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongStatusState()';
  }
}

/// @nodoc
class $FavoriteSongStatusStateCopyWith<$Res> {
  $FavoriteSongStatusStateCopyWith(
      FavoriteSongStatusState _, $Res Function(FavoriteSongStatusState) __);
}

/// Adds pattern-matching-related methods to [FavoriteSongStatusState].
extension FavoriteSongStatusStatePatterns on FavoriteSongStatusState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteSongStatusInitial value)? initial,
    TResult Function(FavoriteSongStatusLoadingState value)? loading,
    TResult Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult Function(FavoriteSongStatusErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial() when initial != null:
        return initial(_that);
      case FavoriteSongStatusLoadingState() when loading != null:
        return loading(_that);
      case GetFavoriteSongStatusSuccessState() when success != null:
        return success(_that);
      case FavoriteSongStatusErrorState() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteSongStatusInitial value) initial,
    required TResult Function(FavoriteSongStatusLoadingState value) loading,
    required TResult Function(GetFavoriteSongStatusSuccessState value) success,
    required TResult Function(FavoriteSongStatusErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial():
        return initial(_that);
      case FavoriteSongStatusLoadingState():
        return loading(_that);
      case GetFavoriteSongStatusSuccessState():
        return success(_that);
      case FavoriteSongStatusErrorState():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteSongStatusInitial value)? initial,
    TResult? Function(FavoriteSongStatusLoadingState value)? loading,
    TResult? Function(GetFavoriteSongStatusSuccessState value)? success,
    TResult? Function(FavoriteSongStatusErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial() when initial != null:
        return initial(_that);
      case FavoriteSongStatusLoadingState() when loading != null:
        return loading(_that);
      case GetFavoriteSongStatusSuccessState() when success != null:
        return success(_that);
      case FavoriteSongStatusErrorState() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isFavorite)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial() when initial != null:
        return initial();
      case FavoriteSongStatusLoadingState() when loading != null:
        return loading();
      case GetFavoriteSongStatusSuccessState() when success != null:
        return success(_that.isFavorite);
      case FavoriteSongStatusErrorState() when error != null:
        return error(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isFavorite) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial():
        return initial();
      case FavoriteSongStatusLoadingState():
        return loading();
      case GetFavoriteSongStatusSuccessState():
        return success(_that.isFavorite);
      case FavoriteSongStatusErrorState():
        return error(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongStatusInitial() when initial != null:
        return initial();
      case FavoriteSongStatusLoadingState() when loading != null:
        return loading();
      case GetFavoriteSongStatusSuccessState() when success != null:
        return success(_that.isFavorite);
      case FavoriteSongStatusErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FavoriteSongStatusInitial implements FavoriteSongStatusState {
  const FavoriteSongStatusInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongStatusInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongStatusState.initial()';
  }
}

/// @nodoc

class FavoriteSongStatusLoadingState implements FavoriteSongStatusState {
  const FavoriteSongStatusLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongStatusLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongStatusState.loading()';
  }
}

/// @nodoc

class GetFavoriteSongStatusSuccessState implements FavoriteSongStatusState {
  const GetFavoriteSongStatusSuccessState({required this.isFavorite});

  final bool isFavorite;

  /// Create a copy of FavoriteSongStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetFavoriteSongStatusSuccessStateCopyWith<GetFavoriteSongStatusSuccessState>
      get copyWith => _$GetFavoriteSongStatusSuccessStateCopyWithImpl<
          GetFavoriteSongStatusSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetFavoriteSongStatusSuccessState &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite);

  @override
  String toString() {
    return 'FavoriteSongStatusState.success(isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $GetFavoriteSongStatusSuccessStateCopyWith<$Res>
    implements $FavoriteSongStatusStateCopyWith<$Res> {
  factory $GetFavoriteSongStatusSuccessStateCopyWith(
          GetFavoriteSongStatusSuccessState value,
          $Res Function(GetFavoriteSongStatusSuccessState) _then) =
      _$GetFavoriteSongStatusSuccessStateCopyWithImpl;
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class _$GetFavoriteSongStatusSuccessStateCopyWithImpl<$Res>
    implements $GetFavoriteSongStatusSuccessStateCopyWith<$Res> {
  _$GetFavoriteSongStatusSuccessStateCopyWithImpl(this._self, this._then);

  final GetFavoriteSongStatusSuccessState _self;
  final $Res Function(GetFavoriteSongStatusSuccessState) _then;

  /// Create a copy of FavoriteSongStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFavorite = null,
  }) {
    return _then(GetFavoriteSongStatusSuccessState(
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class FavoriteSongStatusErrorState implements FavoriteSongStatusState {
  const FavoriteSongStatusErrorState({required this.message});

  final String message;

  /// Create a copy of FavoriteSongStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteSongStatusErrorStateCopyWith<FavoriteSongStatusErrorState>
      get copyWith => _$FavoriteSongStatusErrorStateCopyWithImpl<
          FavoriteSongStatusErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongStatusErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FavoriteSongStatusState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FavoriteSongStatusErrorStateCopyWith<$Res>
    implements $FavoriteSongStatusStateCopyWith<$Res> {
  factory $FavoriteSongStatusErrorStateCopyWith(
          FavoriteSongStatusErrorState value,
          $Res Function(FavoriteSongStatusErrorState) _then) =
      _$FavoriteSongStatusErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FavoriteSongStatusErrorStateCopyWithImpl<$Res>
    implements $FavoriteSongStatusErrorStateCopyWith<$Res> {
  _$FavoriteSongStatusErrorStateCopyWithImpl(this._self, this._then);

  final FavoriteSongStatusErrorState _self;
  final $Res Function(FavoriteSongStatusErrorState) _then;

  /// Create a copy of FavoriteSongStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FavoriteSongStatusErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
