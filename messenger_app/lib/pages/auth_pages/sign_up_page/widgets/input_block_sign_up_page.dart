import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/global_widgets/social_media_authorize_widget.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:messenger_app/pages/auth_pages/sign_up_page/widgets/text_fields_input_form_sign_up_page.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_first_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

class InputBlockSignUpPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  static final nameController = TextEditingController();
  static final passwordController = TextEditingController();
  static final emailController = TextEditingController();

  InputBlockSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      height:
          MediaQuery.of(context).size.height * SizeConstants.ratioInputBlockReg,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: MainColors.creamWhite,
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderInputForm(),
          TextFieldsInputFormSignUpPage(
            formKey: formKey,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) => {
              if (state is AuthError)
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errorMessage)))
                }
              else if (state is Authenticated)
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStartedFirstPage()))
                }
            },
            builder: (context, state) {
              return ConfirmButton(
                color: MainColors.lightBlue,
                width: double.infinity,
                text: 'Sign up',
                onTap: () {
                  state is Loading
                      ? {}
                      : context.read<AuthCubit>().emailPasswordSignUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                },
                child: state is Loading
                    ? const Center(child: CircularProgressIndicator())
                    : null,
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
