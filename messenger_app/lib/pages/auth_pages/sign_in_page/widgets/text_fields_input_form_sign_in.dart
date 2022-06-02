import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/input_block_sign_in_page_widget.dart';
import 'package:messenger_app/utils/main_borders.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class TextFieldsInputFormSignIn extends StatefulWidget {
  const TextFieldsInputFormSignIn({Key? key}) : super(key: key);

  @override
  State<TextFieldsInputFormSignIn> createState() =>
      _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsInputFormSignIn> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: InputBlockSignInPage.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              focusedBorder: MainBorders.outlineInputBorderFocused,
              enabledBorder: MainBorders.outlineInputBorder,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            obscureText: _visiblePassword,
            controller: InputBlockSignInPage.passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visiblePassword = !_visiblePassword;
                  });
                },
                icon: Icon(
                  _visiblePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              labelText: 'Password',
              focusedBorder: MainBorders.outlineInputBorderFocused,
              enabledBorder: MainBorders.outlineInputBorder,
            ),
          ),
        ),
      ],
    );
  }
}
