import 'package:card_wallet_app/pages/auth_pages/bloc/auth_bloc.dart';
import 'package:card_wallet_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:card_wallet_app/services/current_user_provider.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';
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
          Positioned(
            top: 24.0,
            right: 16.0,
            child: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(PressSignOutEvent());
                CurrentUserProvider.currentUser = const UserModel();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              icon: const Icon(Icons.exit_to_app),
              color: MainColors.commonWhite,
            ),
          ),
          Positioned(
            top: 80.0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
              height: height * 0.7,
              width: width - 32.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: MainColors.lightGrey),
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(50),
                    Colors.white.withAlpha(15),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: MainColors.lightGrey,
                    height: 40.0,
                    thickness: 1.0,
                  ),
                  _buildInfoWidget(context),
                  const Divider(
                    color: MainColors.lightGrey,
                    height: 40.0,
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

  Widget _buildInfoWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        children: [
          RichText(
              text: TextSpan(
                  text: 'Name:\n',
                  style: MainTextStyles.profileTextStyle,
                  children: [
                TextSpan(text: CurrentUserProvider.currentUser.name)
              ])),
          const SizedBox(height: 20.0),
          RichText(
              text: TextSpan(
                  text: 'Email:\n',
                  style: MainTextStyles.profileTextStyle,
                  children: [
                TextSpan(text: CurrentUserProvider.currentUser.email)
              ])),
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
