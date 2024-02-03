import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/model/feedback.dart';
import 'package:icoc/core/repository/feedback_repository.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';
import 'package:intl/intl.dart';

class FeedbackRepositoryImpl extends FeedbackRepository {
  @override
  Future<List<Feedback>> getFeedbackList() async {
    DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();
    QuerySnapshot snapshot = await databaseServiceFirebase.getFeedbackList();
    final List<Feedback> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }

  @override
  Future<List<Feedback>> insertFeedback(String name, String feedback) async {
    DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();

    QuerySnapshot snapshot = await databaseServiceFirebase.insertFeedback(
      name,
      feedback,
      DateTime.now().toUtc().toString(),
    );
    final List<Feedback> feedbacks = _listFromSnapshot(snapshot);
    return feedbacks.reversed.toList();
  }
}

List<Feedback> _listFromSnapshot(QuerySnapshot snapshot) {
  List<Feedback> feedbacks = snapshot.docs.map((doc) {
    DateTime parsedDateTime = DateTime.parse(doc.id);
    String formattedDate = DateFormat('dd.MM\nyyyy').format(parsedDateTime);
    return Feedback(
      date: formattedDate,
      text: doc.get('text') ?? '',
      name: doc.get('name') ?? '',
    );
  }).toList();
  return feedbacks;
}
