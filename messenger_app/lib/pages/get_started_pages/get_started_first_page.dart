import 'package:flutter/material.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/skip_button_widget.dart';
import 'package:messenger_app/utils/image_constants.dart';

import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../global_widgets/background_widget.dart';
import '../../utils/main_colors.dart';

import 'get_started_second_page.dart';
import '../../global_widgets/confirm_button_widget.dart';
import 'widgets/navigation_status_widget.dart';

class GetStartedFirstPage extends StatelessWidget {
  const GetStartedFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
      body: Stack(
        children: [
          const BackgroundWidget(
            minClipperHeight:
                SizeConstants.minRatioHeightBackgroundClipperStart,
            maxClipperHeight:
                SizeConstants.maxRatioHeightBackgroundClipperStart,
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 32.0, left: 32.0, bottom: 32.0),
            child: Column(
              children: [
                Container(
                  height: height *
                      SizeConstants.maxRatioHeightBackgroundClipperStart,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.labelImage)),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Welcome\n',
                      style: MainTextStyles.largeGetStartedPageStyle,
                      children: [
                        TextSpan(
                            text: 'Let\'s help you get started',
                            style: MainTextStyles.mediumGetStartedPageStyle)
                      ]),
                ),
                const Spacer(flex: 3),
                ConfirmButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GetStartedSecondPage()));
                  },
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationStatusWidget(page: this),
                    const SkipButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
