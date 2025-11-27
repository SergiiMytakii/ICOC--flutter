import 'dart:ui';

import 'package:icoc/core/constants.dart';

Color getDividerColor(int index) {
  return dividerColors[index % dividerColors.length];
}
