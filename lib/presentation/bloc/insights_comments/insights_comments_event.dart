import 'package:freezed_annotation/freezed_annotation.dart';

part 'insights_comments_event.freezed.dart';

@freezed
abstract class InsightsCommentsEvent with _$InsightsCommentsEvent {
  const factory InsightsCommentsEvent.fetch(String postId) = _Fetch;
  const factory InsightsCommentsEvent.refresh(String postId) = _Refresh;
  const factory InsightsCommentsEvent.submit({
    required String postId,
    required String text,
    required String displayName,
  }) = _Submit;
}
