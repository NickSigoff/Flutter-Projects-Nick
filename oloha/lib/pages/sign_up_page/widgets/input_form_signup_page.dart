import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/social_media_authtorize_widget.dart';
import 'package:oloha/pages/sign_up_page/widgets/header_input_form_sign_up_page.dart';
import 'package:oloha/pages/sign_up_page/widgets/switch_text_widget_sign_up_page.dart';

import '../../../utils/main_colors.dart';
import 'text_fields_sign_up_page.dart';

class InputFormSignUpPage extends StatelessWidget {
  final double sizeInputForm = 0.75;

  const InputFormSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * sizeInputForm,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderInputFormSignUpPage(),
          const TextFieldsSignUpPage(),
          const SwitchConfirmText(),
          const SignUpButton(),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Already have an account?',
                  style: const TextStyle(
                    color: Color(0xff696974),
                    fontFamily: 'Gilroy-semibold',
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      text: ' Sign in',
                      style: const TextStyle(
                        color: MainColors.background,
                        fontFamily: 'Gilroy-semibold',
                        fontSize: 15,
                      ),
                    ),
                  ]),
            ),
          ),
          const SocialMediaAuthorizeWidget(),
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: MainColors.background,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      height: 52,
      alignment: Alignment.center,
      child: const Text(
        'Sign Up',
        style: TextStyle(
          fontFamily: 'Gilroy-semibold',
          fontSize: 15,
        ),
      ),
    );
  }
}
