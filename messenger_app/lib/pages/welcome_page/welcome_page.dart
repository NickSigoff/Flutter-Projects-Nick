import 'package:flutter/material.dart';
import 'package:messenger_app/pages/welcome_page/widgets/background_welcome_page_widget.dart';
import 'package:messenger_app/utils/constants.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
      body: Stack(
        children: [
          const BackgroundWelcomePage(),
          Column(
            children: [
              Container(
                height: height * Constants.maxHeightBackgroundClipper,
                decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(Constants.labelImage)),
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: 'Welcome', style: MainTextStyles.mainPageStyle))
            ],
          ),
        ],
      ),
    );
  }
}
