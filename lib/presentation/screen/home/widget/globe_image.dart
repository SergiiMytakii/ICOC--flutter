import 'package:flutter/material.dart';

class GlobeImage extends StatelessWidget {
  const GlobeImage({
    super.key,
    required this.angleNotifier,
    required this.screenSize,
  });

  final ValueNotifier<double> angleNotifier;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: angleNotifier,
      builder: (context, angle, _) => Transform.rotate(
        angle: angle,
        child: Container(
          width: screenSize.height * 0.8,
          height: screenSize.height * 0.8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.white,
                Colors.transparent,
              ],
              stops: [0.85, 1],
              focal: Alignment(0, 0),
              focalRadius: 0.15,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Image.asset(
              'assets/images/globe1.png',
              width: screenSize.height * 0.70,
              height: screenSize.height * 0.70,
            ),
          ),
        ),
      ),
    );
  }
}
