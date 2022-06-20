import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/main_text_styles.dart';
import 'input_fields_sign_up_page.dart';


class InputBlockSignUpPage extends StatelessWidget {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  const InputBlockSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextFieldsSignUpPage(),
          const SizedBox(height: 50,),
          _buildSignUpButton(onTap: (){}),
        ],
      ),
    );
  }

  Widget _buildSignUpButton({required VoidCallback onTap}) {
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
            'Sign Up',
            style: MainTextStyles.largeButtonText,
          ),
        ));
  }
}
