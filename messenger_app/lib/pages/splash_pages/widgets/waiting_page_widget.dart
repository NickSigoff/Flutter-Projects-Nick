import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../utils/size_constants.dart';

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