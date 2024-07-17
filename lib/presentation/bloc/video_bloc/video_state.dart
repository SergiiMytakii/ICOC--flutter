part of 'video_bloc.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = VideoInitial;
  const factory VideoState.loading() = VideoLoadingState;
  const factory VideoState.getVideoListSuccess(List<Playlist> topics) =
      GetVideoListSuccessState;
  const factory VideoState.getVideosFromPlaylistSuccess(
      List<Resources> resources) = GetVideosFromPlaylistSuccessState;
  const factory VideoState.error(String message) = VideoErrorState;
}
