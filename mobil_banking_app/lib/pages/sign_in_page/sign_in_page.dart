import 'package:flutter/material.dart';
import 'package:mobil_banking_app/pages/sign_in_page/widgets/input_block_sign_in_page.dart';
import 'package:mobil_banking_app/pages/sign_in_page/widgets/social_sign_in_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _buildLogoWidget(),
            const Spacer(),
            InputBlockSignInPage(),
            const Spacer(),
            SocialSignInWidget(),
            const SizedBox(height: 40),
            Text('Don\'t have an account? Sign up'),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoWidget() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/bank_logo.png'),
          )),
    );
  }
}
