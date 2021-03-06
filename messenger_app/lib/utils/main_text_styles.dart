import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_shadows.dart';

abstract class MainTextStyles {
  static TextStyle largeGetStartedPageStyle = TextStyle(
    color: MainColors.creamWhite,
    fontFamily: 'Poppins',
    shadows: MainShadows.textShadow,
    fontSize: 50,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mediumGetStartedPageStyle = TextStyle(
    color: MainColors.creamWhite,
    fontFamily: 'Poppins',
    shadows: MainShadows.textShadow,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  static TextStyle smallGetStartedPageStyle = TextStyle(
    color: MainColors.creamWhite,
    fontFamily: 'Poppins',
    shadows: MainShadows.textShadow,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle largeInputBlockStyle = TextStyle(
    color: MainColors.black,
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle smallInputBlockStyle = TextStyle(
    color: MainColors.black,
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
