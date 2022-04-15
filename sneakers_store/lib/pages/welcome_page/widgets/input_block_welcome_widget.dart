import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/catalog_page/catalog_page.dart';

import 'package:flutter_projects/utils/main_colors.dart';

import '../../../global_widgets/sign_floating_button_widget.dart';

class InputBlockWelcomePage extends StatefulWidget {
  const InputBlockWelcomePage({Key? key}) : super(key: key);

  @override
  InputBlockWelcomePageState createState() => InputBlockWelcomePageState();
}

class InputBlockWelcomePageState extends State<InputBlockWelcomePage> {
  bool _visiblePassword = false;

  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 79,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              focusNode: emailFocus,
              onFieldSubmitted: (_) {
                emailFocus.unfocus();
                FocusScope.of(context).requestFocus(passwordFocus);
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: MainColors.liteInputFieldColor,
                filled: true,
                labelText: 'Your Email',
                //hintText: 'admin by default',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                    )),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: MainColors.blueStain,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: MainColors.greyStain),
                  //borderSide:
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              focusNode: passwordFocus,
              controller: passwordController,
              obscureText: !_visiblePassword,
              decoration: InputDecoration(
                fillColor: MainColors.liteInputFieldColor,
                filled: true,
                labelText: 'Password',
                //hintText: 'admin by default',
                prefixIcon: const Icon(
                  Icons.password_sharp,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_visiblePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                    });
                  },
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: MainColors.blueStain,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: MainColors.greyStain),
                  //borderSide:
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Sign in',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CatalogPage()));
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
