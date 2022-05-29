import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_shadows.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final Color color;

  const ConfirmButton({
    this.color = Colors.white,
    this.width = 200,
    this.text = 'Continue',
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: MainShadows.containerShadow,
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Text(
          text,
          style: MainTextStyles.mediumGetStartedPageStyle.copyWith(
              color:
                  color == Colors.white ? MainColors.lightBlue : Colors.white,
              shadows: []),
        ),
      ),
    );
  }
}
