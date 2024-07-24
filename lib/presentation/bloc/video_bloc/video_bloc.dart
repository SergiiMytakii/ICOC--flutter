import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/set_device_lang_as_primary.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/youtube_video/youtube_video.dart';
import 'package:icoc/core/model/playlist.dart';
import 'package:icoc/core/repository/video_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

@singleton
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;

  VideoBloc(this.videoRepository) : super(const VideoState.initial()) {
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
    try {
      emit(const VideoState.loading());
      final List<Playlist> videos = await videoRepository.getVideoList();
      if (videos.isNotEmpty) {
        final List<Playlist> filteredVideos = await filterByLanguages(videos);
        emit(VideoState.getVideoListSuccess(filteredVideos));
      } else {
        emit(VideoState.error(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(VideoState.error(error.toString()));
    }
  }

  Future<void> _onGetVideosFromPlaylist(
    GetVideosFromPlaylist event,
    Emitter<VideoState> emit,
  ) async {
    try {
      emit(const VideoState.loading());
      final List<YoutubeVideo>? youtubeVideos =
          await videoRepository.fetchVideosFromPlaylist(event.playlistId);
      if (youtubeVideos != null && youtubeVideos.isNotEmpty) {
        emit(VideoState.getVideosFromPlaylistSuccess(youtubeVideos));
      } else {
        emit(VideoState.error(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(VideoState.error(error.toString()));
    }
  }
}

Future<List<Playlist>> filterByLanguages(List<Playlist> videos) async {
  final locale = SharedPreferencesHelper.getString(
        StorageKeys.locale,
      ) ??
      'en';
  final Map<String, dynamic> storedLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.videosAllLanguages) ?? {};
//set keeps only unique values
  final Set<String> allKeys = {};
  videos.forEach((video) => allKeys.add(video.lang));

  putDeviceLangToFirstPlace(allKeys.toList(), locale);

  allKeys.forEach((String lang) {
    if (!storedLanguages.containsKey(lang)) {
      storedLanguages[lang] = lang == locale;
    }
  });
  SharedPreferencesHelper.saveMap(
      StorageKeys.videosAllLanguages, storedLanguages);
  final filteredVideos = videos.where((topic) {
    return storedLanguages.entries
        .any((element) => element.value == true && element.key == topic.lang);
  }).toList();

  filteredVideos.sort((a, b) {
    if (a.lang == locale && b.lang != locale) {
      return -1; // 'en' should come before any other lang
    } else if (a.lang != locale && b.lang == locale) {
      return 1; // Any other lang should come after 'en'
    } else {
      return a.lang.compareTo(b.lang); // Sort other langs alphabetically
    }
  });
  return filteredVideos;
}
