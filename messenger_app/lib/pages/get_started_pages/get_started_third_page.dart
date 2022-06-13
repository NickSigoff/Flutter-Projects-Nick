import 'package:flutter/material.dart';
import 'package:messenger_app/global_widgets/background_widget.dart';
import 'package:messenger_app/global_widgets/confirm_button_widget.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/navigation_status_widget.dart';
import 'package:messenger_app/pages/splash_pages/sign_in_splash_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/size_constants.dart';

import '../../utils/main_text_styles.dart';

class GetStartedThirdPage extends StatelessWidget {
  const GetStartedThirdPage({Key? key}) : super(key: key);

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
                      image: AssetImage('assets/images/start_call_image.png'),
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.call,
                        color: MainColors.creamWhite, size: 35.0),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Call',
                      style: MainTextStyles.largeGetStartedPageStyle
                          .copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text(
                  'Reach out to friends and loved ones via voice or video call',
                  style: MainTextStyles.smallGetStartedPageStyle,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 3),
                ConfirmButton(
                  text: 'Get started',
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashSignInPage()));
                  },
                ),
                const Spacer(flex: 1),
                Align(
                  alignment: Alignment.centerLeft,
                  child: NavigationStatusWidget(page: this),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
