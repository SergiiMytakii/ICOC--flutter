import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackIcon extends StatelessWidget {
  final String route;
  const CustomBackIcon(
    this.route, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
        ),
        onPressed: () {
          context.go(route);
        });
  }
}
