import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class BackgroundCreateAccount extends StatelessWidget {
  const BackgroundCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: _GreyStain(),
          child: Container(
            color: MainColors.greyStain,
          ),
        ),
        ClipPath(
          clipper: _WhiteStain(),
          child: Container(
            color: MainColors.whiteStain,
          ),
        ),
      ],
    );
  }
}

/// Cuts the grey stain
class _GreyStain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 280)
      ..quadraticBezierTo(500, 400, size.width, 100)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _WhiteStain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..moveTo(170, size.height)
      ..quadraticBezierTo(
          170, size.height - size.height / 4, size.width, size.height - size.height / 3.2)
      ..lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
