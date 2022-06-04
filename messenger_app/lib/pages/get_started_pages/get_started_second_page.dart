import 'package:flutter/material.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_third_page.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/navigation_status_widget.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/skip_button_widget.dart';
import 'package:messenger_app/utils/main_text_styles.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../global_widgets/background_widget.dart';
import '../../utils/main_colors.dart';

class GetStartedSecondPage extends StatelessWidget {
  const GetStartedSecondPage({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height *
                      SizeConstants.maxRatioHeightBackgroundClipperStart,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/start_message_image.png'),
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.message,
                        color: MainColors.creamWhite, size: 35.0),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Message',
                      style: MainTextStyles.largeGetStartedPageStyle
                          .copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text(
                  'Send messages to your friends around the world',
                  style: MainTextStyles.smallGetStartedPageStyle,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 3),
                ConfirmButton(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStartedThirdPage()));
                }),
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
