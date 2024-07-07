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

    _opacityAnimation = Tween<double>(begin: 1, end: 0.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.3, curve: Curves.easeInOut),
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
        return Transform.translate(
          offset: Offset(
            MediaQuery.of(context).size.width * _positionAnimation.value.dx,
            MediaQuery.of(context).size.height *
                widget.topOffset *
                _positionAnimation.value.dy,
          ),
          child: RotationTransition(
            turns: _rotationAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: CustomPaint(
                painter: CometPainter(_positionAnimation.value),
                size: const Size(150, 25),
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
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final path = Path();
    path.moveTo(0, size.height / 2);
    final tailLength = size.width * offset.dx;
    const maxStrokeWidth = 5.0;

    for (double i = 0; i < tailLength; i += 10) {
      final strokeWidth = maxStrokeWidth * (i / tailLength);
      paint.strokeWidth = strokeWidth;
      path.lineTo(i, size.height / 10);
      canvas.drawPath(path, paint);
      path.reset();
      path.moveTo(i, size.height / 10);
    }

    final cometPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * offset.dx, size.height / 10), 5, cometPaint);
  }

  @override
  bool shouldRepaint(CometPainter oldDelegate) => true;
}
