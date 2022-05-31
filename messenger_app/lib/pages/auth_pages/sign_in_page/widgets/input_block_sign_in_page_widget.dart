import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/text_fields_input_form_sign_in.dart';
import 'package:messenger_app/pages/main_page/main_page.dart';
import 'package:messenger_app/pages/splash_page/sign_up_splash_page.dart';

import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../../../global_widgets/social_media_authorize_widget.dart';
import '../../../../utils/main_colors.dart';
import '../../sign_up_page/sign_up_page.dart';

class InputBlockSignInPage extends StatelessWidget {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  const InputBlockSignInPage({Key? key}) : super(key: key);

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
          const TextFieldsInputFormSignIn(),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: MainTextStyles.smallInputBlockStyle
                  .copyWith(color: MainColors.lightBlue),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return ConfirmButton(
                    color: MainColors.lightBlue,
                    width: double.infinity,
                    text: 'Sign in',
                    onTap: () {
                      context.read<AuthCubit>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    });
              } else if (state is AuthLoading) {
                return ConfirmButton(
                    color: MainColors.lightBlue,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                    onTap: () {});
              } else if (state is AuthError) {
                return ConfirmButton(
                    color: MainColors.lightBlue,
                    width: double.infinity,
                    text: 'Something wrong. Try again',
                    onTap: () {
                      context.read<AuthCubit>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    });
              } else {
                return ConfirmButton(
                    color: MainColors.lightBlue,
                    width: double.infinity,
                    text: 'Sign in',
                    onTap: () {
                      context.read<AuthCubit>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    });
              }
            },
          ),
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
                                    builder: (context) => const SplashSignUpPage()));
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
