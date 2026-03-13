import 'package:icoc/domain/model/insights/insight_comment.dart';

class InsightCommentSubmissionResult {
  const InsightCommentSubmissionResult({
    required this.comment,
    required this.commentsCount,
  });

  final InsightComment comment;
  final int commentsCount;

  factory InsightCommentSubmissionResult.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> commentJson =
        Map<String, dynamic>.from(json['comment'] as Map);
    final Object? createdAtRaw = commentJson['createdAt'];
    DateTime createdAt = DateTime.now();
    if (createdAtRaw is int) {
      createdAt = DateTime.fromMillisecondsSinceEpoch(createdAtRaw);
    } else if (createdAtRaw is String) {
      createdAt = DateTime.tryParse(createdAtRaw) ?? DateTime.now();
    }

    return InsightCommentSubmissionResult(
      comment: InsightComment(
        id: commentJson['id'].toString(),
        postId: commentJson['postId'].toString(),
        displayName: commentJson['displayName'].toString(),
        text: commentJson['text'].toString(),
        createdAt: createdAt,
        status: (commentJson['status'] ?? 'published').toString(),
      ),
      commentsCount: (json['commentsCount'] as num?)?.toInt() ?? 0,
    );
  }
}
