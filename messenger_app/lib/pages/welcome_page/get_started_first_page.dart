import 'package:flutter/material.dart';
import 'package:messenger_app/pages/welcome_page/widgets/background_get_started_pages_widget.dart';
import 'package:messenger_app/utils/constants.dart';
import 'package:messenger_app/utils/main_shadows.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';
import 'widgets/navigation_status_widget.dart';

class GetStartedFirstPage extends StatelessWidget {
  const GetStartedFirstPage({Key? key}) : super(key: key);

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
            padding:
                const EdgeInsets.only(right: 32.0, left: 32.0, bottom: 32.0),
            child: Column(
              children: [
                Container(
                  height: height * Constants.maxHeightBackgroundClipper,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Constants.labelImage)),
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: MainShadows.containerShadow,
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Continue',
                      style: MainTextStyles.mediumGetStartedPageStyle
                          .copyWith(color: MainColors.lightBlue, shadows: []),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavigationStatusWidget(pageNumber: 1),
                    GestureDetector(
                      child: Text('Skip',
                          style: MainTextStyles.smallGetStartedPageStyle),
                      onTap: () {},
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
