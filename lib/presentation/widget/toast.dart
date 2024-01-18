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
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (title != null)
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        Text(message)
      ]),
      // height: 60,
      // margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(4),
    ),
    foreground: Colors.white,
    duration: Duration(seconds: 4),
    background: Colors.transparent,
    elevation: 0,
  );
}
