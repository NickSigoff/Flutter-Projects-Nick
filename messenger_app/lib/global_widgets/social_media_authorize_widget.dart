import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_shadows.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SocialMediaAuthorizeWidget extends StatelessWidget {
  final VoidCallback? googleSignIn;
  final VoidCallback? facebookSignIn;
  final VoidCallback? twitterSignIn;

  const SocialMediaAuthorizeWidget(
      {Key? key, this.googleSignIn, this.facebookSignIn, this.twitterSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderInscription(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialAuthWidget(
                onTap: twitterSignIn ?? () {},
                color: MainColors.twitterColor,
                child: const Image(
                  height: 28,
                  width: 28,
                  image: AssetImage('assets/images/twitter_bird.png'),
                ),
              ),
              const Spacer(),
              SocialAuthWidget(
                onTap: googleSignIn ?? () {},
                color: MainColors.red,
                child: Text(
                  'G',
                  style: MainTextStyles.largeInputBlockStyle
                      .copyWith(color: MainColors.creamWhite),
                ),
              ),
              const Spacer(),
              SocialAuthWidget(
                onTap: facebookSignIn ?? () {},
                color: MainColors.blue,
                child: Text(
                  'f',
                  style: MainTextStyles.largeInputBlockStyle
                      .copyWith(color: MainColors.creamWhite),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHeaderInscription() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0, left: 41.0, right: 41.0),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: MainColors.lightGrey,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Or continue with',
              style: MainTextStyles.smallInputBlockStyle
                  .copyWith(color: MainColors.grey),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: MainColors.lightGrey,
            ),
          ),
        ],
      ),
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
      flex: 9,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: MainShadows.containerShadow,
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          height: 52.0,
          child: child,
        ),
      ),
    );
  }
}
