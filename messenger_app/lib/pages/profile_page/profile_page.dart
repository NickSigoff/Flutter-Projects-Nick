import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/shared_preferences_methods.dart';
import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _userEmail;
  String? _userName;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              SharedPreferencesMethods.setUserLoggedInSharedPreferences(false);
              SharedPreferencesMethods.setUserNameSharedPreferences(
                  'Default name');
              SharedPreferencesMethods.setUserEmailSharedPreferences(
                  'Default email');
              SharedPreferencesMethods.setUserIdSharedPreferences('Default id');
            },
            child: const Text('Sign out')),
        _buildAppbarInfoWidget(),
      ],
    );
  }

  Widget _buildAppbarInfoWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(_userEmail ?? 'Default email',
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 10)),
              Text(_userName ?? 'Default name',
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 10)),
              Text(_userId ?? 'Default id',
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 10)),
            ],
          ),
          const Icon(Icons.person_pin, color: MainColors.lightBlue, size: 40),
        ],
      ),
    );
  }

  _getDataFromSharedPreferences() async {
    _userEmail = await SharedPreferencesMethods.getUserEmailSharedPreferences();
    _userName = await SharedPreferencesMethods.getUserNameSharedPreferences();
    _userId = await SharedPreferencesMethods.getUserIdSharedPreferences();
    setState(() {});
  }
}
