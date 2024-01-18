import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String title, String message) {
  final snackBar = SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          message,
          style: TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: Colors.grey.withOpacity(0.6),
    duration: Duration(seconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
