import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_shadows.dart';

abstract class MainTextStyles {
  static TextStyle largeGetStartedPageStyle = TextStyle(
    fontFamily: 'Poppins',
    shadows: MainShadows.textShadow,
    fontSize: 50,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mediumGetStartedPageStyle = TextStyle(
    fontFamily: 'Poppins',
    shadows: MainShadows.textShadow,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  static TextStyle smallGetStartedPageStyle = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    shadows: MainShadows.textShadow,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
