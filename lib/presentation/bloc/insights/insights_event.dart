import 'package:freezed_annotation/freezed_annotation.dart';

part 'insights_event.freezed.dart';

@freezed
abstract class InsightsEvent with _$InsightsEvent {
  const factory InsightsEvent.fetchAvailableLanguagesAndPosts({
    @Default(false) bool silent,
  }) = _FetchAvailableLanguagesAndPosts;
  const factory InsightsEvent.languagesChanged(
    Map<String, bool> selectedLanguages,
  ) = _LanguagesChanged;
  const factory InsightsEvent.toggleLike(String postId) = _ToggleLike;
  const factory InsightsEvent.shareTapped(String postId) = _ShareTapped;
  const factory InsightsEvent.refreshSinglePost(String postId) =
      _RefreshSinglePost;
}
