import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_colors.dart';

abstract class MainGradients {
  static const BoxDecoration backgroundMainPageGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        MainColors.backgroundMainPageLight,
        MainColors.backgroundMainPageDark,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
