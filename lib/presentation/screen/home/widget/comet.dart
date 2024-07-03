import 'package:flutter/material.dart';

class CometAnimation extends StatefulWidget {
  final Offset startOffset;
  final Offset endOffset;
  final double rotationAngle;
  final double initialRotation;
  final double topOffset;

  const CometAnimation({
    super.key,
    required this.startOffset,
    required this.endOffset,
    required this.rotationAngle,
    required this.topOffset,
    this.initialRotation = 0,
  });

  CometAnimation copyWith({
    Key? key,
    Offset? startOffset,
    Offset? endOffset,
    double? initialRotation,
    double? rotationAngle,
    double? topOffset,
  }) {
    return CometAnimation(
      key: key ?? this.key,
      startOffset: startOffset ?? this.startOffset,
      endOffset: endOffset ?? this.endOffset,
      initialRotation: initialRotation ?? this.initialRotation,
      rotationAngle: rotationAngle ?? this.rotationAngle,
      topOffset: topOffset ?? this.topOffset,
    );
  }

  @override
  State<CometAnimation> createState() => _CometAnimationState();
}

class _CometAnimationState extends State<CometAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..forward();

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.startOffset,
      end: widget.endOffset,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _rotationAnimation = Tween<double>(
      begin: widget.initialRotation,
      end: widget.initialRotation + widget.rotationAngle,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 800),
          left: MediaQuery.of(context).size.width * _positionAnimation.value.dx,
          top: MediaQuery.of(context).size.height *
              widget.topOffset *
              _positionAnimation.value.dy,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: AnimatedOpacity(
              opacity: _opacityAnimation.value,
              duration: const Duration(milliseconds: 800),
              child: CustomPaint(
                painter: CometPainter(_positionAnimation.value),
                size: const Size(200, 50),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CometPainter extends CustomPainter {
  final Offset offset;

  CometPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * offset.dx, size.height / 2);

    canvas.drawPath(path, paint);

    final cometPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * offset.dx, size.height / 2), 5, cometPaint);
  }

  @override
  bool shouldRepaint(CometPainter oldDelegate) => true;
}
