import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainStyles {
  static TextStyle topTextTextStyle = const TextStyle(
    fontSize: 28,
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle bottomTextTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff8b95a2),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallInscriptionsLight = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static TextStyle smallInscriptionsDark = const TextStyle(
    color: MainColors.dateTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static TextStyle dailyDetails = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static TextStyle drawerMain = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static TextStyle drawerEdit = const TextStyle(
    color: Colors.blue,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
}
