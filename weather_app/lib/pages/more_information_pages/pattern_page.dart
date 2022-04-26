import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_styles.dart';

class PatternPage extends StatelessWidget {
  final String image;
  final String topText;
  final String bottomText;

  const PatternPage(
      {Key? key,
      required this.image,
      required this.bottomText,
      required this.topText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double ratio = 0.6;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Color(0xff484b5b), Color(0xff2c2d35)]),
            ),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                  ),
                ),
                const Spacer(flex: 5),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: ClipPath(
              clipper: WhiteClipper(),
              child: Container(
                height: height * ratio,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(topText, style: MainStyles.topTextTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(bottomText,
                          style: MainStyles.bottomTextTextStyle),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: NextButton(),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 32,
            right: 32,
            child: GestureDetector(
              child: const Text(
                'Skip',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: GestureDetector(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xff484b5b),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}

class WhiteClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height * 0.4)
      ..lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
