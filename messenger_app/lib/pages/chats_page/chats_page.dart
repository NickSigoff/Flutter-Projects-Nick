import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${user!.email}'),
          Text('${user.displayName}'),
          ElevatedButton(
              onPressed: () => {FirebaseAuth.instance.signOut()},
              child: Text('Sign out'))
        ],
      ),
    );
  }
}
