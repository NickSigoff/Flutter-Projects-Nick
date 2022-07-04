import 'package:flutter/material.dart';

import 'main_colors.dart';

abstract class MainBoxDecorations {
  static Decoration mainConfirmButton = BoxDecoration(
      boxShadow: const [
        BoxShadow(
          blurRadius: 3,
          color: MainColors.lightGrey,
          spreadRadius: 1.5,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(20.0),
      color: MainColors.deepBlue);

// static const BoxDecoration backgroundMainPageGradient = BoxDecoration(
//   gradient: LinearGradient(
//     colors: [
//       MainColors.backgroundLightGradient,
//       MainColors.backgroundDarkGradient,
//     ],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   ),
// );

// static BoxDecoration backgroundLine = BoxDecoration(
//   backgroundBlendMode: BlendMode.colorDodge,
//   gradient: LinearGradient(
//     colors: [
//       MainColors.commonBlack,
//       MainColors.commonWhite,
//     ],
//     stops: const [0.2, 0.7],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   ),
// );
}
