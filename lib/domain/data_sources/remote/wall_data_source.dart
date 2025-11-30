import 'package:icoc/domain/model/wall/post.dart';

abstract class WallDataSource {
  Future<List<Post>> getPosts({Set<String> languages});
}
