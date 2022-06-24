import 'package:card_wallet_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:card_wallet_app/global_widgets/background_welcome_page.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWelcomePage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Manage Your Cards.\nAll in One Place',
                  textAlign: TextAlign.center,
                  style: MainTextStyles.largeText,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Eliminate physical cards, get virtual payment option in your hand',
                  textAlign: TextAlign.center,
                  style: MainTextStyles.regularGreyText,
                ),
                const SizedBox(height: 32.0),
                _buildGetStartedButton(context),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInPage()));
      },
      child: Container(
        height: 60.0,
        width: 260.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
            colors: [
              MainColors.buttonLightGradient,
              MainColors.buttonDarkGradient,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Text(
          'Get Started',
          style: MainTextStyles.largeText,
        ),
      ),
    );
  }
}
