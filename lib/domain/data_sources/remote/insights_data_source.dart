import 'package:icoc/domain/model/insights/post.dart';

abstract class InsightsDataSource {
  Future<List<Post>> getPosts({Set<String> languages});
}
