import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/domain/data_sources/remote/insights_feed_data_source.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

@LazySingleton(as: InsightsFeedDataSource)
class InsightsDataSourceImpl implements InsightsFeedDataSource {
  InsightsDataSourceImpl() : _db = FirebaseFirestore.instance;

  static const String _insightsMetaCollection = 'InsightsMeta';
  static const String _insightsLanguagesDocument = 'languages';

  final FirebaseFirestore _db;

  @override
  Future<List<Post>> getPosts({
    Set<String> languages = const {},
    int? limit,
  }) async {
    Query<Map<String, dynamic>> query = _db
        .collection(FirebaseCollections.Insights.name)
        .orderBy('createdAt', descending: true);

    if (limit != null && limit > 0) {
      query = query.limit(limit);
    }

    final List<String> normalizedLanguages = languages
        .map((String lang) => lang.trim())
        .where((String lang) => lang.isNotEmpty)
        .toList();

    final QuerySnapshot<Map<String, dynamic>> result = await query.get();
    return result.docs.map(_postFromDoc).whereType<Post>().where((Post post) {
      if (post.status == 'draft') {
        return false;
      }
      return normalizedLanguages.isEmpty ||
          normalizedLanguages.contains(post.language);
    }).toList();
  }

  @override
  Future<List<String>> getAvailableLanguages() async {
    final DocumentSnapshot<Map<String, dynamic>> metaSnapshot = await _db
        .collection(_insightsMetaCollection)
        .doc(_insightsLanguagesDocument)
        .get();

    final List<String> metaLanguages = ((metaSnapshot.data() ??
                    const <String, dynamic>{})['availableLanguages']
                as List<dynamic>?)
            ?.map((dynamic value) => value.toString().trim())
            .where((String value) => value.isNotEmpty)
            .toSet()
            .toList(growable: false) ??
        <String>[];
    if (metaLanguages.isNotEmpty) {
      return metaLanguages;
    }

    final List<Post> posts = await getPosts(limit: 100);
    final List<String> languages = posts
        .where((Post post) => post.status != 'draft')
        .map((Post post) => post.language)
        .where((String language) => language.isNotEmpty)
        .toSet()
        .toList(growable: false);
    return languages;
  }

  @override
  Future<Post?> getPostById(String postId) async {
    final DocumentSnapshot<Map<String, dynamic>> result = await _db
        .collection(FirebaseCollections.Insights.name)
        .doc(postId)
        .get();
    return _postFromDoc(result);
  }

  Post? _postFromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final Map<String, dynamic>? raw = doc.data();
    if (raw == null) {
      return null;
    }
    try {
      final Map<String, dynamic> json = Map<String, dynamic>.from(raw);
      json['id'] = (json['id'] ?? doc.id).toString();
      final Post post = Post.fromJson(json);
      if (post.status == 'draft') {
        return null;
      }
      if (post.type == PostType.image && post.mediaUrls.isEmpty) {
        return null;
      }
      if (post.type == PostType.video &&
          YoutubeThumbnailHelper.resolveVideoId(
                youtubeId: post.youtubeId,
                articleUrl: post.articleUrl,
              ) ==
              null) {
        return null;
      }
      if (post.type == PostType.text &&
          (post.content == null || post.content!.trim().isEmpty)) {
        return null;
      }
      return post;
    } catch (_) {
      return null;
    }
  }
}
