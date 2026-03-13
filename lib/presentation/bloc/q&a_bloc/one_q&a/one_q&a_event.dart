part of 'one_q&a_bloc.dart';

@freezed
abstract class OneQandAEvent with _$OneQandAEvent {
  const factory OneQandAEvent.requested(QandAModel article) = _Requested;
}
