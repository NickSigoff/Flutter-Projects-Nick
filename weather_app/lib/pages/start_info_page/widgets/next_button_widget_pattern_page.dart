import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/main_colors.dart';

class NextButton extends StatelessWidget {
  final void Function() onTap;
  final double percent;

  const NextButton({required this.onTap, required this.percent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: MainColors.nextButtonUncovered,
      progressColor: MainColors.nextButtonFilled,
      percent: percent,
      lineWidth: 5.0,
      radius: 80.0,
      center: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: MainColors.hintText,
          borderRadius: BorderRadius.circular(60),
        ),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
