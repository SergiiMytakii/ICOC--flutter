part of 'font_size_bloc.dart';

@immutable
sealed class FontSizeEvent {
  Stream<FontSizeState> applyAsync(
      {FontSizeState currentState, FontSizeBloc bloc});
}

class FontSizeRequested extends FontSizeEvent {
  final double? fontSize;
  FontSizeRequested({this.fontSize});

  @override
  Stream<FontSizeState> applyAsync(
      {FontSizeState? currentState, FontSizeBloc? bloc}) async* {
    if (fontSize == null) {
      final double fontSize =
          await SharedPreferencesHelper.getDouble(StorageKeys.fontSize) ?? 14;
      yield FontSizeSuccess(fontSize: fontSize);
    } else {
      SharedPreferencesHelper.saveDouble(StorageKeys.fontSize, fontSize!);
      yield FontSizeSuccess(fontSize: fontSize);
    }
  }
}
