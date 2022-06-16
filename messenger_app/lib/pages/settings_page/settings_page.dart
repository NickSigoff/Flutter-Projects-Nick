import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:messenger_app/services/current_user_data.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInPage()));
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: MainTextStyles.largeInputBlockStyle
                    .copyWith(color: MainColors.lightBlue),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Icon(Icons.person_pin,
                      color: MainColors.lightBlue, size: 70.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CurrentUserData.currentUser.name,
                          style: MainTextStyles.smallInputBlockStyle.copyWith(
                              fontSize: 24, color: MainColors.lightBlue)),
                      Text(CurrentUserData.currentUser.email,
                          style: MainTextStyles.smallInputBlockStyle),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        await context.read<AuthCubit>().signOut();
                      },
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: MainColors.lightBlue,
                      )),
                ],
              ),
              const Divider(
                thickness: 1.0,
                color: MainColors.lightGrey,
              ),
              ..._buildOptionListWidget(),
            ],
          ),
        );
      },
    );
  }
}

List<Widget> _buildOptionListWidget() {
  const List<Icon> iconsList = [
    Icon(Icons.account_box, color: MainColors.lightBlue),
    Icon(Icons.notifications, color: MainColors.lightBlue),
    Icon(Icons.chat_bubble, color: MainColors.lightBlue),
    Icon(Icons.storage, color: MainColors.lightBlue),
    Icon(Icons.security, color: MainColors.lightBlue),
    Icon(Icons.warning, color: MainColors.lightBlue),
  ];
  const List<String> textList = [
    'Account',
    'Notification',
    'Chat settings',
    'Data and storage',
    'Privacy and security',
    'About',
  ];
  return List<Widget>.generate(
      iconsList.length,
      (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                iconsList[index],
                const SizedBox(width: 8.0),
                Expanded(
                    child: Text(
                  textList[index],
                  style: MainTextStyles.smallInputBlockStyle,
                )),
                const Icon(Icons.arrow_forward_ios, color: MainColors.grey)
              ],
            ),
          ));
}
