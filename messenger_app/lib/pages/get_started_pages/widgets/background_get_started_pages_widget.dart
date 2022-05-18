import 'package:flutter/material.dart';
import 'package:messenger_app/utils/constants.dart';

class BackgroundGetStartedPages extends StatelessWidget {
  const BackgroundGetStartedPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        color: Colors.white,
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * Constants.minHeightBackgroundClipper)
      ..quadraticBezierTo(
          size.width / 2,
          size.height * Constants.maxHeightBackgroundClipper,
          size.width,
          size.height * Constants.minHeightBackgroundClipper)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
