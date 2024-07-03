part of 'video_bloc.dart';

@immutable
sealed class VideoEvent {}

class VideoListRequested extends VideoEvent {}

class GetVideosFromPlaylist extends VideoEvent {
  final String playlistId;
  GetVideosFromPlaylist(this.playlistId);
}
