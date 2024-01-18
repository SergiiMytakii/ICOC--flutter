import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/bloc/font_size_bloc/font_size_bloc.dart';
import 'modal_bottom_sheet.dart';

class FontSizeAdjustBottomSheet {
  final BuildContext context;
  final String color;

  FontSizeAdjustBottomSheet({
    required this.context,
    required this.color,
  });

  bottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
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
                      if (state is FontSizeSuccess) {
                        return Row(
                          children: [
                            Container(
                              width: 80,
                              child: Text(
                                'aA',
                                style: TextStyle(fontSize: state.fontSize),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: Slider.adaptive(
                                activeColor: screensColors[color],
                                inactiveColor: screensColors[color],
                                label: 'Font size'.tr(),
                                value: state.fontSize ?? 14,
                                min: 14,
                                max: 48,
                                divisions: 34,
                                onChanged: (val) {
                                  context
                                      .read<FontSizeBloc>()
                                      .add(FontSizeRequested(fontSize: val));
                                },
                              ),
                            ),
                          ],
                        );
                      } else
                        return Container();
                    },
                  )),
            ])));
  }
}
