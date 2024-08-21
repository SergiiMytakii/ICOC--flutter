part of 'one_q&a_bloc.dart';

@freezed
class OneQandAState with _$OneQandAState {
  const factory OneQandAState.initial() = _Initial;
  const factory OneQandAState.loading() = _Loading;
  const factory OneQandAState.success(QandAModel article) = _Success;
  const factory OneQandAState.error(String message) = _Error;
}
