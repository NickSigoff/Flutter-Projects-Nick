import 'package:flutter/material.dart';

class TopBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;

  final buttonTopLeftPadding = 40.0;

  const TopBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: buttonTopLeftPadding, left: buttonTopLeftPadding),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else {
            Navigator.pop(context);
          }
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
