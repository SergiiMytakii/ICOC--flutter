// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_songs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteSongsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteSongsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongsEvent()';
  }
}

/// @nodoc
class $FavoriteSongsEventCopyWith<$Res> {
  $FavoriteSongsEventCopyWith(
      FavoriteSongsEvent _, $Res Function(FavoriteSongsEvent) __);
}

/// Adds pattern-matching-related methods to [FavoriteSongsEvent].
extension FavoriteSongsEventPatterns on FavoriteSongsEvent {
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
    TResult Function(FavoriteSongsListRequested value)? getRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested() when getRequested != null:
        return getRequested(_that);
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
    required TResult Function(FavoriteSongsListRequested value) getRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested():
        return getRequested(_that);
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
    TResult? Function(FavoriteSongsListRequested value)? getRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested() when getRequested != null:
        return getRequested(_that);
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
    TResult Function()? getRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested() when getRequested != null:
        return getRequested();
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
    required TResult Function() getRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested():
        return getRequested();
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
    TResult? Function()? getRequested,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsListRequested() when getRequested != null:
        return getRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class FavoriteSongsListRequested implements FavoriteSongsEvent {
  const FavoriteSongsListRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongsListRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongsEvent.getRequested()';
  }
}

/// @nodoc
mixin _$FavoriteSongsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteSongsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongsState()';
  }
}

/// @nodoc
class $FavoriteSongsStateCopyWith<$Res> {
  $FavoriteSongsStateCopyWith(
      FavoriteSongsState _, $Res Function(FavoriteSongsState) __);
}

/// Adds pattern-matching-related methods to [FavoriteSongsState].
extension FavoriteSongsStatePatterns on FavoriteSongsState {
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
    TResult Function(FavoriteSongsInitial value)? initial,
    TResult Function(FavoriteSongsLoadingState value)? loading,
    TResult Function(GetFavoriteSongsSuccessState value)? success,
    TResult Function(FavoriteSongsErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial() when initial != null:
        return initial(_that);
      case FavoriteSongsLoadingState() when loading != null:
        return loading(_that);
      case GetFavoriteSongsSuccessState() when success != null:
        return success(_that);
      case FavoriteSongsErrorState() when error != null:
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
    required TResult Function(FavoriteSongsInitial value) initial,
    required TResult Function(FavoriteSongsLoadingState value) loading,
    required TResult Function(GetFavoriteSongsSuccessState value) success,
    required TResult Function(FavoriteSongsErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial():
        return initial(_that);
      case FavoriteSongsLoadingState():
        return loading(_that);
      case GetFavoriteSongsSuccessState():
        return success(_that);
      case FavoriteSongsErrorState():
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
    TResult? Function(FavoriteSongsInitial value)? initial,
    TResult? Function(FavoriteSongsLoadingState value)? loading,
    TResult? Function(GetFavoriteSongsSuccessState value)? success,
    TResult? Function(FavoriteSongsErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial() when initial != null:
        return initial(_that);
      case FavoriteSongsLoadingState() when loading != null:
        return loading(_that);
      case GetFavoriteSongsSuccessState() when success != null:
        return success(_that);
      case FavoriteSongsErrorState() when error != null:
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
    TResult Function(List<SongModel> songs)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial() when initial != null:
        return initial();
      case FavoriteSongsLoadingState() when loading != null:
        return loading();
      case GetFavoriteSongsSuccessState() when success != null:
        return success(_that.songs);
      case FavoriteSongsErrorState() when error != null:
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
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial():
        return initial();
      case FavoriteSongsLoadingState():
        return loading();
      case GetFavoriteSongsSuccessState():
        return success(_that.songs);
      case FavoriteSongsErrorState():
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
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FavoriteSongsInitial() when initial != null:
        return initial();
      case FavoriteSongsLoadingState() when loading != null:
        return loading();
      case GetFavoriteSongsSuccessState() when success != null:
        return success(_that.songs);
      case FavoriteSongsErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FavoriteSongsInitial implements FavoriteSongsState {
  const FavoriteSongsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteSongsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongsState.initial()';
  }
}

/// @nodoc

class FavoriteSongsLoadingState implements FavoriteSongsState {
  const FavoriteSongsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteSongsState.loading()';
  }
}

/// @nodoc

class GetFavoriteSongsSuccessState implements FavoriteSongsState {
  const GetFavoriteSongsSuccessState(final List<SongModel> songs)
      : _songs = songs;

  final List<SongModel> _songs;
  List<SongModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  /// Create a copy of FavoriteSongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetFavoriteSongsSuccessStateCopyWith<GetFavoriteSongsSuccessState>
      get copyWith => _$GetFavoriteSongsSuccessStateCopyWithImpl<
          GetFavoriteSongsSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetFavoriteSongsSuccessState &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @override
  String toString() {
    return 'FavoriteSongsState.success(songs: $songs)';
  }
}

/// @nodoc
abstract mixin class $GetFavoriteSongsSuccessStateCopyWith<$Res>
    implements $FavoriteSongsStateCopyWith<$Res> {
  factory $GetFavoriteSongsSuccessStateCopyWith(
          GetFavoriteSongsSuccessState value,
          $Res Function(GetFavoriteSongsSuccessState) _then) =
      _$GetFavoriteSongsSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<SongModel> songs});
}

/// @nodoc
class _$GetFavoriteSongsSuccessStateCopyWithImpl<$Res>
    implements $GetFavoriteSongsSuccessStateCopyWith<$Res> {
  _$GetFavoriteSongsSuccessStateCopyWithImpl(this._self, this._then);

  final GetFavoriteSongsSuccessState _self;
  final $Res Function(GetFavoriteSongsSuccessState) _then;

  /// Create a copy of FavoriteSongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? songs = null,
  }) {
    return _then(GetFavoriteSongsSuccessState(
      null == songs
          ? _self._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class FavoriteSongsErrorState implements FavoriteSongsState {
  const FavoriteSongsErrorState(this.message);

  final String message;

  /// Create a copy of FavoriteSongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteSongsErrorStateCopyWith<FavoriteSongsErrorState> get copyWith =>
      _$FavoriteSongsErrorStateCopyWithImpl<FavoriteSongsErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteSongsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FavoriteSongsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FavoriteSongsErrorStateCopyWith<$Res>
    implements $FavoriteSongsStateCopyWith<$Res> {
  factory $FavoriteSongsErrorStateCopyWith(FavoriteSongsErrorState value,
          $Res Function(FavoriteSongsErrorState) _then) =
      _$FavoriteSongsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FavoriteSongsErrorStateCopyWithImpl<$Res>
    implements $FavoriteSongsErrorStateCopyWith<$Res> {
  _$FavoriteSongsErrorStateCopyWithImpl(this._self, this._then);

  final FavoriteSongsErrorState _self;
  final $Res Function(FavoriteSongsErrorState) _then;

  /// Create a copy of FavoriteSongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FavoriteSongsErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
