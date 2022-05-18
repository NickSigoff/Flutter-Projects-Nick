import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_shadows.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SocialMediaAuthorizeWidget extends StatelessWidget {
  const SocialMediaAuthorizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderInscription(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SocialAuthWidget(
                color: Colors.black,
                child: Icon(
                  Icons.apple,
                  color: MainColors.creamWhite,
                ),
              ),
              const Spacer(),
              SocialAuthWidget(
                color: MainColors.red,
                child: Text(
                  'G',
                  style: MainTextStyles.largeInputBlockStyle
                      .copyWith(color: MainColors.creamWhite),
                ),
              ),
              const Spacer(),
              SocialAuthWidget(
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
      padding: const EdgeInsets.only(bottom: 20, left: 41, right: 41),
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

  const SocialAuthWidget({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: MainShadows.containerShadow,
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        height: 52,
        child: child,
      ),
    );
  }
}
