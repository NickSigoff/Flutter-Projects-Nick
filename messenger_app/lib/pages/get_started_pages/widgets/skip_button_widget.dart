import 'package:flutter/material.dart';
import 'package:messenger_app/pages/splash_page/sign_in_splash_page.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text('Skip', style: MainTextStyles.smallGetStartedPageStyle),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SplashSignInPage()));
      },
    );
  }
}
