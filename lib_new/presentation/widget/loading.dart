import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color? color;
  Loading({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: color,
        ),
      ),
    );
  }
}
