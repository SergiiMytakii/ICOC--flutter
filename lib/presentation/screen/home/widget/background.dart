import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icoc/presentation/screen/home/widget/comet.dart';

class BackgroundHomeScreen extends StatefulWidget {
  BackgroundHomeScreen({super.key});

  @override
  State<BackgroundHomeScreen> createState() => _BackgroundHomeScreenState();
}

class _BackgroundHomeScreenState extends State<BackgroundHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late final int backgroundIndex;
  final launchComet = ValueNotifier<int>(0);
  int? cometIndex;
  final List<CometAnimation> launchedComets = [];
  final Random random = Random();

  @override
  void initState() {
    backgroundIndex = random.nextInt(10) + 1;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2500),
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: -pi * 2, // One full rotation
    ).animate(_controller);
    DateTime lastCometLaunchTime =
        DateTime.now().subtract(const Duration(seconds: 3));
    _controller.addListener(() {
      final i = (_controller.value * 1000).toInt() % 3;
      if (i == 0) {
        final now = DateTime.now();
        if (now.difference(lastCometLaunchTime).inSeconds >= 2) {
          launchComet.value = random.nextInt(4);
          lastCometLaunchTime = now;
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<CometAnimation> comets = [
    const CometAnimation(
      startOffset: Offset(-1, 0.2),
      endOffset: Offset(2, 0),
      rotationAngle: pi / 40,
      topOffset: 0.3,
    ),
    const CometAnimation(
      startOffset: Offset(-1, 0.5),
      endOffset: Offset(2, -0.5),
      rotationAngle: -pi / 40,
      topOffset: 0.6,
    ),
    const CometAnimation(
      startOffset: Offset(-1, 0),
      endOffset: Offset(2, 8),
      rotationAngle: pi / 50,
      topOffset: 0.3,
      initialRotation: pi,
    ),
    const CometAnimation(
      startOffset: Offset(-1, 0.5),
      endOffset: Offset(2, 6),
      rotationAngle: pi / 60,
      topOffset: 0.3,
      initialRotation: pi / 1.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Transform.scale(
          scale: 2.3,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Transform.rotate(
              angle: pi / 2 * random.nextInt(5),
              child: Image.asset(
                'assets/images/space/space$backgroundIndex.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.black.withOpacity(0.3),
        ),
        ValueListenableBuilder(
            valueListenable: launchComet,
            builder: (context, cometIndex, __) {
              launchedComets.add(comets[cometIndex]
                  .copyWith(key: ValueKey(Random().nextInt(1000000))));
              if (launchedComets.length > 4) launchedComets.removeAt(0);
              return Stack(
                children: launchedComets,
              );
            }),
      ],
    );
  }
}
