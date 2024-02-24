import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/font_size_bloc/font_size_bloc.dart';

class ScaleText extends StatelessWidget {
  final Widget child;
  final double fontSize;
  const ScaleText({super.key, required this.child, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleUpdate: (details) {
          context.read<FontSizeBloc>().add(FontSizeRequested(
              fontSize: calculateFontSize(fontSize, details.scale)));
        },
        child: child);
  }

  double calculateFontSize(double fontSize, double scale) {
    double scaleFactor = 0.5;
    double currentFontSize =
        (fontSize + (scale - 1) * scaleFactor).clamp(10, 46);
    return currentFontSize;
  }
}
