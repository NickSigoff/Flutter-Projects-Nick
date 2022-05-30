import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/input_block_sign_in_page_widget.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class TextFieldsInputFormSignIn extends StatefulWidget {
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.grey));

  const TextFieldsInputFormSignIn({Key? key}) : super(key: key);

  @override
  State<TextFieldsInputFormSignIn> createState() => _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsInputFormSignIn> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: InputBlockSignInPage.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              focusedBorder: widget._outlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: MainColors.lightBlue)),
              enabledBorder: widget._outlineInputBorder,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
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
              focusedBorder: widget._outlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: MainColors.lightBlue)),
              enabledBorder: widget._outlineInputBorder,
            ),
          ),
        ),
      ],
    );
  }
}
