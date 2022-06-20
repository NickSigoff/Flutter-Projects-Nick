import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/main_text_styles.dart';
import 'input_fields_sign_in_page.dart';

class InputBlockSignInPage extends StatelessWidget {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  const InputBlockSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextFieldsSignInPage(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            alignment: Alignment.centerRight,
            child: const Text(
              'Forgot Password?',
              style: MainTextStyles.regularTextHint,
            ),
          ),
          _buildSignInButton(onTap: (){}),
        ],
      ),
    );
  }

  Widget _buildSignInButton({required VoidCallback onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 5.0),
                blurRadius: 5.0,
                color: MainColors.containerShadow,
              ),
            ],
            borderRadius: BorderRadius.circular(6.0),
            color: MainColors.commonRed,
          ),
          child: const Text(
            'Sign in',
            style: MainTextStyles.largeButtonText,
          ),
        ));
  }
}
