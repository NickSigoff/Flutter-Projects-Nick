import 'package:flutter/material.dart';

import '../../../global_widgets/sign_floating_button_widget.dart';
import '../../../utils/main_colors.dart';

class InputBlockCreateAccountPage extends StatelessWidget {
  const InputBlockCreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldCreateAccount(
            labelText: 'Name', icon: Icon(Icons.person)),
        const TextFieldCreateAccount(
            labelText: 'Your Email', icon: Icon(Icons.email_outlined)),
        const TextFieldCreateAccount(
            labelText: 'Password', icon: Icon(Icons.password_sharp)),
        const SizedBox(
          height: 10,
        ),
        SignInButton(
          text: 'Sign Up',
          onTap: () {},
        ),
      ],
    );
  }
}

class TextFieldCreateAccount extends StatelessWidget {
  final String labelText;
  final Icon icon;

  const TextFieldCreateAccount(
      {Key? key, required this.icon, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: MainColors.liteInputFieldColor,
          filled: true,
          labelText: labelText,
          prefixIcon: icon,
          focusColor: MainColors.orangeStain,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: MainColors.orangeStain,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: MainColors.darkInputFieldColor),
            //borderSide:
          ),
        ),
      ),
    );
  }
}
