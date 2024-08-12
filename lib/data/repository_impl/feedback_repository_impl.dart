import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/feedback/feedback_model.dart';
import 'package:icoc/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: FeedbackRepository)
class FeedbackRepositoryImpl extends FeedbackRepository {
  final FirebaseDataSource firebaseDataSource;

  FeedbackRepositoryImpl(this.firebaseDataSource);
  @override
  Future<List<FeedbackModel>> getFeedbackList() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.Feedback.name);
    final List<FeedbackModel> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }

  @override
  Future<List<FeedbackModel>> insertFeedback(
      String name, String feedback) async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .postToFirebase(FirebaseCollections.Feedback.name, {
      'id': DateTime.now().toString(),
      'name': name,
      'text': feedback,
      'date': DateTime.now().toString(),
    });
    final List<FeedbackModel> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }
}

List<FeedbackModel> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<FeedbackModel> feedbacks = snapshot.docs.map((doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    data['date'] ??= doc.id;
    data['id'] = doc.id;
    return FeedbackModel.fromJson(data);
  }).toList();
  return feedbacks;
}
