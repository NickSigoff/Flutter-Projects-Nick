import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainShadows {
  static List<Shadow> textShadow = [
    Shadow(
      offset: const Offset(0.0, 5.0),
      blurRadius: 10.0,
      color: MainColors.textShadow,
    ),
  ];
  static List<BoxShadow> containerShadow = [
    BoxShadow(
      offset: const Offset(0.0, 5.0),
      blurRadius: 5.0,
      color: MainColors.containerShadow,
    ),
  ];
}
