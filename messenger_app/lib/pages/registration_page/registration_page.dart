import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/pages/registration_page/widgets/input_block_registration_page.dart';
import 'package:messenger_app/pages/splash_page/splash_page.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../utils/main_colors.dart';

class RegistrationPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

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
                    InputBlockRegistrationPage(
                        signUp: signUp, formKey: formKey),
                    //const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {

    if (formKey.currentState != null) {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SplashPage()));
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