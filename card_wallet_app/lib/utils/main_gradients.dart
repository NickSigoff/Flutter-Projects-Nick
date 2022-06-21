import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainGradients {
  static const BoxDecoration backgroundMainPageGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        MainColors.backgroundLightGradient,
        MainColors.backgroundDarkGradient,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const BoxDecoration backgroundLine = BoxDecoration(
    backgroundBlendMode: BlendMode.colorDodge,
    gradient: LinearGradient(
      colors: [
        MainColors.backgroundLineLightGradient,
        MainColors.backgroundLineDarkGradient,
      ],
      stops: [0.2, 1.0],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}