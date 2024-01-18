part of 'font_size_bloc.dart';

@immutable
sealed class FontSizeState {}

final class FontSizeInitial extends FontSizeState {}

final class FontSizeSuccess extends FontSizeState {
  final double? fontSize;

  FontSizeSuccess({required this.fontSize});
}

final class FontSizeErrorState extends FontSizeState {
  FontSizeErrorState(this.message);
  final String message;
}
