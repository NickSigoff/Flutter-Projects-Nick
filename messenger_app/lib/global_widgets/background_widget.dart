import 'package:flutter/material.dart';

import '../utils/main_colors.dart';

class BackgroundWidget extends StatelessWidget {
  final double minClipperHeight;
  final double maxClipperHeight;

  const BackgroundWidget({
    Key? key,
    required this.minClipperHeight,
    required this.maxClipperHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(
        min: minClipperHeight,
        max: maxClipperHeight,
      ),
      child: Container(
        color: MainColors.white,
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  final double min;
  final double max;

  BackgroundClipper({required this.min, required this.max});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * min)
      ..quadraticBezierTo(
          size.width / 2, size.height * max, size.width, size.height * min)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
