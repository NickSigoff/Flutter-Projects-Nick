import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/global_widgets/social_media_authorize_widget.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:messenger_app/pages/auth_pages/sign_up_page/widgets/text_fields_input_form_sign_up_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../sign_in_page/widgets/text_fields_input_form_sign_in.dart';

class InputBlockSignUpPage extends StatelessWidget {
  static final nameController = TextEditingController();
  static final passwordController = TextEditingController();
  static final emailController = TextEditingController();

  final void Function(
      {required String email,
      required String password,
      required BuildContext context}) signUp;
  final GlobalKey formKey;

  const InputBlockSignUpPage(
      {Key? key, required this.signUp, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height * SizeConstants.ratioInputBlockReg;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(24),
      height: height,
      width: width,
      decoration: const BoxDecoration(
          color: MainColors.creamWhite,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderInputForm(),
          TextFieldsInputFormSignUpPage(
            formKey: formKey,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text('Forgot Password?',
                style: MainTextStyles.smallInputBlockStyle
                    .copyWith(color: MainColors.lightBlue)),
          ),
          ConfirmButton(
            color: MainColors.lightBlue,
            width: double.infinity,
            text: 'Sign up',
            onTap: () {
              signUp(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                context: context,
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Already have an account?',
                  style: MainTextStyles.smallInputBlockStyle,
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                      text: ' Sign in',
                      style: MainTextStyles.smallInputBlockStyle
                          .copyWith(color: MainColors.lightBlue),
                    ),
                  ]),
            ),
          ),
          const SocialMediaAuthorizeWidget(),
        ],
      ),
    );
  }

  Widget _buildHeaderInputForm() {
    return RichText(
      textAlign: TextAlign.left,
      text: const TextSpan(
          text: 'Get Started\n',
          style: MainTextStyles.largeInputBlockStyle,
          children: [
            TextSpan(
                text: 'Enter your data to create an account',
                style: MainTextStyles.smallInputBlockStyle),
          ]),
    );
  }
}
