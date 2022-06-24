import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainTextStyles {
  static const TextStyle largeText = TextStyle(
    color: MainColors.commonWhite,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  static const TextStyle signInLargeText = TextStyle(
    color: MainColors.commonWhite,
    fontFamily: 'Orbitron',
    fontWeight: FontWeight.w800,
    fontSize: 35.0,
  );

  static TextStyle cardInscription = TextStyle(
    shadows: [
      Shadow(
        offset: const Offset(1.0, 4.0),
        blurRadius: 5.0,
        color: MainColors.textShadow,
      ),
    ],
    color: MainColors.commonWhite.withAlpha(90),
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  static const TextStyle cardNumber = TextStyle(
    color: MainColors.commonWhite,
    fontFamily: 'Orbitron',
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
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

  static const TextStyle profileTextStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
}
