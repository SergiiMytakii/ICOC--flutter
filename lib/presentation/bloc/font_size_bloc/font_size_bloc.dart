import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

@singleton
class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(FontSizeInitial()) {
    on<FontSizeRequested>(_onFontSizeRequested);
  }

  Future<void> _onFontSizeRequested(
    FontSizeRequested event,
    Emitter<FontSizeState> emit,
  ) async {
    if (event.fontSize == null) {
      final double fontSize =
          SharedPreferencesHelper.getDouble(StorageKeys.fontSize) ?? 14;
      emit(FontSizeSuccess(fontSize: fontSize));
    } else {
      SharedPreferencesHelper.saveDouble(StorageKeys.fontSize, event.fontSize!);
      emit(FontSizeSuccess(fontSize: event.fontSize));
    }
  }
}
