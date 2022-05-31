import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_pages/sign_up_page/sign_up_page.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_first_page.dart';
import 'package:messenger_app/pages/splash_page/widgets/waiting_page_widget.dart';

class SplashSignUpPage extends StatelessWidget {
  const SplashSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage();
          } else if (snapshot.hasError) {
            return const WaitingPage(text: 'Something went wrong');
          } else if (snapshot.hasData) {
            return const GetStartedFirstPage();
          } else {
            return SignUpPage();
          }
        });
  }
}
