import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text('Skip', style: MainTextStyles.smallGetStartedPageStyle),
      onTap: () {},
    );
  }
}
