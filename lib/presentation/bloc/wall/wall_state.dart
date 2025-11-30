import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/domain/model/wall/post.dart';

part 'wall_state.freezed.dart';

@freezed
abstract class WallState with _$WallState {
  const factory WallState.initial() = _Initial;
  const factory WallState.loading() = _Loading;
  const factory WallState.loaded(List<Post> posts) = _Loaded;
  const factory WallState.error(String message) = _Error;
}
