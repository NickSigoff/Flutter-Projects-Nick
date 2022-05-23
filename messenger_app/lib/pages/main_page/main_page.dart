import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
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
      ),
    );
  }
}
