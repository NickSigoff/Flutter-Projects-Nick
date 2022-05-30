import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import 'input_block_sign_up_page.dart';

class TextFieldsInputFormSignUpPage extends StatefulWidget {
  final OutlineInputBorder _outlineInputBorder =  const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.lightBlue));
  final GlobalKey formKey;

  const TextFieldsInputFormSignUpPage({Key? key,required this.formKey}) : super(key: key);

  @override
  State<TextFieldsInputFormSignUpPage> createState() => _TextFieldsSignUpPageState();
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
              decoration: InputDecoration(
                labelText: 'Your name',
                focusedBorder: widget._outlineInputBorder,
                enabledBorder: widget._outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: MainColors.grey)),
              ),
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
              decoration: InputDecoration(
                labelText: 'Email',
                focusedBorder: widget._outlineInputBorder,
                enabledBorder: widget._outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: MainColors.grey)),
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
                focusedBorder: widget._outlineInputBorder,
                enabledBorder: widget._outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: MainColors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
