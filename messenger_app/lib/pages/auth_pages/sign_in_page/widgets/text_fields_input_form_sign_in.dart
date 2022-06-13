import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/utils/main_borders.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class TextFieldsInputFormSignIn extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController emailController;

  const TextFieldsInputFormSignIn(
      {required this.passwordController,
      required this.emailController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: MainTextStyles.smallInputBlockStyle,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              focusedBorder: MainBorders.outlineInputBorderFocused,
              enabledBorder: MainBorders.outlineInputBorder,
            ),
          ),
        ),
        BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, state) {
          bool isVisiblePasswordState = state is AuthVisiblePasswordSignIn
              ? state.visiblePassword
              : false;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              style: MainTextStyles.smallInputBlockStyle,
              obscureText: !isVisiblePasswordState,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<AuthCubit>()
                        .onTapVisiblePasswordSignIn(!isVisiblePasswordState);
                  },
                  icon: Icon(
                    isVisiblePasswordState
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
                labelText: 'Password',
                focusedBorder: MainBorders.outlineInputBorderFocused,
                enabledBorder: MainBorders.outlineInputBorder,
              ),
            ),
          );
        }),
      ],
    );
  }
}
