import 'package:freezed_annotation/freezed_annotation.dart';
part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel(
      {required String id,
      required String text,
      required String name,
      required String date,
      String? comment}) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
  static FeedbackModel defaultFeedback() =>
      const FeedbackModel(id: '', text: '', name: '', date: '');
}
