import 'package:bloc/bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';
import 'package:icoc/domain/repository/video_repository.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

@singleton
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;
  final VideosUserLanguagesHandler videoUserLanguagesHandler;
  List<Playlist> playlists = [];
  VideoBloc(this.videoRepository, this.videoUserLanguagesHandler)
      : super(const VideoState.initial()) {
    on<VideoEvent>((event, emit) async {
      await event.map(
        listRequested: (event) => _onVideoListRequested(event, emit),
        getVideosFromPlaylist: (event) => _onGetVideosFromPlaylist(event, emit),
      );
    });
  }

  Future<void> _onVideoListRequested(
    VideoListRequested event,
    Emitter<VideoState> emit,
  ) async {
    emit(const VideoState.loading());
    final Either<Failure, List<Playlist>> result =
        await videoRepository.getVideoList();
    return result.fold(
      (failure) => emit(VideoState.error(failure.toUserFriendlyMessage())),
      (allPlaylists) async {
        await updateStoredLanguages(allPlaylists, videoUserLanguagesHandler);
        playlists =
            await filterByLanguages(allPlaylists, videoUserLanguagesHandler);
        if (playlists.isNotEmpty) {
          emit(VideoState.getVideoListSuccess(playlists));
        } else {
          emit(const VideoState.empty());
        }
      },
    );
  }

  Future<void> _onGetVideosFromPlaylist(
    GetVideosFromPlaylist event,
    Emitter<VideoState> emit,
  ) async {
    emit(const VideoState.loading());
    final Either<Failure, List<YoutubeVideo>> result =
        await videoRepository.fetchVideosFromPlaylist(event.playlistId);
    return result.fold(
      (failure) => emit(VideoState.error(failure.toUserFriendlyMessage())),
      (youtubeVideos) {
        if (youtubeVideos.isNotEmpty) {
          emit(VideoState.getVideosFromPlaylistSuccess(youtubeVideos));
        } else {
          emit(const VideoState.empty());
        }
      },
    );
  }

  Future<void> updateStoredLanguages(List<Playlist> videos,
      VideosUserLanguagesHandler videoUserLanguagesHandler) async {
    final List<Languages> allLangsFromVideos =
        videos.map((video) => video.lang).toSet().toList();

    // Get the set of available language names from the database
    final Set<String> availableLangNames =
        allLangsFromVideos.map((lang) => lang.name).toSet();

    // Create a new languages map with only available languages
    final Map<String, dynamic> updatedLanguages = <String, dynamic>{};

    // Add languages that are available in the database
    for (final langName in availableLangNames) {
      // Keep the existing active state if the language was already present
      final bool wasActive =
          videoUserLanguagesHandler.languages[langName] ?? false;
      updatedLanguages[langName] = wasActive || langName == locale;
    }

    // Ensure at least one language is active if none are currently active
    if (updatedLanguages.isNotEmpty &&
        !updatedLanguages.values.any((isActive) => isActive == true)) {
      // Activate the first available language or the user's locale if available
      final String firstLang = updatedLanguages.keys.first;
      updatedLanguages[firstLang] = true;
    }

    // Update the handler with only available languages
    await videoUserLanguagesHandler.saveAllLanguages(updatedLanguages);
  }
}

Future<List<Playlist>> filterByLanguages(List<Playlist> videos,
    VideosUserLanguagesHandler videoUserLanguagesHandler) async {
  final activeLanguages = videoUserLanguagesHandler.getActiveLanguages();

  final filteredVideos = videos
      .where((video) => activeLanguages.contains(video.lang.name))
      .toList();

  filteredVideos.sort((a, b) {
    if (a.lang.name == locale && b.lang.name != locale) {
      return -1; // 'en' should come before any other lang
    } else if (a.lang.name != locale && b.lang.name == locale) {
      return 1; // Any other lang should come after 'en'
    } else {
      return a.lang.name
          .compareTo(b.lang.name); // Sort other langs alphabetically
    }
  });
  return filteredVideos;
}
