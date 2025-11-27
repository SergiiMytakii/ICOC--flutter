part of 'font_size_bloc.dart';

@freezed
sealed class FontSizeEvent with _$FontSizeEvent {
  const factory FontSizeEvent.requested({double? fontSize}) = FontSizeRequested;
}
