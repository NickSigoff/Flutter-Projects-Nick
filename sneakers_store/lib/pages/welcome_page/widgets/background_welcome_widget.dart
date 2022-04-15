import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class BackgroundWelcomePage extends StatelessWidget {
  const BackgroundWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        ClipPath(
          clipper: _BlueStain(),
          child: Container(
            height: 360,
            color: MainColors.blueStain,
          ),
        ),
        ClipPath(
          clipper: _GreyStain(),
          child: Container(
            height: 300,
            color: MainColors.greyStain,
          ),
        ),
        ClipPath(
          clipper: _OrangeStain(),
          child: Container(
            height: 90,
            color: MainColors.orangeStain,
          ),
        ),
      ]),
    );
  }
}

/// Cuts the blue stain
class _BlueStain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..quadraticBezierTo(size.width / 2, 180, size.width, 360);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

/// Cuts the grey stain
class _GreyStain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 240)
      ..quadraticBezierTo(size.width / 2, 370, size.width, 220)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

/// Cuts the orange stain
class _OrangeStain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 3, 90, 0, 90);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
