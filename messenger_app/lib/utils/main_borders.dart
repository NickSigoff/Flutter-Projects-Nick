import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainBorders {
  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.lightGrey));

  static const OutlineInputBorder outlineInputBorderFocused =
      OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: MainColors.lightBlue));
}
