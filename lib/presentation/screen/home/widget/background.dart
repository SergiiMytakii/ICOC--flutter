import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icoc/presentation/screen/home/widget/comet.dart';
import 'dart:math' as math;

class BackgroundHomeScreen extends StatefulWidget {
  BackgroundHomeScreen({super.key});

  @override
  State<BackgroundHomeScreen> createState() => _BackgroundHomeScreenState();
}

class _BackgroundHomeScreenState extends State<BackgroundHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late Animation<double> _rotationAnimation;
  late final int backgroundIndex;
  final launchComet = ValueNotifier<int>(0);
  int? cometIndex;
  final List<CometAnimation> launchedComets = [];

  @override
  void initState() {
    backgroundIndex = Random().nextInt(10) + 1;

    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2500), // Adjust the rotation speed
    )..repeat(); // Start the animation in a loop

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: -pi * 2, // One full rotation
    ).animate(_backgroundAnimationController);
    DateTime lastCometLaunchTime =
        DateTime.now().subtract(const Duration(seconds: 3));
    _backgroundAnimationController.addListener(() {
      final i = (_backgroundAnimationController.value * 1000).toInt() % 3;
      print(i);
      if (i == 0) {
        final now = DateTime.now();
        if (now.difference(lastCometLaunchTime).inSeconds >= 2) {
          launchComet.value = Random().nextInt(3);
          lastCometLaunchTime = now;
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _backgroundAnimationController.dispose();
  }

  final List<CometAnimation> comets = [
    const CometAnimation(
      startOffset: Offset(-1, 0.2),
      endOffset: Offset(2, 0),
      rotationAngle: math.pi / 40,
      topOffset: 0.3,
    ),
    const CometAnimation(
      startOffset: Offset(-1, 0.5),
      endOffset: Offset(2, -0.5),
      rotationAngle: -math.pi / 40,
      topOffset: 0.6,
    ),
    const CometAnimation(
      startOffset: Offset(-1, 0),
      endOffset: Offset(2, 8),
      rotationAngle: math.pi / 50,
      topOffset: 0.3,
      initialRotation: math.pi,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Transform.scale(
          scale: 2.5,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Image.asset(
              'assets/images/space/space$backgroundIndex.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
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
              print(
                  'launch comet $cometIndex  comets count ${launchedComets.length}');
              return Stack(
                children: launchedComets,
              );
            }),
      ],
    );
  }
}
