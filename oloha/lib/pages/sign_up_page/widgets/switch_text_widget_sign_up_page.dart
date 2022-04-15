import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class SwitchConfirmText extends StatefulWidget {
  const SwitchConfirmText({Key? key}) : super(key: key);

  @override
  State<SwitchConfirmText> createState() => _SwitchConfirmTextState();
}

class _SwitchConfirmTextState extends State<SwitchConfirmText> {
  bool _checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              activeColor: const Color(0xff34c759),
              value: _checkBoxState,
              onChanged: (bool? newValue) {
                setState(() {
                  _checkBoxState = !_checkBoxState;
                });
              },
            ),
          ),
          RichText(
            text: const TextSpan(
                text: 'By creating an account, you agree to our\n',
                style: TextStyle(
                  fontFamily: 'Gilroy-regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: MainColors.hintColor,
                ),
                children: [
                  TextSpan(
                    text: 'Term and Conditions',
                    style: TextStyle(
                      fontFamily: 'Gilroy-semibold',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
