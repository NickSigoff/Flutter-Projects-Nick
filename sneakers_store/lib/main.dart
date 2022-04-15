import 'package:flutter/material.dart';

import 'package:flutter_projects/pages/welcome_page/welcome_page.dart';
import 'package:flutter_projects/utils/main_colors.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Italic',
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: MainColors.headerPageName,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        button: TextStyle(
          color: MainColors.gestureButton,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    home: const WelcomePage(),
  ));
}
