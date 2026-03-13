// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoEvent()';
  }
}

/// @nodoc
class $VideoEventCopyWith<$Res> {
  $VideoEventCopyWith(VideoEvent _, $Res Function(VideoEvent) __);
}

/// Adds pattern-matching-related methods to [VideoEvent].
extension VideoEventPatterns on VideoEvent {
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
    TResult Function(VideoListRequested value)? listRequested,
    TResult Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested() when listRequested != null:
        return listRequested(_that);
      case GetVideosFromPlaylist() when getVideosFromPlaylist != null:
        return getVideosFromPlaylist(_that);
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
    required TResult Function(VideoListRequested value) listRequested,
    required TResult Function(GetVideosFromPlaylist value)
        getVideosFromPlaylist,
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested():
        return listRequested(_that);
      case GetVideosFromPlaylist():
        return getVideosFromPlaylist(_that);
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
    TResult? Function(VideoListRequested value)? listRequested,
    TResult? Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested() when listRequested != null:
        return listRequested(_that);
      case GetVideosFromPlaylist() when getVideosFromPlaylist != null:
        return getVideosFromPlaylist(_that);
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
    TResult Function()? listRequested,
    TResult Function(String playlistId)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested() when listRequested != null:
        return listRequested();
      case GetVideosFromPlaylist() when getVideosFromPlaylist != null:
        return getVideosFromPlaylist(_that.playlistId);
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
    required TResult Function() listRequested,
    required TResult Function(String playlistId) getVideosFromPlaylist,
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested():
        return listRequested();
      case GetVideosFromPlaylist():
        return getVideosFromPlaylist(_that.playlistId);
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
    TResult? Function()? listRequested,
    TResult? Function(String playlistId)? getVideosFromPlaylist,
  }) {
    final _that = this;
    switch (_that) {
      case VideoListRequested() when listRequested != null:
        return listRequested();
      case GetVideosFromPlaylist() when getVideosFromPlaylist != null:
        return getVideosFromPlaylist(_that.playlistId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class VideoListRequested implements VideoEvent {
  const VideoListRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoListRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoEvent.listRequested()';
  }
}

/// @nodoc

class GetVideosFromPlaylist implements VideoEvent {
  const GetVideosFromPlaylist({required this.playlistId});

  final String playlistId;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetVideosFromPlaylistCopyWith<GetVideosFromPlaylist> get copyWith =>
      _$GetVideosFromPlaylistCopyWithImpl<GetVideosFromPlaylist>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetVideosFromPlaylist &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId);

  @override
  String toString() {
    return 'VideoEvent.getVideosFromPlaylist(playlistId: $playlistId)';
  }
}

/// @nodoc
abstract mixin class $GetVideosFromPlaylistCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory $GetVideosFromPlaylistCopyWith(GetVideosFromPlaylist value,
          $Res Function(GetVideosFromPlaylist) _then) =
      _$GetVideosFromPlaylistCopyWithImpl;
  @useResult
  $Res call({String playlistId});
}

/// @nodoc
class _$GetVideosFromPlaylistCopyWithImpl<$Res>
    implements $GetVideosFromPlaylistCopyWith<$Res> {
  _$GetVideosFromPlaylistCopyWithImpl(this._self, this._then);

  final GetVideosFromPlaylist _self;
  final $Res Function(GetVideosFromPlaylist) _then;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playlistId = null,
  }) {
    return _then(GetVideosFromPlaylist(
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VideoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoState()';
  }
}

/// @nodoc
class $VideoStateCopyWith<$Res> {
  $VideoStateCopyWith(VideoState _, $Res Function(VideoState) __);
}

/// Adds pattern-matching-related methods to [VideoState].
extension VideoStatePatterns on VideoState {
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
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(VideoEmptyState value)? empty,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial() when initial != null:
        return initial(_that);
      case VideoLoadingState() when loading != null:
        return loading(_that);
      case VideoEmptyState() when empty != null:
        return empty(_that);
      case GetVideoListSuccessState() when getVideoListSuccess != null:
        return getVideoListSuccess(_that);
      case GetVideosFromPlaylistSuccessState()
          when getVideosFromPlaylistSuccess != null:
        return getVideosFromPlaylistSuccess(_that);
      case VideoErrorState() when error != null:
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
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(VideoEmptyState value) empty,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial():
        return initial(_that);
      case VideoLoadingState():
        return loading(_that);
      case VideoEmptyState():
        return empty(_that);
      case GetVideoListSuccessState():
        return getVideoListSuccess(_that);
      case GetVideosFromPlaylistSuccessState():
        return getVideosFromPlaylistSuccess(_that);
      case VideoErrorState():
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
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(VideoEmptyState value)? empty,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial() when initial != null:
        return initial(_that);
      case VideoLoadingState() when loading != null:
        return loading(_that);
      case VideoEmptyState() when empty != null:
        return empty(_that);
      case GetVideoListSuccessState() when getVideoListSuccess != null:
        return getVideoListSuccess(_that);
      case GetVideosFromPlaylistSuccessState()
          when getVideosFromPlaylistSuccess != null:
        return getVideosFromPlaylistSuccess(_that);
      case VideoErrorState() when error != null:
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
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial() when initial != null:
        return initial();
      case VideoLoadingState() when loading != null:
        return loading();
      case VideoEmptyState() when empty != null:
        return empty();
      case GetVideoListSuccessState() when getVideoListSuccess != null:
        return getVideoListSuccess(_that.topics);
      case GetVideosFromPlaylistSuccessState()
          when getVideosFromPlaylistSuccess != null:
        return getVideosFromPlaylistSuccess(_that.youtubeVideos);
      case VideoErrorState() when error != null:
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
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial():
        return initial();
      case VideoLoadingState():
        return loading();
      case VideoEmptyState():
        return empty();
      case GetVideoListSuccessState():
        return getVideoListSuccess(_that.topics);
      case GetVideosFromPlaylistSuccessState():
        return getVideosFromPlaylistSuccess(_that.youtubeVideos);
      case VideoErrorState():
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
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case VideoInitial() when initial != null:
        return initial();
      case VideoLoadingState() when loading != null:
        return loading();
      case VideoEmptyState() when empty != null:
        return empty();
      case GetVideoListSuccessState() when getVideoListSuccess != null:
        return getVideoListSuccess(_that.topics);
      case GetVideosFromPlaylistSuccessState()
          when getVideosFromPlaylistSuccess != null:
        return getVideosFromPlaylistSuccess(_that.youtubeVideos);
      case VideoErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class VideoInitial implements VideoState {
  const VideoInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoState.initial()';
  }
}

/// @nodoc

class VideoLoadingState implements VideoState {
  const VideoLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoState.loading()';
  }
}

/// @nodoc

class VideoEmptyState implements VideoState {
  const VideoEmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoState.empty()';
  }
}

/// @nodoc

class GetVideoListSuccessState implements VideoState {
  const GetVideoListSuccessState(final List<Playlist> topics)
      : _topics = topics;

  final List<Playlist> _topics;
  List<Playlist> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetVideoListSuccessStateCopyWith<GetVideoListSuccessState> get copyWith =>
      _$GetVideoListSuccessStateCopyWithImpl<GetVideoListSuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetVideoListSuccessState &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  @override
  String toString() {
    return 'VideoState.getVideoListSuccess(topics: $topics)';
  }
}

/// @nodoc
abstract mixin class $GetVideoListSuccessStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory $GetVideoListSuccessStateCopyWith(GetVideoListSuccessState value,
          $Res Function(GetVideoListSuccessState) _then) =
      _$GetVideoListSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<Playlist> topics});
}

/// @nodoc
class _$GetVideoListSuccessStateCopyWithImpl<$Res>
    implements $GetVideoListSuccessStateCopyWith<$Res> {
  _$GetVideoListSuccessStateCopyWithImpl(this._self, this._then);

  final GetVideoListSuccessState _self;
  final $Res Function(GetVideoListSuccessState) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topics = null,
  }) {
    return _then(GetVideoListSuccessState(
      null == topics
          ? _self._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ));
  }
}

/// @nodoc

class GetVideosFromPlaylistSuccessState implements VideoState {
  const GetVideosFromPlaylistSuccessState(
      final List<YoutubeVideo> youtubeVideos)
      : _youtubeVideos = youtubeVideos;

  final List<YoutubeVideo> _youtubeVideos;
  List<YoutubeVideo> get youtubeVideos {
    if (_youtubeVideos is EqualUnmodifiableListView) return _youtubeVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_youtubeVideos);
  }

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetVideosFromPlaylistSuccessStateCopyWith<GetVideosFromPlaylistSuccessState>
      get copyWith => _$GetVideosFromPlaylistSuccessStateCopyWithImpl<
          GetVideosFromPlaylistSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetVideosFromPlaylistSuccessState &&
            const DeepCollectionEquality()
                .equals(other._youtubeVideos, _youtubeVideos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_youtubeVideos));

  @override
  String toString() {
    return 'VideoState.getVideosFromPlaylistSuccess(youtubeVideos: $youtubeVideos)';
  }
}

/// @nodoc
abstract mixin class $GetVideosFromPlaylistSuccessStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory $GetVideosFromPlaylistSuccessStateCopyWith(
          GetVideosFromPlaylistSuccessState value,
          $Res Function(GetVideosFromPlaylistSuccessState) _then) =
      _$GetVideosFromPlaylistSuccessStateCopyWithImpl;
  @useResult
  $Res call({List<YoutubeVideo> youtubeVideos});
}

/// @nodoc
class _$GetVideosFromPlaylistSuccessStateCopyWithImpl<$Res>
    implements $GetVideosFromPlaylistSuccessStateCopyWith<$Res> {
  _$GetVideosFromPlaylistSuccessStateCopyWithImpl(this._self, this._then);

  final GetVideosFromPlaylistSuccessState _self;
  final $Res Function(GetVideosFromPlaylistSuccessState) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? youtubeVideos = null,
  }) {
    return _then(GetVideosFromPlaylistSuccessState(
      null == youtubeVideos
          ? _self._youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>,
    ));
  }
}

/// @nodoc

class VideoErrorState implements VideoState {
  const VideoErrorState(this.message);

  final String message;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoErrorStateCopyWith<VideoErrorState> get copyWith =>
      _$VideoErrorStateCopyWithImpl<VideoErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'VideoState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $VideoErrorStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory $VideoErrorStateCopyWith(
          VideoErrorState value, $Res Function(VideoErrorState) _then) =
      _$VideoErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$VideoErrorStateCopyWithImpl<$Res>
    implements $VideoErrorStateCopyWith<$Res> {
  _$VideoErrorStateCopyWithImpl(this._self, this._then);

  final VideoErrorState _self;
  final $Res Function(VideoErrorState) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(VideoErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
