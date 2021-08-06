import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class CustomSnackbar {
  void showSnackbar(String title, String message) {
    Get.snackbar(
      '',
      '',
      backgroundColor: Colors.grey.withOpacity(0.6),
      duration: Duration(seconds: 3),
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      messageText: Text(message,
          style: TextStyle(
            fontSize: 20,
          )),
    );
  }
}
