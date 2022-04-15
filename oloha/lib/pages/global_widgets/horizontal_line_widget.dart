import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 1,
        color: MainColors.horizontalLine,
      ),
    );
  }
}
