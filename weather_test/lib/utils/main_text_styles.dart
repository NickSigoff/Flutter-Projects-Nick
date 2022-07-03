import 'package:flutter/material.dart';
import 'package:weather_test/utils/main_colors.dart';

/// The class contains all the test styles used in the application
abstract class MainTextStyles {
  static TextStyle topTextTextStyle = const TextStyle(
    fontSize: 28,
    color: MainColors.mainBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallInscriptionsLight = const TextStyle(
    color: MainColors.mainWhite,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallInscriptionsDark = const TextStyle(
    color: MainColors.extraLightBlue,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static TextStyle dailyDetails = const TextStyle(
    color: MainColors.mainWhite,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
}
