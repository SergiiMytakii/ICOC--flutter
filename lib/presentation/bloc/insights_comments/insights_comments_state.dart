import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';

part 'insights_comments_state.freezed.dart';

@freezed
abstract class InsightsCommentsState with _$InsightsCommentsState {
  const factory InsightsCommentsState.initial() = _Initial;
  const factory InsightsCommentsState.loading() = _Loading;
  const factory InsightsCommentsState.loaded({
    required String postId,
    @Default(<InsightComment>[]) List<InsightComment> comments,
    @Default(false) bool isSubmitting,
    String? actionMessage,
    String? lastSubmittedCommentId,
  }) = _Loaded;
  const factory InsightsCommentsState.error(String message) = _Error;
}
