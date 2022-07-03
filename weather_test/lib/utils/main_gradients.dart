import 'package:flutter/cupertino.dart';

import 'main_colors.dart';

abstract class MainGradients {
  static const LinearGradient backgroundGradient = LinearGradient(colors: [
    MainColors.mainDeepBlueGradient,
    MainColors.mainLightBlueGradient,
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  static const LinearGradient textGradient =
      LinearGradient(colors: [Color(0xfffaf5f5), Color(0xffa7b8e8)]);
}
