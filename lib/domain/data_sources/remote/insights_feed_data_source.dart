import 'package:icoc/domain/model/insights/post.dart';

abstract class InsightsFeedDataSource {
  Future<List<Post>> getPosts({Set<String> languages, int? limit});
  Future<List<String>> getAvailableLanguages();
  Future<Post?> getPostById(String postId);
}
