part of 'video_bloc.dart';

@freezed
sealed class VideoEvent with _$VideoEvent {
  const factory VideoEvent.listRequested() = VideoListRequested;
  const factory VideoEvent.getVideosFromPlaylist({required String playlistId}) =
      GetVideosFromPlaylist;
}
