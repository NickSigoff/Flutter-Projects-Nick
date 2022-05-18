import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/pages/auth_page/widgets/input_block_auth_pahe_widget.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/size_constants.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({Key? key}) : super(key: key);

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
                minClipperHeight: SizeConstants.minRatioHeightBackgroundClipperReg,
                maxClipperHeight: SizeConstants.maxRatioHeightBackgroundClipperReg,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogoWidget(height),
                    const Spacer(),
                    const InputBlockAuthPage()

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