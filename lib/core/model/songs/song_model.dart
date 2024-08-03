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
    required List<SongVersion> songVersions,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  static SongModel defaultSong() => const SongModel(id: 0, songVersions: []);

  List<Languages> getAllLangs() {
    return songVersions.map((version) => version.lang).toSet().toList();
  }

  bool hasVideos() {
    return songVersions
        .any((version) => version.youtubeVideos?.isNotEmpty ?? false);
  }

  const SongModel._();
}

@freezed
class SongVersion with _$SongVersion {
  @JsonSerializable(explicitToJson: true)
  const factory SongVersion({
    required int id,
    required Languages lang,
    required String text,
    required String title,
    @Default(false) bool isChords,
    String? description,
    List<YoutubeVideo>? youtubeVideos,
  }) = _SongVersion;

  factory SongVersion.fromJson(Map<String, dynamic> json) =>
      _$SongVersionFromJson(json);
}

@freezed
class SongVersionLocal with _$SongVersionLocal {
  const factory SongVersionLocal({
    required int id,
    required String lang,
    required String text,
    required String title,
  }) = _SongVersionLocal;

  factory SongVersionLocal.fromJson(Map<String, dynamic> json) =>
      _$SongVersionLocalFromJson(json);
}
