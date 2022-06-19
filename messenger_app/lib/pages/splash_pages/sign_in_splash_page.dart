import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:messenger_app/pages/splash_pages/bloc/set_current_user_cubit.dart';

import 'package:messenger_app/pages/splash_pages/widgets/waiting_page_widget.dart';

import '../home_page/home_page.dart';

class SplashSignInPage extends StatelessWidget {
  const SplashSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage(text: 'Waiting please');
          } else if (snapshot.hasError) {
            return const WaitingPage(text: 'Something went wrong');
          } else if (snapshot.hasData) {
            context.read<SetCurrentUserCubit>().setCurrentUser();
            return BlocConsumer<SetCurrentUserCubit, SetCurrentUserState>(
                listener: (context, state) async {
              if (state is Error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              } else if (state is UnidentifiedCurrentUser) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              }
            }, builder: (context, state) {
              return state is IdentifiedCurrentUser
                  ? const HomePage()
                  : const WaitingPage(text: 'Loading');
            });
          } else {
            return const SignInPage();
          }
        });
  }
}
