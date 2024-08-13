// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String playlistId) getVideosFromPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String playlistId)? getVideosFromPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String playlistId)? getVideosFromPlaylist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoListRequested value) listRequested,
    required TResult Function(GetVideosFromPlaylist value)
        getVideosFromPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoListRequested value)? listRequested,
    TResult? Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoListRequested value)? listRequested,
    TResult Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEventCopyWith<$Res> {
  factory $VideoEventCopyWith(
          VideoEvent value, $Res Function(VideoEvent) then) =
      _$VideoEventCopyWithImpl<$Res, VideoEvent>;
}

/// @nodoc
class _$VideoEventCopyWithImpl<$Res, $Val extends VideoEvent>
    implements $VideoEventCopyWith<$Res> {
  _$VideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VideoListRequestedImplCopyWith<$Res> {
  factory _$$VideoListRequestedImplCopyWith(_$VideoListRequestedImpl value,
          $Res Function(_$VideoListRequestedImpl) then) =
      __$$VideoListRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoListRequestedImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$VideoListRequestedImpl>
    implements _$$VideoListRequestedImplCopyWith<$Res> {
  __$$VideoListRequestedImplCopyWithImpl(_$VideoListRequestedImpl _value,
      $Res Function(_$VideoListRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VideoListRequestedImpl implements VideoListRequested {
  const _$VideoListRequestedImpl();

  @override
  String toString() {
    return 'VideoEvent.listRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoListRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String playlistId) getVideosFromPlaylist,
  }) {
    return listRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String playlistId)? getVideosFromPlaylist,
  }) {
    return listRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String playlistId)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoListRequested value) listRequested,
    required TResult Function(GetVideosFromPlaylist value)
        getVideosFromPlaylist,
  }) {
    return listRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoListRequested value)? listRequested,
    TResult? Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
  }) {
    return listRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoListRequested value)? listRequested,
    TResult Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested(this);
    }
    return orElse();
  }
}

abstract class VideoListRequested implements VideoEvent {
  const factory VideoListRequested() = _$VideoListRequestedImpl;
}

/// @nodoc
abstract class _$$GetVideosFromPlaylistImplCopyWith<$Res> {
  factory _$$GetVideosFromPlaylistImplCopyWith(
          _$GetVideosFromPlaylistImpl value,
          $Res Function(_$GetVideosFromPlaylistImpl) then) =
      __$$GetVideosFromPlaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playlistId});
}

/// @nodoc
class __$$GetVideosFromPlaylistImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$GetVideosFromPlaylistImpl>
    implements _$$GetVideosFromPlaylistImplCopyWith<$Res> {
  __$$GetVideosFromPlaylistImplCopyWithImpl(_$GetVideosFromPlaylistImpl _value,
      $Res Function(_$GetVideosFromPlaylistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistId = null,
  }) {
    return _then(_$GetVideosFromPlaylistImpl(
      playlistId: null == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetVideosFromPlaylistImpl implements GetVideosFromPlaylist {
  const _$GetVideosFromPlaylistImpl({required this.playlistId});

  @override
  final String playlistId;

  @override
  String toString() {
    return 'VideoEvent.getVideosFromPlaylist(playlistId: $playlistId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVideosFromPlaylistImpl &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVideosFromPlaylistImplCopyWith<_$GetVideosFromPlaylistImpl>
      get copyWith => __$$GetVideosFromPlaylistImplCopyWithImpl<
          _$GetVideosFromPlaylistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String playlistId) getVideosFromPlaylist,
  }) {
    return getVideosFromPlaylist(playlistId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String playlistId)? getVideosFromPlaylist,
  }) {
    return getVideosFromPlaylist?.call(playlistId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String playlistId)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    if (getVideosFromPlaylist != null) {
      return getVideosFromPlaylist(playlistId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoListRequested value) listRequested,
    required TResult Function(GetVideosFromPlaylist value)
        getVideosFromPlaylist,
  }) {
    return getVideosFromPlaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoListRequested value)? listRequested,
    TResult? Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
  }) {
    return getVideosFromPlaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoListRequested value)? listRequested,
    TResult Function(GetVideosFromPlaylist value)? getVideosFromPlaylist,
    required TResult orElse(),
  }) {
    if (getVideosFromPlaylist != null) {
      return getVideosFromPlaylist(this);
    }
    return orElse();
  }
}

abstract class GetVideosFromPlaylist implements VideoEvent {
  const factory GetVideosFromPlaylist({required final String playlistId}) =
      _$GetVideosFromPlaylistImpl;

  String get playlistId;
  @JsonKey(ignore: true)
  _$$GetVideosFromPlaylistImplCopyWith<_$GetVideosFromPlaylistImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VideoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res, VideoState>;
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res, $Val extends VideoState>
    implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VideoInitialImplCopyWith<$Res> {
  factory _$$VideoInitialImplCopyWith(
          _$VideoInitialImpl value, $Res Function(_$VideoInitialImpl) then) =
      __$$VideoInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoInitialImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoInitialImpl>
    implements _$$VideoInitialImplCopyWith<$Res> {
  __$$VideoInitialImplCopyWithImpl(
      _$VideoInitialImpl _value, $Res Function(_$VideoInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VideoInitialImpl implements VideoInitial {
  const _$VideoInitialImpl();

  @override
  String toString() {
    return 'VideoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
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
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VideoInitial implements VideoState {
  const factory VideoInitial() = _$VideoInitialImpl;
}

/// @nodoc
abstract class _$$VideoLoadingStateImplCopyWith<$Res> {
  factory _$$VideoLoadingStateImplCopyWith(_$VideoLoadingStateImpl value,
          $Res Function(_$VideoLoadingStateImpl) then) =
      __$$VideoLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoLoadingStateImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoLoadingStateImpl>
    implements _$$VideoLoadingStateImplCopyWith<$Res> {
  __$$VideoLoadingStateImplCopyWithImpl(_$VideoLoadingStateImpl _value,
      $Res Function(_$VideoLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VideoLoadingStateImpl implements VideoLoadingState {
  const _$VideoLoadingStateImpl();

  @override
  String toString() {
    return 'VideoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
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
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class VideoLoadingState implements VideoState {
  const factory VideoLoadingState() = _$VideoLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetVideoListSuccessStateImplCopyWith<$Res> {
  factory _$$GetVideoListSuccessStateImplCopyWith(
          _$GetVideoListSuccessStateImpl value,
          $Res Function(_$GetVideoListSuccessStateImpl) then) =
      __$$GetVideoListSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Playlist> topics});
}

/// @nodoc
class __$$GetVideoListSuccessStateImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$GetVideoListSuccessStateImpl>
    implements _$$GetVideoListSuccessStateImplCopyWith<$Res> {
  __$$GetVideoListSuccessStateImplCopyWithImpl(
      _$GetVideoListSuccessStateImpl _value,
      $Res Function(_$GetVideoListSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_$GetVideoListSuccessStateImpl(
      null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ));
  }
}

/// @nodoc

class _$GetVideoListSuccessStateImpl implements GetVideoListSuccessState {
  const _$GetVideoListSuccessStateImpl(final List<Playlist> topics)
      : _topics = topics;

  final List<Playlist> _topics;
  @override
  List<Playlist> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'VideoState.getVideoListSuccess(topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVideoListSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVideoListSuccessStateImplCopyWith<_$GetVideoListSuccessStateImpl>
      get copyWith => __$$GetVideoListSuccessStateImplCopyWithImpl<
          _$GetVideoListSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    return getVideoListSuccess(topics);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    return getVideoListSuccess?.call(topics);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (getVideoListSuccess != null) {
      return getVideoListSuccess(topics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    return getVideoListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    return getVideoListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    if (getVideoListSuccess != null) {
      return getVideoListSuccess(this);
    }
    return orElse();
  }
}

abstract class GetVideoListSuccessState implements VideoState {
  const factory GetVideoListSuccessState(final List<Playlist> topics) =
      _$GetVideoListSuccessStateImpl;

  List<Playlist> get topics;
  @JsonKey(ignore: true)
  _$$GetVideoListSuccessStateImplCopyWith<_$GetVideoListSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetVideosFromPlaylistSuccessStateImplCopyWith<$Res> {
  factory _$$GetVideosFromPlaylistSuccessStateImplCopyWith(
          _$GetVideosFromPlaylistSuccessStateImpl value,
          $Res Function(_$GetVideosFromPlaylistSuccessStateImpl) then) =
      __$$GetVideosFromPlaylistSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<YoutubeVideo> youtubeVideos});
}

/// @nodoc
class __$$GetVideosFromPlaylistSuccessStateImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res,
        _$GetVideosFromPlaylistSuccessStateImpl>
    implements _$$GetVideosFromPlaylistSuccessStateImplCopyWith<$Res> {
  __$$GetVideosFromPlaylistSuccessStateImplCopyWithImpl(
      _$GetVideosFromPlaylistSuccessStateImpl _value,
      $Res Function(_$GetVideosFromPlaylistSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? youtubeVideos = null,
  }) {
    return _then(_$GetVideosFromPlaylistSuccessStateImpl(
      null == youtubeVideos
          ? _value._youtubeVideos
          : youtubeVideos // ignore: cast_nullable_to_non_nullable
              as List<YoutubeVideo>,
    ));
  }
}

/// @nodoc

class _$GetVideosFromPlaylistSuccessStateImpl
    implements GetVideosFromPlaylistSuccessState {
  const _$GetVideosFromPlaylistSuccessStateImpl(
      final List<YoutubeVideo> youtubeVideos)
      : _youtubeVideos = youtubeVideos;

  final List<YoutubeVideo> _youtubeVideos;
  @override
  List<YoutubeVideo> get youtubeVideos {
    if (_youtubeVideos is EqualUnmodifiableListView) return _youtubeVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_youtubeVideos);
  }

  @override
  String toString() {
    return 'VideoState.getVideosFromPlaylistSuccess(youtubeVideos: $youtubeVideos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVideosFromPlaylistSuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._youtubeVideos, _youtubeVideos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_youtubeVideos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVideosFromPlaylistSuccessStateImplCopyWith<
          _$GetVideosFromPlaylistSuccessStateImpl>
      get copyWith => __$$GetVideosFromPlaylistSuccessStateImplCopyWithImpl<
          _$GetVideosFromPlaylistSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    return getVideosFromPlaylistSuccess(youtubeVideos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    return getVideosFromPlaylistSuccess?.call(youtubeVideos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (getVideosFromPlaylistSuccess != null) {
      return getVideosFromPlaylistSuccess(youtubeVideos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    return getVideosFromPlaylistSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    return getVideosFromPlaylistSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    if (getVideosFromPlaylistSuccess != null) {
      return getVideosFromPlaylistSuccess(this);
    }
    return orElse();
  }
}

abstract class GetVideosFromPlaylistSuccessState implements VideoState {
  const factory GetVideosFromPlaylistSuccessState(
          final List<YoutubeVideo> youtubeVideos) =
      _$GetVideosFromPlaylistSuccessStateImpl;

  List<YoutubeVideo> get youtubeVideos;
  @JsonKey(ignore: true)
  _$$GetVideosFromPlaylistSuccessStateImplCopyWith<
          _$GetVideosFromPlaylistSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoErrorStateImplCopyWith<$Res> {
  factory _$$VideoErrorStateImplCopyWith(_$VideoErrorStateImpl value,
          $Res Function(_$VideoErrorStateImpl) then) =
      __$$VideoErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VideoErrorStateImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoErrorStateImpl>
    implements _$$VideoErrorStateImplCopyWith<$Res> {
  __$$VideoErrorStateImplCopyWithImpl(
      _$VideoErrorStateImpl _value, $Res Function(_$VideoErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VideoErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VideoErrorStateImpl implements VideoErrorState {
  const _$VideoErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VideoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoErrorStateImplCopyWith<_$VideoErrorStateImpl> get copyWith =>
      __$$VideoErrorStateImplCopyWithImpl<_$VideoErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Playlist> topics) getVideoListSuccess,
    required TResult Function(List<YoutubeVideo> youtubeVideos)
        getVideosFromPlaylistSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Playlist> topics)? getVideoListSuccess,
    TResult? Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Playlist> topics)? getVideoListSuccess,
    TResult Function(List<YoutubeVideo> youtubeVideos)?
        getVideosFromPlaylistSuccess,
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
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoadingState value) loading,
    required TResult Function(GetVideoListSuccessState value)
        getVideoListSuccess,
    required TResult Function(GetVideosFromPlaylistSuccessState value)
        getVideosFromPlaylistSuccess,
    required TResult Function(VideoErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoadingState value)? loading,
    TResult? Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult? Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult? Function(VideoErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoadingState value)? loading,
    TResult Function(GetVideoListSuccessState value)? getVideoListSuccess,
    TResult Function(GetVideosFromPlaylistSuccessState value)?
        getVideosFromPlaylistSuccess,
    TResult Function(VideoErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class VideoErrorState implements VideoState {
  const factory VideoErrorState(final String message) = _$VideoErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$VideoErrorStateImplCopyWith<_$VideoErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
