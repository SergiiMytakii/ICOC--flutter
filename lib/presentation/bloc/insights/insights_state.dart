import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/insights/post.dart';

part 'insights_state.freezed.dart';

@freezed
abstract class InsightsState with _$InsightsState {
  const factory InsightsState.initial() = _Initial;
  const factory InsightsState.loading() = _Loading;
  const factory InsightsState.loaded({
    required List<Post> posts,
    @Default(<String>[]) List<String> availableLanguages,
    @Default(<String, bool>{}) Map<String, bool> selectedLanguages,
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> busyPostIds,
    String? actionMessage,
  }) = _Loaded;
  const factory InsightsState.error(String message) = _Error;
}
