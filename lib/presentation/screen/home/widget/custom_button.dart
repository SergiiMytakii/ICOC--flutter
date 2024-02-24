import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.child,
    required this.color,
  });
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
 