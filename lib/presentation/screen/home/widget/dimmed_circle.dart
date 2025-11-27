import 'package:flutter/material.dart';

class DimmedCircle extends StatelessWidget {
  const DimmedCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.height * 0.8,
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.black54,
            Colors.transparent,
          ],
          stops: [0.85, 1],
          focal: Alignment(0, 0),
          focalRadius: 0.15,
        ),
      ),
    );
  }
}
