import 'package:flutter/material.dart';

class UnfocusOnTapOutside extends StatelessWidget {
  final Widget child;

  const UnfocusOnTapOutside({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: child,
    );
  }
}
