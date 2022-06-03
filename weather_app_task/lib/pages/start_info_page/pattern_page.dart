import 'package:flutter/material.dart';
import 'package:weather_app_task/pages/start_info_page/widgets/skip_button_widget.dart';

import '../../utils/list_slides_page.dart';
import '../../utils/main_styles.dart';
import '../welcome_page/welcome_page.dart';
import 'widgets/next_button_widget_pattern_page.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  int pageIndex = 0;

  void nextButtonTap() {
    if (pageIndex >= ListParameters.slidesPages.length - 1) {
      skipTap();
      return;
    }
    setState(() {
      pageIndex++;
    });
  }

  void skipTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PageInfoHolder pageInfoHolder = ListParameters.slidesPages[pageIndex];

    return Scaffold(
      body: Stack(
        children: [
          ///background
          ClipPath(
            clipper: Clipper(),
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [Color(0xff484b5b), Color(0xff2c2d35)]),
              ),
            ),
          ),

          ///elements
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: width * 0.6,
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(pageInfoHolder.image)),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pageInfoHolder.topText,
                        style: MainStyles.topTextTextStyle,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        pageInfoHolder.bottomText,
                        style: MainStyles.bottomTextTextStyle,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      NextButton(
                          onTap: nextButtonTap,
                          percent: pageInfoHolder.percent),
                    ],
                  ),
                )
              ],
            ),
          ),
          SkipButton(skipTap: skipTap),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
          size.width / 2, size.height * 0.4, size.width, size.height * 0.6)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
