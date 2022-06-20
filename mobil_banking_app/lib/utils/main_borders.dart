import 'package:flutter/material.dart';
import 'package:mobil_banking_app/utils/main_colors.dart';

abstract class MainBorders {
  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: MainColors.extraLightGrey));

  static const OutlineInputBorder outlineInputBorderFocused =
      OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MainColors.commonRed));
}
