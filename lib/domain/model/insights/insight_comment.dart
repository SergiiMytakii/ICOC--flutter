import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_comment.freezed.dart';
part 'insight_comment.g.dart';

DateTime _commentDateTimeFromTimestamp(Timestamp timestamp) =>
    timestamp.toDate();
Timestamp _commentDateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);

@freezed
abstract class InsightComment with _$InsightComment {
  const factory InsightComment({
    required String id,
    required String postId,
    required String displayName,
    required String text,
    @JsonKey(
      fromJson: _commentDateTimeFromTimestamp,
      toJson: _commentDateTimeToTimestamp,
    )
    required DateTime createdAt,
    @Default('published') String status,
  }) = _InsightComment;

  factory InsightComment.fromJson(Map<String, dynamic> json) =>
      _$InsightCommentFromJson(json);
}
