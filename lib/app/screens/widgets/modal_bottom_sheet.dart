import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: Platform.isIOS
              ? BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                )
              : BorderRadius.zero,
        ),
        child: Container(
          height: Get.size.height / 1.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Platform.isIOS)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      height: 6,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ],
                ),
              child!,
            ],
          ),
        ),
      ),
    );
  }
}
