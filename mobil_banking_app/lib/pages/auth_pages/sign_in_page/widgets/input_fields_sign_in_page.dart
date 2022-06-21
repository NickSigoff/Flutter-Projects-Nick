import 'package:flutter/material.dart';
import 'package:mobil_banking_app/utils/main_borders.dart';
import 'package:mobil_banking_app/utils/main_colors.dart';
import 'package:mobil_banking_app/utils/main_text_styles.dart';

import 'input_block_sign_in_page.dart';

class TextFieldsSignInPage extends StatelessWidget {
  const TextFieldsSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Email',
            textAlign: TextAlign.start,
            style: MainTextStyles.regularTextHint
                .copyWith(color: MainColors.commonBlack),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: MainColors.extraLightGrey,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: TextField(
            decoration: const InputDecoration(
              focusedBorder: MainBorders.outlineInputBorderFocused,
              enabledBorder: MainBorders.outlineInputBorder,
              border: InputBorder.none,
            ),
            controller: InputBlockSignInPage.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text('Password',
              style: MainTextStyles.regularTextHint
                  .copyWith(color: MainColors.commonBlack)),
        ),
        Container(
          decoration: BoxDecoration(
            color: MainColors.extraLightGrey,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: TextField(
            //obscureText: !isVisiblePasswordState,
            controller: InputBlockSignInPage.passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off_outlined,
                ),
              ),
              focusedBorder: MainBorders.outlineInputBorderFocused,
              enabledBorder: MainBorders.outlineInputBorder,
            ),
          ),
        )
      ],
    );
  }
}
