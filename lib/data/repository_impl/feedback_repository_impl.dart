import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/feedback.dart';
import 'package:icoc/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@dev
@prod
@Injectable(as: FeedbackRepository)
class FeedbackRepositoryImpl extends FeedbackRepository {
  final FirebaseDataSource firebaseDataSource;

  FeedbackRepositoryImpl(this.firebaseDataSource);
  @override
  Future<List<Feedback>> getFeedbackList() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.Feedback.name);
    final List<Feedback> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }

  @override
  Future<List<Feedback>> insertFeedback(String name, String feedback) async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .postToFirebase(FirebaseCollections.Feedback.name, {
      'id': DateTime.now().toString(),
      'name': name,
      'text': feedback,
    });
    final List<Feedback> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }
}

List<Feedback> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<Feedback> feedbacks = snapshot.docs.map((doc) {
    final DateTime parsedDateTime = DateTime.parse(doc.id);
    final String formattedDate =
        DateFormat('dd.MM\nyyyy').format(parsedDateTime);
    return Feedback(
      date: formattedDate,
      text: doc.get('text') ?? '',
      name: doc.get('name') ?? '',
    );
  }).toList();
  return feedbacks;
}
