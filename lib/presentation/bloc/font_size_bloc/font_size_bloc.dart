import 'package:bloc/bloc.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:icoc/constants.dart';

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
              await getIt<LocalCache>().getDouble(StorageKeys.fontSize) ?? 14;
          emit(FontSizeState.success(fontSize: storedFontSize));
        } else {
          await getIt<LocalCache>().saveDouble(StorageKeys.fontSize, fontSize);
          emit(FontSizeState.success(fontSize: fontSize));
        }
      },
    );
  }
}
