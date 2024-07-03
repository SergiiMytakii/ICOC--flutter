part of 'font_size_bloc.dart';

@immutable
sealed class FontSizeEvent {}

class FontSizeRequested extends FontSizeEvent {
  final double? fontSize;
  FontSizeRequested({this.fontSize});
}
