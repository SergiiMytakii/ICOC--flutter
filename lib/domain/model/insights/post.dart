import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/insights/post_author.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

part 'post.freezed.dart';
part 'post.g.dart';

DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp.toDate();
Timestamp _dateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);
List<String> _stringListFromJson(List<dynamic>? values) =>
    (values ?? <dynamic>[])
        .map((dynamic value) => value.toString().trim())
        .where((String value) => value.isNotEmpty)
        .toList(growable: false);
List<double> _doubleListFromJson(List<dynamic>? values) =>
    (values ?? <dynamic>[])
        .whereType<num>()
        .map((num value) => value.toDouble())
        .where((double value) => value > 0)
        .toList(growable: false);

@freezed
abstract class Post with _$Post {
  const Post._();

  const factory Post({
    required String id,
    required PostType type,
    required String language,
    String? title,
    String? content,
    @Default(<String>[])
    @JsonKey(fromJson: _stringListFromJson)
    List<String> mediaUrls,
    String? thumbnailUrl,
    String? youtubeId,
    String? articleUrl,
    @Default(<double>[])
    @JsonKey(fromJson: _doubleListFromJson)
    List<double> mediaAspectRatios,
    required PostAuthor author,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    required DateTime createdAt,
    @Default('published') String status,
    @Default(true) bool allowComments,
    @Default(0) int likes,
    @Default(0) int commentsCount,
    @Default(0) int shares,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  String? get primaryMediaUrl => mediaUrls.isEmpty ? null : mediaUrls.first;

  double aspectRatioForIndex(int index, {double fallback = 1}) {
    if (index >= 0 && index < mediaAspectRatios.length) {
      return mediaAspectRatios[index];
    }
    if (mediaAspectRatios.isNotEmpty) {
      return mediaAspectRatios.first;
    }
    return fallback;
  }
}
