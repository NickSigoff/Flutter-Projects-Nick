import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainTextStyles {
  static const TextStyle largeButtonText = TextStyle(
    color: MainColors.commonWhite,
    fontFamily: 'Orbitron',
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  static const TextStyle regularButtonText = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );

  static const TextStyle regularTextHint = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    color: MainColors.commonRed,
    fontSize: 18.0,
  );
}
