import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/main_colors.dart';

class DoubleButton extends StatelessWidget {
  final GestureTapCallback onTapLeftButton;
  final GestureTapCallback onTapRightButton;

  const DoubleButton(
      {Key? key, required this.onTapLeftButton, required this.onTapRightButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 20,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  clipper: _LeftSideClipper(),
                  child: Container(
                    color: MainColors.orangeStain,
                    child: const Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onTapLeftButton,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  clipper: _RightSideClipper(),
                  child: Container(
                    color: MainColors.blueStain,
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onTapRightButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RightSideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width * 0.8, 0)
      ..quadraticBezierTo(size.width, 0, size.width, size.height * 0.5)
      ..quadraticBezierTo(
          size.width, size.height, size.width * 0.8, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _LeftSideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.2, 0)
      ..quadraticBezierTo(0, 0, 0, size.height * 0.5)
      ..quadraticBezierTo(0, size.height, size.width * 0.2, size.height)
      ..lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
