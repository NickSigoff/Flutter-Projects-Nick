import 'package:card_wallet_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:card_wallet_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:card_wallet_app/global_widgets/background_welcome_page.dart';
import 'package:card_wallet_app/pages/home_page/home_page.dart';
import 'package:card_wallet_app/utils/main_box_decorations.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global_widgets/page_transition.dart';
import '../../utils/main_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          Navigator.pushReplacement(
              context, PageTransition(page: const SignInPage()));
        } else if (state is AuthenticatedState) {
          Navigator.pushReplacement(
              context, PageTransition(page: const HomePage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const BackgroundWelcomePage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildTextAtTop(),
                    const SizedBox(height: 16.0),
                    _buildAppDescriptionText(),
                    const SizedBox(height: 32.0),
                    _buildGetStartedButton(context),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Text _buildTextAtTop() {
    return const Text(
      'Manage Your Cards.\nAll in One Place',
      textAlign: TextAlign.center,
      style: MainTextStyles.largeText,
    );
  }

  Text _buildAppDescriptionText() {
    return const Text(
      'Eliminate physical cards, get virtual payment option in your hand',
      textAlign: TextAlign.center,
      style: MainTextStyles.regularGreyText,
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthBloc>().add(PressGetStarted());
      },
      child: Container(
        height: 60.0,
        width: 260.0,
        alignment: Alignment.center,
        decoration: MainBoxDecorations.mainConfirmButton,
        child: Text(
          'Get Started',
          style:
              MainTextStyles.largeText.copyWith(color: MainColors.commonWhite),
        ),
      ),
    );
  }
}
