import 'dart:io';
import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet(
      {super.key, this.child, this.height, this.blurBackground = true});

  final Widget? child;
  final double? height;
  final bool blurBackground;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: blurBackground
          ? ImageFilter.blur(sigmaX: 2, sigmaY: 2)
          : ImageFilter.blur(),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: Platform.isIOS
              ? const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )
              : BorderRadius.zero,
        ),
        height: height ?? MediaQuery.of(context).size.height / 1.1,
        child: ListView(
          children: [
            if (Platform.isIOS)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 6,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AdaptiveTheme.of(context).theme.dividerColor,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ],
              ),
            child!,
          ],
        ),
      ),
    );
  }
}
