import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/pages/auth_pages/sign_up_page/widgets/input_block_sign_up_page.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_first_page.dart';

import 'package:messenger_app/services/firebase_methods.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../../utils/main_colors.dart';

class SignUpPage extends StatelessWidget {

  SignUpPage({Key? key}) : super(key: key);

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
                    InputBlockSignUpPage(),
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
