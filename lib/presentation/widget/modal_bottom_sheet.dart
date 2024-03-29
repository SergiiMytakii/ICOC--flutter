import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet(
      {Key? key, this.child, this.height, this.blurBackground = true})
      : super(key: key);

  final Widget? child;
  final double? height;
  final bool blurBackground;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: blurBackground
          ? ImageFilter.blur(sigmaX: 2, sigmaY: 2)
          : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: Platform.isIOS
              ? BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                )
              : BorderRadius.zero,
        ),
        height: height ?? MediaQuery.of(context).size.height / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Colors.black.withOpacity(0.2),
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
