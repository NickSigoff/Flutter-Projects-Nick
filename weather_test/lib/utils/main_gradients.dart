import 'package:flutter/cupertino.dart';

import 'main_colors.dart';

/// The class contains all the gradients used in the application
abstract class MainGradients {
  static const LinearGradient backgroundGradient = LinearGradient(colors: [
    MainColors.mainDeepBlueGradient,
    MainColors.mainLightBlueGradient,
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  static const LinearGradient textGradient = LinearGradient(
      colors: [MainColors.textLightGradient, MainColors.textDeepGradient]);
}
