import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../../utils/main_borders.dart';
import 'input_block_sign_up_page.dart';

class TextFieldsInputFormSignUpPage extends StatefulWidget {
  final GlobalKey formKey;

  const TextFieldsInputFormSignUpPage({Key? key, required this.formKey})
      : super(key: key);

  @override
  State<TextFieldsInputFormSignUpPage> createState() =>
      _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsInputFormSignUpPage> {
  bool _visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              style: MainTextStyles.smallInputBlockStyle,
              controller: InputBlockSignUpPage.nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  labelText: 'Your name',
                  focusedBorder: MainBorders.outlineInputBorderFocused,
                  enabledBorder: MainBorders.outlineInputBorder),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              style: MainTextStyles.smallInputBlockStyle,
              controller: InputBlockSignUpPage.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (email) =>
                  email == null ? 'Enter correct email' : null,
              decoration: const InputDecoration(
                labelText: 'Email',
                focusedBorder: MainBorders.outlineInputBorderFocused,
                enabledBorder: MainBorders.outlineInputBorder,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              style: MainTextStyles.smallInputBlockStyle,
              obscureText: _visiblePassword,
              controller: InputBlockSignUpPage.passwordController,
              keyboardType: TextInputType.text,
              validator: (password) => password != null && password.length < 6
                  ? 'Enter min 6 char'
                  : null,
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
                  focusedBorder: MainBorders.outlineInputBorderFocused,
                  enabledBorder: MainBorders.outlineInputBorder),
            ),
          ),
        ],
      ),
    );
  }
}
