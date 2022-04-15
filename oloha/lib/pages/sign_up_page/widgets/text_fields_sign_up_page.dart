import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class TextFieldsSignUpPage extends StatefulWidget {
  static final nameController = TextEditingController();
  static final passwordController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneNumberController = TextEditingController();

  final OutlineInputBorder _outlineInputBorderFocus = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.blue));

  final OutlineInputBorder _outlineInputBorderEnable = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: MainColors.textFieldBorder));

  const TextFieldsSignUpPage({Key? key}) : super(key: key);

  @override
  State<TextFieldsSignUpPage> createState() => _TextFieldsSignUpPageState();
}

class _TextFieldsSignUpPageState extends State<TextFieldsSignUpPage> {
  bool _visiblePassword = false;
  bool _visibleEmail = false;
  bool _visiblePhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            style: const TextStyle(
              fontFamily: 'Gilroy-regular',
              fontSize: 15,
            ),
            controller: TextFieldsSignUpPage.nameController,
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
            style: const TextStyle(
              fontFamily: 'Gilroy-regular',
              fontSize: 15,
            ),
            obscureText: _visiblePassword,
            controller: TextFieldsSignUpPage.passwordController,
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
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'Gilroy-regular',
              fontSize: 15,
            ),
            obscureText: !_visibleEmail,
            controller: TextFieldsSignUpPage.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visibleEmail = !_visibleEmail;
                  });
                },
                icon: Icon(
                  _visibleEmail
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              labelText: 'Email',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'Gilroy-regular',
              fontSize: 15,
            ),
            obscureText: !_visiblePhoneNumber,
            controller: TextFieldsSignUpPage.phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visiblePhoneNumber = !_visiblePhoneNumber;
                  });
                },
                icon: Icon(
                  _visiblePhoneNumber
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              labelText: 'Phone number',
              focusedBorder: widget._outlineInputBorderFocus,
              enabledBorder: widget._outlineInputBorderEnable,
            ),
          ),
        ),
      ],
    );
  }
}
