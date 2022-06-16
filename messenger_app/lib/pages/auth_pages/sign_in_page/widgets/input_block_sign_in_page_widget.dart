import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/text_fields_input_form_sign_in.dart';
import 'package:messenger_app/pages/auth_pages/sign_up_page/sign_up_page.dart';
import 'package:messenger_app/pages/splash_pages/sign_in_splash_page.dart';

import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../../../global_widgets/social_media_authorize_widget.dart';
import '../../../../utils/main_colors.dart';

class InputBlockSignInPage extends StatelessWidget {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  const InputBlockSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(24.0),
      height: MediaQuery.of(context).size.height *
          SizeConstants.ratioInputBlockAuth,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: MainColors.creamWhite,
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
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
          BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashSignInPage()));
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) => _buildConfirmButton(context, state)),
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
                                    builder: (context) => const SignUpPage()));
                          },
                        text: ' Sign Up',
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(color: MainColors.lightBlue)),
                  ]),
            ),
          ),
          SocialMediaAuthorizeWidget(
              googleSignIn: context.read<AuthCubit>().googleSignIn),
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

  Widget _buildConfirmButton(BuildContext context, AuthState state) {
    return ConfirmButton(
        color: MainColors.lightBlue,
        width: double.infinity,
        text: state is AuthError ? 'Something wrong. Try again' : 'Sign in',
        onTap: () {
          state is Loading?
              ? {}
              : context.read<AuthCubit>().emailPasswordSignIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
        },
        child: state is Loading
            ? const Center(child: CircularProgressIndicator())
            : null);
  }
}
