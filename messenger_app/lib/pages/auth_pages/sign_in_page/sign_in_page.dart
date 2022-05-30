import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/widgets/input_block_sign_in_page_widget.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/firebase_constants.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/size_constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              const BackgroundWidget(
                minClipperHeight:
                    SizeConstants.minRatioHeightBackgroundClipperReg,
                maxClipperHeight:
                    SizeConstants.maxRatioHeightBackgroundClipperReg,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogoWidget(height),
                    const Spacer(),
                    InputBlockSignInPage(signIn: signIn),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      FirebaseMethods.downloadUserInfo(userId);
    }
    Navigator.pop(context);
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
