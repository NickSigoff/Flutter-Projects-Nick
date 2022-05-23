import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../utils/main_colors.dart';
import 'input_block_registration_page.dart';

class TextFieldsInputForm extends StatefulWidget {
  final OutlineInputBorder _outlineInputBorderFocus = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.lightBlue));

  final OutlineInputBorder _outlineInputBorderEnable = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.grey));

  const TextFieldsInputForm({Key? key}) : super(key: key);

  @override
  State<TextFieldsInputForm> createState() => _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsInputForm> {
  bool _visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: InputBlockRegistrationPage.nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Your name',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: InputBlockRegistrationPage.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            obscureText: _visiblePassword,
            controller: InputBlockRegistrationPage.passwordController,
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
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              labelText: 'Password',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
      ],
    );
  }
}
