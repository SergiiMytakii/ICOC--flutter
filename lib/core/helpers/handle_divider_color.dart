import 'dart:ui';

import 'package:icoc/constants.dart';

Color getDividerColor(int index) {
  return dividerColors[index % dividerColors.length];
}
