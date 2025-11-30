import 'package:freezed_annotation/freezed_annotation.dart';

part 'wall_event.freezed.dart';

@freezed
abstract class WallEvent with _$WallEvent {
  const factory WallEvent.fetch() = _Fetch;
}
