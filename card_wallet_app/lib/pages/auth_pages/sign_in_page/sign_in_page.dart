import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';
import '../../../global_widgets/background_welcome_page.dart';
import '../sign_up_page/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width - 32.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: MainColors.lightGrey),
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
                        controller: _loginController,
                        decoration: _buildInputDecoration(
                            hint: 'Enter your login', icon: Icons.person),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Error password text',
                          style: MainTextStyles.regularButtonText,
                        ),
                      ),
                      TextField(
                        style: MainTextStyles.profileTextStyle
                            .copyWith(color: MainColors.commonWhite),
                        controller: _passwordController,
                        decoration: _buildInputDecoration(
                            hint: 'Enter your password', icon: Icons.password),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Error text',
                          style: MainTextStyles.regularButtonText,
                        ),
                      ),
                      _buildLoginButton(),
                      const Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                            },
                            child: Text('New Register',
                                style: MainTextStyles.regularButtonText
                                    .copyWith(color: MainColors.commonWhite)),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text('Forget Password?',
                                style: MainTextStyles.regularButtonText
                                    .copyWith(color: MainColors.commonWhite)),
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

  Widget _buildLoginButton() {
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
              onPressed: () {},
              backgroundColor: MainColors.commonWhite,
              child: const Icon(
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
