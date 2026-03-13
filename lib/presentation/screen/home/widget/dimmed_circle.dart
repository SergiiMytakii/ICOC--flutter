import 'package:flutter/material.dart';

class DimmedBackground extends StatelessWidget {
  const DimmedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.height,
      height: screenSize.height,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        // shape: BoxShape.circle,
        // gradient: RadialGradient(
        //   colors: [
        //     Colors.black54,
        //     Colors.transparent,
        //   ],
        //   stops: [0.85, 1],
        //   focal: Alignment(0, 0),
        //   focalRadius: 0.15,
        // ),
      ),
    );
  }
}
