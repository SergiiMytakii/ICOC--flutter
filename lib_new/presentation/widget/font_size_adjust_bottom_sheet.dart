import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
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
            height: MediaQuery.of(context).size.height / 4,
            blurBackground: false,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Font size'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  //todo wrap in bloc
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'aA',
                          style: TextStyle(fontSize: controller.fontSize.value),
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
                          value: controller!.fontSize.value,
                          min: 14,
                          max: 48,
                          divisions: 34,
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  )),
            ])));
  }
}
