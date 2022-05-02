import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Function skipTap;
  const SkipButton({Key? key, required this.skipTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Positioned(
      top: 32,
      right: 32,
      child: GestureDetector(
        onTap: () {
          skipTap();
        },
        child: const Text(
          'Skip',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
