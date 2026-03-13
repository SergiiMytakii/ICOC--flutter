import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/insights_comments_data_source.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';

@LazySingleton(as: InsightsCommentsDataSource)
class InsightsCommentsDataSourceImpl implements InsightsCommentsDataSource {
  InsightsCommentsDataSourceImpl() : _db = FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<List<InsightComment>> getComments({
    required String postId,
    int limit = 30,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> result = await _db
        .collection(FirebaseCollections.Insights.name)
        .doc(postId)
        .collection('comments')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();

    return result.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
          final Map<String, dynamic> json =
              Map<String, dynamic>.from(doc.data());
          json['id'] = (json['id'] ?? doc.id).toString();
          json['postId'] = (json['postId'] ?? postId).toString();
          return InsightComment.fromJson(json);
        })
        .where((InsightComment comment) => comment.status == 'published')
        .toList();
  }
}
