import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => {FirebaseAuth.instance.signOut()},
            child: const Text('Sign out')),
          _buildAppbarInfoWidget(email: user?.email, name: user?.displayName),


      ],
    );
  }
  Widget _buildAppbarInfoWidget({String? email, String? name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(email ?? 'Default email',
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 10)),
              Text(name ?? 'Default name',
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 10)),
            ],
          ),
          const Icon(Icons.person_pin, color: MainColors.lightBlue, size: 40),
        ],
      ),
    );
  }
}

