import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_page/widgets/input_block_auth_page_widget.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class TextFieldsInputForm extends StatefulWidget {
  final OutlineInputBorder _outlineInputBorderEnable = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.grey));

  const TextFieldsInputForm({Key? key}) : super(key: key);

  @override
  State<TextFieldsInputForm> createState() => _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsInputForm> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: InputBlockAuthPage.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              focusedBorder: widget._outlineInputBorderEnable.copyWith(
                  borderSide: const BorderSide(color: MainColors.lightBlue)),
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            obscureText: _visiblePassword,
            controller: InputBlockAuthPage.passwordController,
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
              focusedBorder: widget._outlineInputBorderEnable.copyWith(
                  borderSide: const BorderSide(color: MainColors.lightBlue)),
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
      ],
    );
  }
}
