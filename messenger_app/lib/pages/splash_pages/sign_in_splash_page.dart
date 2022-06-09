import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/sign_in_page.dart';

import 'package:messenger_app/pages/splash_pages/widgets/waiting_page_widget.dart';
import 'package:messenger_app/services/firebase_service.dart';

import '../home_page/home_page.dart';

class SplashSignInPage extends StatelessWidget {
  const SplashSignInPage({Key? key}) : super(key: key);

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
            return FutureBuilder(
                future: FirebaseService().downloadUserInfo(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? const HomePage()
                      : const WaitingPage(
                          text: 'login in progress',
                        );
                });
          } else {
            return const SignInPage();
          }
        });
  }
}
