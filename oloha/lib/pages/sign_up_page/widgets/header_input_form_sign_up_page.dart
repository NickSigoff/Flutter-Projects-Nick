import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class HeaderInputFormSignUpPage extends StatelessWidget {
  const HeaderInputFormSignUpPage({Key? key}) : super(key: key);

  final TextStyle _header = const TextStyle(
    fontFamily: 'Gilroy-semibold',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.black,
  );

  final TextStyle _subheader = const TextStyle(
    fontFamily: 'Gilroy-regular',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: MainColors.hintColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text:
            TextSpan(text: 'Register new account\n', style: _header, children: [
          TextSpan(
            text: 'Please log in to your account',
            style: _subheader,
          )
        ]),
      ),
    );
  }
}
