import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

Future showToast(
    {required BuildContext context,
    String? title,
    required String message}) async {
  return showSimpleNotification(
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      // height: 60,
      // margin: EdgeInsets.all(16),
      padding: const EdgeInsets.all(4),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (title != null)
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        Text(message)
      ]),
    ),
    foreground: Colors.white,
    duration: const Duration(seconds: 4),
    background: Colors.transparent,
    elevation: 0,
  );
}
