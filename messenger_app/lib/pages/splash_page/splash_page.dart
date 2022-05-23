import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/auth_page/auth_page.dart';
import 'package:messenger_app/pages/main_page/main_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../global_widgets/background_widget.dart';
import '../../utils/image_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
            return const MainPage();
          } else {
            return AuthPage(signIn: signIn);
          }
        });
  }

  void signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('By auth something went wrong $e');
    }
    Navigator.pop(context);
  }
}

class WaitingPage extends StatelessWidget {
  final String text;

  const WaitingPage({Key? key, this.text = 'Loading'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
      body: Stack(
        children: [
          const BackgroundWidget(
              minClipperHeight:
                  SizeConstants.minRatioHeightBackgroundClipperReg,
              maxClipperHeight:
                  SizeConstants.maxRatioHeightBackgroundClipperReg),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                _buildLogoWidget(height),
                const Spacer(),
                text == 'Loading'
                    ? const CircularProgressIndicator()
                    : Container(),
                Text(
                  text,
                  style: MainTextStyles.mediumGetStartedPageStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoWidget(double height) {
    return Container(
      height: height * SizeConstants.minRatioHeightBackgroundClipperReg,
      alignment: Alignment.center,
      child: Image.asset(
        ImageConstants.labelImage,
        width: 100,
        height: 100,
      ),
    );
  }
}
