import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/insights/post.dart';

part 'insights_state.freezed.dart';

@freezed
abstract class InsightsState with _$InsightsState {
  const factory InsightsState.initial() = _Initial;
  const factory InsightsState.loading() = _Loading;
  const factory InsightsState.loaded(List<Post> posts) = _Loaded;
  const factory InsightsState.error(String message) = _Error;
}
