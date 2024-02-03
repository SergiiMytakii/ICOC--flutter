part of 'video_bloc.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoadingState extends VideoState {}

final class GetVideoListSuccessState extends VideoState {
  final List<Video> topics;

  GetVideoListSuccessState(this.topics);
}

final class GetVideosFromPlaylistSuccessState extends VideoState {
  final List<Resources> resources;

  GetVideosFromPlaylistSuccessState(this.resources);
}

final class VideoErrorState extends VideoState {
  final String message;

  VideoErrorState(this.message);
}
