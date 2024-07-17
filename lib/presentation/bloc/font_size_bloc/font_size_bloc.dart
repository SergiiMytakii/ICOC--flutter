import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';
part 'font_size_bloc.freezed.dart';

@singleton
class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(const FontSizeState.initial()) {
    on<FontSizeEvent>(_onFontSizeEvent);
  }

  Future<void> _onFontSizeEvent(
    FontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await event.when(
      requested: (fontSize) async {
        if (fontSize == null) {
          final double storedFontSize =
              SharedPreferencesHelper.getDouble(StorageKeys.fontSize) ?? 14;
          emit(FontSizeState.success(fontSize: storedFontSize));
        } else {
          await SharedPreferencesHelper.saveDouble(
              StorageKeys.fontSize, fontSize);
          emit(FontSizeState.success(fontSize: fontSize));
        }
      },
    );
  }
}
