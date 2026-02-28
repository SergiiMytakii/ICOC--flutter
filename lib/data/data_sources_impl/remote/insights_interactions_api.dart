import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:icoc/domain/data_sources/remote/http_client.dart';
import 'package:icoc/domain/data_sources/remote/insights_interactions_api.dart'
    as domain;
import 'package:icoc/domain/model/insights/insight_comment_submission_result.dart';
import 'package:icoc/domain/model/insights/insight_like_result.dart';
import 'package:icoc/firebase_options.dart';

@LazySingleton(as: domain.InsightsInteractionsApi)
class InsightsInteractionsApiImpl implements domain.InsightsInteractionsApi {
  InsightsInteractionsApiImpl(this._httpClient);

  static const String _region = 'europe-central2';

  final HttpClient _httpClient;

  Uri _functionUri(String functionName) {
    return Uri.https(
      '$_region-${DefaultFirebaseOptions.currentPlatform.projectId}.cloudfunctions.net',
      functionName,
    );
  }

  @override
  Future<InsightCommentSubmissionResult> addComment({
    required String postId,
    required String deviceId,
    required String displayName,
    required String text,
  }) async {
    final response = await _httpClient.post(
      _functionUri('createInsightComment'),
      headers: const <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'postId': postId,
        'deviceId': deviceId,
        'displayName': displayName,
        'text': text,
      }),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to create comment');
    }
    return InsightCommentSubmissionResult.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  @override
  Future<int> incrementShare({
    required String postId,
    required String deviceId,
  }) async {
    final response = await _httpClient.post(
      _functionUri('incrementInsightShare'),
      headers: const <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'postId': postId,
        'deviceId': deviceId,
      }),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to increment share counter');
    }
    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    return (json['shares'] as num?)?.toInt() ?? 0;
  }

  @override
  Future<InsightLikeResult> toggleLike({
    required String postId,
    required String deviceId,
  }) async {
    final response = await _httpClient.post(
      _functionUri('toggleInsightLike'),
      headers: const <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'postId': postId,
        'deviceId': deviceId,
      }),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to toggle like');
    }
    return InsightLikeResult.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
