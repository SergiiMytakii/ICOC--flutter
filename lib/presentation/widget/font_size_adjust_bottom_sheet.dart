import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class FontSizeAdjustBottomSheet {
  final BuildContext context;
  final Color color;

  FontSizeAdjustBottomSheet({
    required this.context,
    required this.color,
  });

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (context) => ModalBottomSheet(
        height: 200,
        blurBackground: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              'Font size'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<FontSizeBloc, FontSizeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (fontSize) => Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'aA',
                          style: TextStyle(fontSize: fontSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider.adaptive(
                          activeColor: color,
                          inactiveColor: color,
                          label: 'Font size'.tr(),
                          value: fontSize ?? 14,
                          min: 12,
                          max: 46,
                          divisions: 34,
                          onChanged: (val) {
                            getIt<FontSizeBloc>()
                                .add(FontSizeEvent.requested(fontSize: val));
                          },
                        ),
                      ),
                    ],
                  ),
                  orElse: () => Container(),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
