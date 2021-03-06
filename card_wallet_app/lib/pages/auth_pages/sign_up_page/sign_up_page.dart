import 'package:card_wallet_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:card_wallet_app/pages/home_page/home_page.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global_widgets/page_transition.dart';
import '../../../utils/main_colors.dart';
import '../../../global_widgets/background_welcome_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const BackgroundWelcomePage(),
                  _buildUpperGreetings(),
                  Positioned(
                    bottom: 16.0,
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width - 32.0,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: MainColors.lightGrey,
                            spreadRadius: 1.5,
                            offset: Offset(0, 4),
                          )
                        ],
                        border:
                            Border.all(width: 1.0, color: MainColors.lightGrey),
                        borderRadius: BorderRadius.circular(16.0),
                        color: MainColors.deepBlue.withOpacity(0.9),
                      ),
                      child: _buildInputForm(state, context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildInputForm(AuthState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _textNameField(),
        _buildNameError(state),
        _buildTextEmailField(),
        _buildTextEmailError(state),
        _buildTextPasswordField(),
        _buildTextPasswordError(state),
        _buildLoginButton(state, context),
        const Spacer(),
        _buildHaveAccountButton(context),
      ],
    );
  }

  GestureDetector _buildHaveAccountButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthBloc>().add(PressSignInSignUpNavigationEvent());
        Navigator.of(context).pop(PageTransition(
          page: const SignUpPage(),
        ));
      },
      child: Text('Already have an account?',
          style: MainTextStyles.regularButtonText
              .copyWith(color: MainColors.commonWhite)),
    );
  }

  Padding _buildTextPasswordError(AuthState state) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        state is ErrorState ? state.validatePasswordError : '',
        style: MainTextStyles.errorText.copyWith(fontSize: 10),
      ),
    );
  }

  TextField _buildTextPasswordField() {
    return TextField(
      style: MainTextStyles.profileTextStyle
          .copyWith(color: MainColors.commonWhite),
      controller: _passwordController,
      decoration: _buildInputDecoration(
          hint: 'Enter your password', icon: Icons.password),
    );
  }

  Padding _buildTextEmailError(AuthState state) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        state is ErrorState ? state.validateEmailError : '',
        style: MainTextStyles.errorText,
      ),
    );
  }

  TextField _buildTextEmailField() {
    return TextField(
      style: MainTextStyles.profileTextStyle
          .copyWith(color: MainColors.commonWhite),
      controller: _emailController,
      decoration:
          _buildInputDecoration(hint: 'Enter your email', icon: Icons.email),
    );
  }

  Padding _buildNameError(AuthState state) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        state is ErrorState ? state.validateNameError : '',
        style: MainTextStyles.errorText,
      ),
    );
  }

  TextField _textNameField() {
    return TextField(
      style: MainTextStyles.profileTextStyle
          .copyWith(color: MainColors.commonWhite),
      controller: _nameController,
      decoration:
          _buildInputDecoration(hint: 'Enter your name', icon: Icons.person),
    );
  }

  Positioned _buildUpperGreetings() {
    return const Positioned(
      top: 32.0,
      left: 32.0,
      child: Text(
        'Create\nNew Account',
        style: MainTextStyles.signInLargeText,
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MainColors.deepBlue, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MainColors.commonWhite, width: 2.0),
        ),
        hintText: hint,
        hintStyle: MainTextStyles.regularGreyText,
        icon: Icon(icon, color: MainColors.commonWhite));
  }

  Widget _buildLoginButton(AuthState state, BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Login',
            style: MainTextStyles.signInLargeText
                .copyWith(color: MainColors.commonWhite),
          ),
          const SizedBox(width: 8.0),
          FloatingActionButton(
            onPressed: state is LoadingState
                ? () {}
                : () => context.read<AuthBloc>().add(PressSignUpEvent(
                      userName: _nameController.text,
                      userEmail: _emailController.text,
                      userPassword: _passwordController.text,
                    )),
            backgroundColor: MainColors.commonWhite,
            child: state is LoadingState
                ? const Center(child: CircularProgressIndicator())
                : const Icon(
                    Icons.input,
                    size: 30,
                    color: MainColors.commonBlack,
                  ),
          ),
        ],
      ),
    );
  }
}
