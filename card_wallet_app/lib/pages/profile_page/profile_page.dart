import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 24.0,
            right: 16.0,
            child: Icon(
              Icons.notifications,
              color: MainColors.commonWhite,
            ),
          ),
          Positioned(
            top: 80.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 56.0),
              width: width - 32.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: MainColors.lightGrey),
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(50),
                    Colors.white.withAlpha(15),
                  ],
                  //stops: [0.2, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: 'Name:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: 'William Smith')])),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: const TextSpan(
                          text: 'Email:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: 'email@gmail.com')])),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: const TextSpan(
                          text: 'Contact Number:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: '+16 6540 789 890')])),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: const TextSpan(
                          text: 'DOB:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: '23 February 1900')])),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: const TextSpan(
                          text: 'Gender:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: 'Male')])),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: const TextSpan(
                          text: 'Location:\n',
                          style: MainTextStyles.profileTextStyle,
                          children: [TextSpan(text: 'London')])),
                  const Divider(
                    color: MainColors.lightGrey,
                    height: 60.0,
                    thickness: 1.0,
                  ),
                  _buildEditProfileButton(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 32.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: MainColors.lightGrey),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/avatar.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return Container(
      height: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            MainColors.buttonLightGradient,
            MainColors.buttonDarkGradient,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: const Text(
        'Edit Profile',
        style: MainTextStyles.largeText,
      ),
    );
  }
}
