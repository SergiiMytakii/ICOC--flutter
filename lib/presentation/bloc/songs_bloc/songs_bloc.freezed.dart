// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SongsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsEvent()';
  }
}

/// @nodoc
class $SongsEventCopyWith<$Res> {
  $SongsEventCopyWith(SongsEvent _, $Res Function(SongsEvent) __);
}

/// Adds pattern-matching-related methods to [SongsEvent].
extension SongsEventPatterns on SongsEvent {
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
    TResult Function(_SongsRequested value)? songsRequested,
    TResult Function(_SearchSongByNumber value)? searchByNumber,
    TResult Function(_SearchSongByText value)? searchByText,
    TResult Function(_SearchSongClear value)? clearSearch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested() when songsRequested != null:
        return songsRequested(_that);
      case _SearchSongByNumber() when searchByNumber != null:
        return searchByNumber(_that);
      case _SearchSongByText() when searchByText != null:
        return searchByText(_that);
      case _SearchSongClear() when clearSearch != null:
        return clearSearch(_that);
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
    required TResult Function(_SongsRequested value) songsRequested,
    required TResult Function(_SearchSongByNumber value) searchByNumber,
    required TResult Function(_SearchSongByText value) searchByText,
    required TResult Function(_SearchSongClear value) clearSearch,
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested():
        return songsRequested(_that);
      case _SearchSongByNumber():
        return searchByNumber(_that);
      case _SearchSongByText():
        return searchByText(_that);
      case _SearchSongClear():
        return clearSearch(_that);
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
    TResult? Function(_SongsRequested value)? songsRequested,
    TResult? Function(_SearchSongByNumber value)? searchByNumber,
    TResult? Function(_SearchSongByText value)? searchByText,
    TResult? Function(_SearchSongClear value)? clearSearch,
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested() when songsRequested != null:
        return songsRequested(_that);
      case _SearchSongByNumber() when searchByNumber != null:
        return searchByNumber(_that);
      case _SearchSongByText() when searchByText != null:
        return searchByText(_that);
      case _SearchSongClear() when clearSearch != null:
        return clearSearch(_that);
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
    TResult Function()? songsRequested,
    TResult Function(String query)? searchByNumber,
    TResult Function(String query)? searchByText,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested() when songsRequested != null:
        return songsRequested();
      case _SearchSongByNumber() when searchByNumber != null:
        return searchByNumber(_that.query);
      case _SearchSongByText() when searchByText != null:
        return searchByText(_that.query);
      case _SearchSongClear() when clearSearch != null:
        return clearSearch();
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
    required TResult Function() songsRequested,
    required TResult Function(String query) searchByNumber,
    required TResult Function(String query) searchByText,
    required TResult Function() clearSearch,
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested():
        return songsRequested();
      case _SearchSongByNumber():
        return searchByNumber(_that.query);
      case _SearchSongByText():
        return searchByText(_that.query);
      case _SearchSongClear():
        return clearSearch();
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
    TResult? Function()? songsRequested,
    TResult? Function(String query)? searchByNumber,
    TResult? Function(String query)? searchByText,
    TResult? Function()? clearSearch,
  }) {
    final _that = this;
    switch (_that) {
      case _SongsRequested() when songsRequested != null:
        return songsRequested();
      case _SearchSongByNumber() when searchByNumber != null:
        return searchByNumber(_that.query);
      case _SearchSongByText() when searchByText != null:
        return searchByText(_that.query);
      case _SearchSongClear() when clearSearch != null:
        return clearSearch();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SongsRequested implements SongsEvent {
  const _SongsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SongsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsEvent.songsRequested()';
  }
}

/// @nodoc

class _SearchSongByNumber implements SongsEvent {
  const _SearchSongByNumber(this.query);

  final String query;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchSongByNumberCopyWith<_SearchSongByNumber> get copyWith =>
      __$SearchSongByNumberCopyWithImpl<_SearchSongByNumber>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchSongByNumber &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SongsEvent.searchByNumber(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchSongByNumberCopyWith<$Res>
    implements $SongsEventCopyWith<$Res> {
  factory _$SearchSongByNumberCopyWith(
          _SearchSongByNumber value, $Res Function(_SearchSongByNumber) _then) =
      __$SearchSongByNumberCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchSongByNumberCopyWithImpl<$Res>
    implements _$SearchSongByNumberCopyWith<$Res> {
  __$SearchSongByNumberCopyWithImpl(this._self, this._then);

  final _SearchSongByNumber _self;
  final $Res Function(_SearchSongByNumber) _then;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchSongByNumber(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SearchSongByText implements SongsEvent {
  const _SearchSongByText(this.query);

  final String query;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchSongByTextCopyWith<_SearchSongByText> get copyWith =>
      __$SearchSongByTextCopyWithImpl<_SearchSongByText>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchSongByText &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SongsEvent.searchByText(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchSongByTextCopyWith<$Res>
    implements $SongsEventCopyWith<$Res> {
  factory _$SearchSongByTextCopyWith(
          _SearchSongByText value, $Res Function(_SearchSongByText) _then) =
      __$SearchSongByTextCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchSongByTextCopyWithImpl<$Res>
    implements _$SearchSongByTextCopyWith<$Res> {
  __$SearchSongByTextCopyWithImpl(this._self, this._then);

  final _SearchSongByText _self;
  final $Res Function(_SearchSongByText) _then;

  /// Create a copy of SongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchSongByText(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SearchSongClear implements SongsEvent {
  const _SearchSongClear();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchSongClear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsEvent.clearSearch()';
  }
}

/// @nodoc
mixin _$SongsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SongsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsState()';
  }
}

/// @nodoc
class $SongsStateCopyWith<$Res> {
  $SongsStateCopyWith(SongsState _, $Res Function(SongsState) __);
}

/// Adds pattern-matching-related methods to [SongsState].
extension SongsStatePatterns on SongsState {
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
    TResult Function(SongsInitial value)? initial,
    TResult Function(SongsLoadingState value)? loading,
    TResult Function(EmptySongsState value)? empty,
    TResult Function(GetSongsSuccessState value)? success,
    TResult Function(SearchSongsSuccessState value)? searchSuccess,
    TResult Function(SongsErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial() when initial != null:
        return initial(_that);
      case SongsLoadingState() when loading != null:
        return loading(_that);
      case EmptySongsState() when empty != null:
        return empty(_that);
      case GetSongsSuccessState() when success != null:
        return success(_that);
      case SearchSongsSuccessState() when searchSuccess != null:
        return searchSuccess(_that);
      case SongsErrorState() when error != null:
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
    required TResult Function(SongsInitial value) initial,
    required TResult Function(SongsLoadingState value) loading,
    required TResult Function(EmptySongsState value) empty,
    required TResult Function(GetSongsSuccessState value) success,
    required TResult Function(SearchSongsSuccessState value) searchSuccess,
    required TResult Function(SongsErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial():
        return initial(_that);
      case SongsLoadingState():
        return loading(_that);
      case EmptySongsState():
        return empty(_that);
      case GetSongsSuccessState():
        return success(_that);
      case SearchSongsSuccessState():
        return searchSuccess(_that);
      case SongsErrorState():
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
    TResult? Function(SongsInitial value)? initial,
    TResult? Function(SongsLoadingState value)? loading,
    TResult? Function(EmptySongsState value)? empty,
    TResult? Function(GetSongsSuccessState value)? success,
    TResult? Function(SearchSongsSuccessState value)? searchSuccess,
    TResult? Function(SongsErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial() when initial != null:
        return initial(_that);
      case SongsLoadingState() when loading != null:
        return loading(_that);
      case EmptySongsState() when empty != null:
        return empty(_that);
      case GetSongsSuccessState() when success != null:
        return success(_that);
      case SearchSongsSuccessState() when searchSuccess != null:
        return searchSuccess(_that);
      case SongsErrorState() when error != null:
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
    TResult Function()? empty,
    TResult Function(List<SongModel> songs)? success,
    TResult Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial() when initial != null:
        return initial();
      case SongsLoadingState() when loading != null:
        return loading();
      case EmptySongsState() when empty != null:
        return empty();
      case GetSongsSuccessState() when success != null:
        return success(_that.songs);
      case SearchSongsSuccessState() when searchSuccess != null:
        return searchSuccess(_that.songVersions);
      case SongsErrorState() when error != null:
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
    required TResult Function() empty,
    required TResult Function(List<SongModel> songs) success,
    required TResult Function(List<SongVersionLocal> songVersions)
        searchSuccess,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial():
        return initial();
      case SongsLoadingState():
        return loading();
      case EmptySongsState():
        return empty();
      case GetSongsSuccessState():
        return success(_that.songs);
      case SearchSongsSuccessState():
        return searchSuccess(_that.songVersions);
      case SongsErrorState():
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
    TResult? Function()? empty,
    TResult? Function(List<SongModel> songs)? success,
    TResult? Function(List<SongVersionLocal> songVersions)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SongsInitial() when initial != null:
        return initial();
      case SongsLoadingState() when loading != null:
        return loading();
      case EmptySongsState() when empty != null:
        return empty();
      case GetSongsSuccessState() when success != null:
        return success(_that.songs);
      case SearchSongsSuccessState() when searchSuccess != null:
        return searchSuccess(_that.songVersions);
      case SongsErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SongsInitial implements SongsState {
  const SongsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SongsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsState.initial()';
  }
}

/// @nodoc

class SongsLoadingState implements SongsState {
  const SongsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SongsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsState.loading()';
  }
}

/// @nodoc

class EmptySongsState implements SongsState {
  const EmptySongsState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptySongsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SongsState.empty()';
  }
}

/// @nodoc

class GetSongsSuccessState implements SongsState {
  const GetSongsSuccessState(final List<SongModel> songs) : _songs = songs;

  final List<SongModel> _songs;
  List<SongModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSongsSuccessStateCopyWith<GetSongsSuccessState> get copyWith =>
      _$GetSongsSuccessStateCopyWithImpl<GetSongsSuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSongsSuccessState &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @override
  String toString() {
    return 'SongsState.success(songs: $songs)';
  }
}

/// @nodoc
abstract mixin class $GetSongsSuccessStateCopyWith<$Res>
    implements $SongsStateCopyWith<$Res> {
  factory $GetSongsSuccessStateCopyWith(GetSongsSuccessState value,
          $Res Function(GetSongsSuccessState) _then) =
      _$GetSongsSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<SongModel> songs});
}

/// @nodoc
class _$GetSongsSuccessStateCopyWithImpl<$Res>
    implements $GetSongsSuccessStateCopyWith<$Res> {
  _$GetSongsSuccessStateCopyWithImpl(this._self, this._then);

  final GetSongsSuccessState _self;
  final $Res Function(GetSongsSuccessState) _then;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? songs = null,
  }) {
    return _then(GetSongsSuccessState(
      null == songs
          ? _self._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class SearchSongsSuccessState implements SongsState {
  const SearchSongsSuccessState(final List<SongVersionLocal> songVersions)
      : _songVersions = songVersions;

  final List<SongVersionLocal> _songVersions;
  List<SongVersionLocal> get songVersions {
    if (_songVersions is EqualUnmodifiableListView) return _songVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songVersions);
  }

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchSongsSuccessStateCopyWith<SearchSongsSuccessState> get copyWith =>
      _$SearchSongsSuccessStateCopyWithImpl<SearchSongsSuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchSongsSuccessState &&
            const DeepCollectionEquality()
                .equals(other._songVersions, _songVersions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songVersions));

  @override
  String toString() {
    return 'SongsState.searchSuccess(songVersions: $songVersions)';
  }
}

/// @nodoc
abstract mixin class $SearchSongsSuccessStateCopyWith<$Res>
    implements $SongsStateCopyWith<$Res> {
  factory $SearchSongsSuccessStateCopyWith(SearchSongsSuccessState value,
          $Res Function(SearchSongsSuccessState) _then) =
      _$SearchSongsSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<SongVersionLocal> songVersions});
}

/// @nodoc
class _$SearchSongsSuccessStateCopyWithImpl<$Res>
    implements $SearchSongsSuccessStateCopyWith<$Res> {
  _$SearchSongsSuccessStateCopyWithImpl(this._self, this._then);

  final SearchSongsSuccessState _self;
  final $Res Function(SearchSongsSuccessState) _then;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? songVersions = null,
  }) {
    return _then(SearchSongsSuccessState(
      null == songVersions
          ? _self._songVersions
          : songVersions // ignore: cast_nullable_to_non_nullable
              as List<SongVersionLocal>,
    ));
  }
}

/// @nodoc

class SongsErrorState implements SongsState {
  const SongsErrorState(this.message);

  final String message;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongsErrorStateCopyWith<SongsErrorState> get copyWith =>
      _$SongsErrorStateCopyWithImpl<SongsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SongsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SongsErrorStateCopyWith<$Res>
    implements $SongsStateCopyWith<$Res> {
  factory $SongsErrorStateCopyWith(
          SongsErrorState value, $Res Function(SongsErrorState) _then) =
      _$SongsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SongsErrorStateCopyWithImpl<$Res>
    implements $SongsErrorStateCopyWith<$Res> {
  _$SongsErrorStateCopyWithImpl(this._self, this._then);

  final SongsErrorState _self;
  final $Res Function(SongsErrorState) _then;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SongsErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
