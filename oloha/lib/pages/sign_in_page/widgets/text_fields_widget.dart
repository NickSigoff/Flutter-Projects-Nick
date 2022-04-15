import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class TextFieldsInputForm extends StatefulWidget {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  final OutlineInputBorder _outlineInputBorderFocus = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.blue));

  final OutlineInputBorder _outlineInputBorderEnable = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.textFieldBorder));

  const TextFieldsInputForm({Key? key}) : super(key: key);

  @override
  State<TextFieldsInputForm> createState() => _TextFieldsInputFormState();
}

class _TextFieldsInputFormState extends State<TextFieldsInputForm> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'Gilroy-regular',
              fontSize: 15,
            ),
            controller: TextFieldsInputForm.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email or phone number',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
        TextField(
          style: const TextStyle(
            fontFamily: 'Gilroy-regular',
            fontSize: 15,
          ),
          obscureText: !_visiblePassword,
          controller: TextFieldsInputForm.passwordController,
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
            focusedBorder: widget._outlineInputBorderFocus,
            enabledBorder: widget._outlineInputBorderEnable,
          ),
        ),
      ],
    );
  }
}
