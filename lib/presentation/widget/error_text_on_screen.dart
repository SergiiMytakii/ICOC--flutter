import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorTextOnScreen extends StatelessWidget {
  final String message;
  const ErrorTextOnScreen({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Oops.. something went wrong..".tr()), Text(message)],
      )),
    );
  }
}
