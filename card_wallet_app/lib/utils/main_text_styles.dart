import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainTextStyles {
  static const TextStyle largeText = TextStyle(
    color: MainColors.commonWhite,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  static const TextStyle regularButtonText = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );

  static const TextStyle regularGreyText = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    color: MainColors.lightGrey,
    fontSize: 16.0,
  );
}
