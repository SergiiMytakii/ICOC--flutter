import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';

void main() {
  test('InsightComment.fromJson parses firestore payload', () {
    final InsightComment comment = InsightComment.fromJson(<String, dynamic>{
      'id': 'comment-1',
      'postId': 'post-1',
      'displayName': 'Alex',
      'text': 'Nice',
      'createdAt': Timestamp.fromDate(DateTime(2025, 2, 1)),
      'status': 'published',
    });

    expect(comment.id, 'comment-1');
    expect(comment.postId, 'post-1');
    expect(comment.displayName, 'Alex');
    expect(comment.text, 'Nice');
    expect(comment.status, 'published');
  });
}
