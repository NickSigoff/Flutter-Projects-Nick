import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobil_banking_app/pages/sign_in_page/widgets/input_block_sign_in_page.dart';
import 'package:mobil_banking_app/pages/sign_in_page/widgets/social_sign_in_widget.dart';
import 'package:mobil_banking_app/utils/main_colors.dart';
import 'package:mobil_banking_app/utils/main_text_styles.dart';

import '../sign_up_page/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            _buildLogoWidget(),
            const Spacer(),
            const InputBlockSignInPage(),
            const Spacer(),
            const SocialSignInWidget(),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: MainTextStyles.regularTextHint
                      .copyWith(color: MainColors.commonBlack),
                  children: [
                    TextSpan(
                        text: ' Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          }),
                        style: MainTextStyles.regularTextHint),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildLogoWidget() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/bank_logo.png'),
          )),
    );
  }
}
