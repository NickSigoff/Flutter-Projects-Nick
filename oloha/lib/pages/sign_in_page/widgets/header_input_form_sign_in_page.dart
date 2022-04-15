import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class HeaderInputForm extends StatelessWidget {
  const HeaderInputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'Welcome Back\n',
          style: TextStyle(
            fontFamily: 'Gilroy-semibold',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'Please log in to your account',
              style: TextStyle(
                fontFamily: 'Gilroy-regular',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: MainColors.hintColor,
              ),
            )
          ]),
    );
  }
}
