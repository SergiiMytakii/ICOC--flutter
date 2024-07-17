part of 'q&a_bloc.dart';

@freezed
class QandAState with _$QandAState {
  const factory QandAState.initial() = QandAInitial;
  const factory QandAState.loading() = QandALoadingState;
  const factory QandAState.success(List<QandAModel> articles) =
      GetQandASuccessState;
  const factory QandAState.error(String message) = QandAErrorState;
}
