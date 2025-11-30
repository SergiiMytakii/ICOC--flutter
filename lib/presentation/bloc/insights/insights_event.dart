import 'package:freezed_annotation/freezed_annotation.dart';

part 'insights_event.freezed.dart';

@freezed
abstract class InsightsEvent with _$InsightsEvent {
  const factory InsightsEvent.fetch() = _Fetch;
}
