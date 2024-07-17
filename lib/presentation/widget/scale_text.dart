import 'package:flutter/widgets.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';

class ScaleText extends StatelessWidget {
  final Widget child;
  final double fontSize;
  const ScaleText({super.key, required this.child, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleUpdate: (details) {
          getIt<FontSizeBloc>().add(FontSizeEvent.requested(
              fontSize: calculateFontSize(fontSize, details.scale)));
        },
        child: child);
  }

  double calculateFontSize(double fontSize, double scale) {
    const double scaleFactor = 0.5;
    final double currentFontSize =
        (fontSize + (scale - 1) * scaleFactor).clamp(10, 46);
    return currentFontSize;
  }
}
