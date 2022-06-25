import 'package:card_wallet_app/pages/auth_pages/bloc/auth_bloc.dart';
import 'package:card_wallet_app/pages/home_page/home_page.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/main_colors.dart';
import '../../../global_widgets/background_welcome_page.dart';
import '../sign_up_page/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
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
                  const Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Text(
                      'Hello Again',
                      style: MainTextStyles.signInLargeText,
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width - 32.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.0, color: MainColors.lightGrey),
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            style: MainTextStyles.profileTextStyle
                                .copyWith(color: MainColors.commonWhite),
                            controller: _emailController,
                            decoration: _buildInputDecoration(
                                hint: 'Enter your login', icon: Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              state is ErrorState
                                  ? state.validateEmailError
                                  : '',
                              style: MainTextStyles.errorText,
                            ),
                          ),
                          TextField(
                            style: MainTextStyles.profileTextStyle
                                .copyWith(color: MainColors.commonWhite),
                            controller: _passwordController,
                            decoration: _buildInputDecoration(
                                hint: 'Enter your password',
                                icon: Icons.password),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              state is ErrorState
                                  ? state.validatePasswordError
                                  : '',
                              style: MainTextStyles.errorText,
                            ),
                          ),
                          _buildLoginButton(context, state),
                          const Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(PressSignInSignUpNavigationEvent());
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                                },
                                child: Text('New Register',
                                    style: MainTextStyles.regularButtonText
                                        .copyWith(
                                            color: MainColors.commonWhite)),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text('Forget Password?',
                                    style: MainTextStyles.regularButtonText
                                        .copyWith(
                                            color: MainColors.commonWhite)),
                              ),
                            ],
                          )
                        ],
                      ),
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

  InputDecoration _buildInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: MainColors.buttonDarkGradient, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MainColors.commonWhite, width: 2.0),
        ),
        hintText: hint,
        hintStyle: MainTextStyles.regularGreyText,
        icon: Icon(icon, color: MainColors.commonWhite));
  }

  Widget _buildLoginButton(BuildContext context, AuthState state) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 100.0,
        width: 200.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Login',
              style: MainTextStyles.signInLargeText,
            ),
            const SizedBox(width: 8.0),
            FloatingActionButton(
              onPressed: state is LoadingState
                  ? () {}
                  : () {
                      context.read<AuthBloc>().add(PressSignInEvent(
                          userEmail: _emailController.text,
                          userPassword: _passwordController.text));
                    },
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
      ),
    );
  }
}
