import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class SocialSignInWidget extends StatelessWidget {
  final VoidCallback? googleSignIn;
  final VoidCallback? facebookSignIn;
  final VoidCallback? twitterSignIn;

  const SocialSignInWidget(
      {Key? key, this.googleSignIn, this.facebookSignIn, this.twitterSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialAuthWidget(
              onTap: twitterSignIn ?? () {},
              color: MainColors.twitterColor,
              child: const Image(
                height: 28.0,
                width: 28.0,
                image: AssetImage('assets/images/twitter_bird.png'),
              ),
            ),
            const Spacer(),
            SocialAuthWidget(
              onTap: googleSignIn ?? () {},
              color: MainColors.googleColor,
              child: const Image(
                height: 40.0,
                width: 40.0,
                image: AssetImage('assets/images/google_logo.png'),
              ),
            ),
            const Spacer(),
            SocialAuthWidget(
              onTap: facebookSignIn ?? () {},
              color: MainColors.facebookColor,
              child: const Image(
                height: 23.0,
                width: 23.0,
                image: AssetImage('assets/images/facebook_logo.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SocialAuthWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  const SocialAuthWidget(
      {Key? key, required this.color, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 5.0),
                  blurRadius: 5.0,
                  color: MainColors.containerShadow,
                ),
              ],
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          height: 45.0,
          child: child,
        ),
      ),
    );
  }
}
