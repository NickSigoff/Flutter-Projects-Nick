import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobil_banking_app/pages/auth_pages/sign_up_page/widgets/input_block_sign_up_page.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/main_text_styles.dart';
import '../sign_in_page/sign_in_page.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            const InputBlockSignUpPage(),
            const Spacer(),
            RichText(
              text: TextSpan(
                  text: 'Already have an account?',
                  style: MainTextStyles.regularTextHint
                      .copyWith(color: MainColors.commonBlack),
                  children: [
                    TextSpan(
                        text: ' Sign in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
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
