import 'package:flutter/material.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/background_get_started_pages_widget.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/continue_button_widget.dart';
import 'package:messenger_app/pages/get_started_pages/widgets/navigation_status_widget.dart';
import 'package:messenger_app/utils/main_colors.dart';

import '../../utils/constants.dart';
import '../../utils/main_text_styles.dart';

class GetStartedThirdPage extends StatelessWidget {
  const GetStartedThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
      body: Stack(
        children: [
          const BackgroundGetStartedPages(),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height * Constants.maxHeightBackgroundClipper,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                      AssetImage('assets/images/start_call_image.png'),
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.call,
                        color: MainColors.creamWhite, size: 35),
                    const SizedBox(
                      width: 8,
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
                ContinueButton(
                    route: MaterialPageRoute(
                        builder: (context) => const GetStartedThirdPage())),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationStatusWidget(page: this),
                    GestureDetector(
                      onTap: (){},
                      child: Text('Get started', style: MainTextStyles.smallGetStartedPageStyle,),
                    ),
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
