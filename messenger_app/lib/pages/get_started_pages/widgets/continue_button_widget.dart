import 'package:flutter/material.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_second_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_shadows.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class ContinueButton extends StatelessWidget {
 final MaterialPageRoute route;

  const ContinueButton({
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, route);
      },
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: MainShadows.containerShadow,
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Text(
          'Continue',
          style: MainTextStyles.mediumGetStartedPageStyle
              .copyWith(color: MainColors.lightBlue, shadows: []),
        ),
      ),
    );
  }
}