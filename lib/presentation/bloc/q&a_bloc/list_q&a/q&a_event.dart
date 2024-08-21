part of 'q&a_bloc.dart';

@freezed
sealed class QandAEvent with _$QandAEvent {
  const factory QandAEvent.requested({String? query, OrderEnum? order}) =
      QandARequested;
  const factory QandAEvent.getLangs() = QandGetLangs;
}
