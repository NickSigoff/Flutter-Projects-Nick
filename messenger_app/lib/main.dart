import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/splash_page/sign_in_splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_page/bloc/bottom_bar_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BottomBarCubit())
      ],
      child: const MaterialApp(
        home: SplashSignInPage(),
      ),
    ),
  );
}
