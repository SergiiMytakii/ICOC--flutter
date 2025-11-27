import 'package:flutter/material.dart';

class GlobeImage extends StatelessWidget {
  const GlobeImage({
    super.key,
    required this.angleNotifier,
  });

  final ValueNotifier<double> angleNotifier;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                Color.fromARGB(128, 255, 255, 255),
                Colors.transparent,
              ],
              stops: [0.8, 0.95, 1],
              focal: Alignment(0, 0),
              focalRadius: 0.13,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
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
