import 'package:flutter/material.dart';
import 'package:mobil_banking_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Spacer(),
            _buildLogoWidget(),
            const Spacer(),
            _buildLogInButton(onTap: () {}),
            const SizedBox(height: 40.0),
            _buildSupportButton(
              text: 'Contact the bank',
              icon: Icons.question_answer,
            ),
            const SizedBox(height: 20.0),
            _buildSupportButton(
              text: 'Language',
              icon: Icons.language,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoWidget() {
    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300.0),
          border: Border.all(color: MainColors.commonRed, width: 2.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/bank_welcome_image.png'),
          )),
    );
  }

  Widget _buildLogInButton({required VoidCallback onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 5.0),
                blurRadius: 5.0,
                color: MainColors.containerShadow,
              ),
            ],
            borderRadius: BorderRadius.circular(6.0),
            color: MainColors.commonRed,
          ),
          child: const Text(
            'Log in',
            style: MainTextStyles.largeButtonText,
          ),
        ));
  }

  Widget _buildSupportButton(
      {required String text, required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: MainColors.extraLightGrey,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              text,
              style: MainTextStyles.regularButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
