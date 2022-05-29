import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/text_fields_input_form_widget.dart';

import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../../../global_widgets/social_media_authorize_widget.dart';
import '../../../../utils/main_colors.dart';
import '../../sign_up_page/sign_up_page.dart';


class InputBlockAuthPage extends StatelessWidget {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  final void Function(
      {required String email,
      required String password,
      required BuildContext context})? signIn;

  const InputBlockAuthPage({Key? key, this.signIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height *
          SizeConstants.ratioInputBlockAuth,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: MainColors.creamWhite,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderInputForm(),
          const TextFieldsInputForm(),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: MainTextStyles.smallInputBlockStyle
                  .copyWith(color: MainColors.lightBlue),
            ),
          ),
          ConfirmButton(
              color: MainColors.lightBlue,
              width: double.infinity,
              text: 'Sign in',
              onTap: () {
                signIn == null
                    ? {}
                    : signIn!(
                        context: context,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
              }),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: MainTextStyles.smallInputBlockStyle,
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPage()));
                          },
                        text: ' Sign Up',
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(color: MainColors.lightBlue)),
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
          text: 'Welcome Back\n',
          style: MainTextStyles.largeInputBlockStyle,
          children: [
            TextSpan(
                text: 'Please log in to your account',
                style: MainTextStyles.smallInputBlockStyle),
          ]),
    );
  }
}
