import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';

class Playlist {
  final int id;
  final String title;
  final Languages lang;
  final String description;
  final String playlistId;

  Playlist({
    required this.title,
    required this.id,
    required this.lang,
    required this.description,
    required this.playlistId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'lang': lang.name,
      'description': description,
      'playlistId': playlistId,
    };
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'] as int,
      title: json['title'] as String,
      lang: languagesToEnumMap[json['lang']] as Languages,
      description: json['description'] as String,
      playlistId: json['playlistId'] as String,
    );
  }
}
