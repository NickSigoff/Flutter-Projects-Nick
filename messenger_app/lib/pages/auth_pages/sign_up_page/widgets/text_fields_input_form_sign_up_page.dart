import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../../utils/main_borders.dart';
import 'input_block_sign_up_page.dart';

class TextFieldsInputFormSignUpPage extends StatelessWidget {
  final GlobalKey formKey;

  const TextFieldsInputFormSignUpPage({Key? key, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: widget.formKey,
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
          BlocBuilder<AuthCubit, AuthState>(
              builder: (BuildContext context, state) {
                bool isVisiblePasswordState =
                state is AuthVisiblePasswordSignUp ? state.visiblePassword : false;
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    style: MainTextStyles.smallInputBlockStyle,
                    obscureText: !isVisiblePasswordState,
                    controller: InputBlockSignUpPage.passwordController,
                    keyboardType: TextInputType.text,
                    validator: (password) =>
                    password != null && password.length < 6
                        ? 'Enter min 6 char'
                        : null,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<AuthCubit>().onTapVisiblePasswordSignUp(
                                !isVisiblePasswordState);
                          },
                          icon: Icon(
                            isVisiblePasswordState
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        labelText: 'Password',
                        focusedBorder: MainBorders.outlineInputBorderFocused,
                        enabledBorder: MainBorders.outlineInputBorder),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
