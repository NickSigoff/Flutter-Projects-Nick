import 'package:flutter/material.dart';

import '../../../utils/main_borders.dart';
import '../../../utils/main_colors.dart';
import '../../../utils/main_text_styles.dart';
import 'input_block_sign_up_page.dart';

class TextFieldsSignUpPage extends StatelessWidget {
  const TextFieldsSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Name',
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
            controller: InputBlockSignUpPage.nameController,
          ),
        ),
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
            controller: InputBlockSignUpPage.emailController,
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
            controller: InputBlockSignUpPage.passwordController,
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
