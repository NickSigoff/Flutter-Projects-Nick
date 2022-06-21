import 'package:card_wallet_app/pages/welcome_page/widgets/background_welcome_page.dart';
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
              children: [
                const Spacer(flex: 6),
                Container(
                  height: 380,
                  width: 560,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card_logo.png'),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                const Text(
                  'Manage Your Cards.\nAll in One Place',
                  textAlign: TextAlign.center,
                  style: MainTextStyles.largeText,
                ),
                const Spacer(flex: 1),
                const Text(
                  'Eliminate physical cards, get virtual payment option in your hand',
                  textAlign: TextAlign.center,
                  style: MainTextStyles.regularGreyText,
                ),
                const Spacer(flex: 3),
                _buildGetStartedButton(),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return Container(
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
    );
  }
}
