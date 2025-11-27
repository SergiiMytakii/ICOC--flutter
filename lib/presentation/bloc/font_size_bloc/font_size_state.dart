part of 'font_size_bloc.dart';

@freezed
class FontSizeState with _$FontSizeState {
  const factory FontSizeState.initial() = FontSizeInitial;
  const factory FontSizeState.success({required double? fontSize}) =
      FontSizeSuccess;
  const factory FontSizeState.error(String message) = FontSizeErrorState;
}
