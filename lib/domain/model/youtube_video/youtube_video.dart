import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/core/constants.dart';

part 'youtube_video.freezed.dart';
part 'youtube_video.g.dart';

@freezed
class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    required Languages lang,
    required String? title,
    required String link,
    String? thumbnail,
    String? artist,
    String? publishedAt,
    String? description,
    String? playlistId,
  }) = _YoutubeVideo;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);

  const YoutubeVideo._();

  static YoutubeVideo defaultVideo() {
    return const YoutubeVideo(
        lang: Languages.defaultLang,
        title: '',
        link: '',
        thumbnail: '',
        artist: '');
  }

  factory YoutubeVideo.fromJsonYoutubePlaylists(Map json) {
    //log.w(json);
    return YoutubeVideo(
        lang: Languages.defaultLang,
        title: json['title'],
        link: json['resourceId']['videoId'],
        thumbnail: json['thumbnails'] != null
            ? json['thumbnails']['high'] != null
                ? json['thumbnails']['high']['url']
                : null
            : null,
        publishedAt: json['publishedAt'],
        description: json['description'],
        playlistId: json['playlistId'],
        artist: json['artist']);
  }
}
