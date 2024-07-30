import 'package:icoc/constants.dart';
import 'package:icoc/core/model/youtube_video/youtube_video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
class SongModel with _$SongModel {
  @JsonSerializable(explicitToJson: true)
  const factory SongModel({
    required int id,
    required Map<Languages, SongVersion> songs,
    Map<Languages, Chords>? chords,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  static SongModel defaultSong() => const SongModel(id: 0, songs: {});
}

@freezed
class SongVersion with _$SongVersion {
  const factory SongVersion({
    required int id,
    required String lang,
    required String text,
    required String title,
    String? description,
    List<YoutubeVideo>? youtubeVideos,
  }) = _SongVersion;

  factory SongVersion.fromJson(Map<String, dynamic> json) =>
      _$SongVersionFromJson(json);
}

@freezed
class Chords with _$Chords {
  const factory Chords({
    required int id,
    required String chords,
    String? description,
  }) = _Chords;

  factory Chords.fromJson(Map<String, dynamic> json) => _$ChordsFromJson(json);
}
