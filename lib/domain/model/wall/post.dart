import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/wall/post_author.dart';
import 'package:icoc/domain/model/wall/post_type.dart';

part 'post.freezed.dart';
part 'post.g.dart';

// Helper functions for custom date time conversion
DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp.toDate();
Timestamp _dateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required PostType type,
    required String language,
    String? title,
    String? content,
    String? mediaUrl,
    String? thumbnailUrl,
    String? articleUrl,
    required PostAuthor author,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    required DateTime createdAt,
    @Default(0) int likes,
    @Default(0) int shares,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
