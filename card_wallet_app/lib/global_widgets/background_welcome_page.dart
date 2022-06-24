import 'package:card_wallet_app/utils/main_gradients.dart';
import 'package:flutter/material.dart';

class BackgroundWelcomePage extends StatelessWidget {
  const BackgroundWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MainGradients.backgroundMainPageGradient,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundLine(
            maxClipperHeight: 0.35,
            minClipperHeight: 0.15,
          ),
          const BackgroundLine(
            minClipperHeight: 0.3,
            maxClipperHeight: 0.5,
          ),
          Positioned(
            top: 120.0,
            child: Container(
              height: 380.0,
              width: 560.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/card_logo.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundLine extends StatelessWidget {
  final double minClipperHeight;
  final double maxClipperHeight;

  const BackgroundLine({
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
        decoration: MainGradients.backgroundLine,
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
      ..moveTo(0, size.height * max)
      ..lineTo(0, size.height * max + 100)
      ..lineTo(size.width, size.height * min + 100)
      ..lineTo(size.width, size.height * min);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
