import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/social_media_authtorize_widget.dart';
import 'package:oloha/pages/sign_in_page/widgets/text_fields_widget.dart';
import 'package:oloha/utils/main_colors.dart';

import '../../main_page/main_page.dart';
import '../../sign_up_page/sign_up_page.dart';
import 'header_input_form_sign_in_page.dart';

class InputFormSignInPage extends StatelessWidget {
  final sizeInputBlock = 0.6;

  const InputFormSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height * sizeInputBlock,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderInputForm(),
          const TextFieldsInputForm(),
          Container(
            alignment: Alignment.centerRight,
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Gilroy-regular',
                fontSize: 14,
              ),
            ),
          ),
          const SignInButton(),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: const TextStyle(
                    color: Color(0xff696974),
                    fontFamily: 'Gilroy-semibold',
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                      text: ' Sign Up',
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

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: MainColors.background,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        height: 52,
        alignment: Alignment.center,
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontFamily: 'Gilroy-semibold',
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
