import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/data_sources/remote/insights_data_source.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InsightsDataSource)
class InsightsDataSourceImpl implements InsightsDataSource {
  final FirebaseDataSource _firebaseDataSource;

  InsightsDataSourceImpl(this._firebaseDataSource);

  @override
  Future<List<Post>> getPosts({Set<String> languages = const {}}) async {
    final Map<String, dynamic> filters = {};
    if (languages.isNotEmpty) {
      filters['language'] = languages.toList();
    }

    final result = await _firebaseDataSource.getFromFirebase(
      FirebaseCollections.Wall.name,
      filters: filters,
      orderBy: {'createdAt': true},
    );

    final posts =
        result.docs.map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>)).toList();
    return posts;
  }
}
