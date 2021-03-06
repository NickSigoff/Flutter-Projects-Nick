import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:messenger_app/pages/auth_pages/bloc/auth_cubit.dart';
import 'package:messenger_app/pages/chat_detail_page/bloc/chat_detail_cubit.dart';
import 'package:messenger_app/pages/chats_page/bloc/chat_cubit.dart';
import 'package:messenger_app/pages/chats_page/bloc/last_message_cubit.dart';
import 'package:messenger_app/pages/search_page/bloc/search_cubit.dart';
import 'package:messenger_app/pages/splash_pages/bloc/set_current_user_cubit.dart';
import 'package:messenger_app/pages/splash_pages/sign_in_splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_page/bloc/bottom_bar_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BottomBarCubit()),
        BlocProvider(create: (_) => ChatDetailCubit()),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => ChatCubit()),
        BlocProvider(create: (_) => LastMessageCubit()),
        BlocProvider(create: (_) => SetCurrentUserCubit()),
      ],
      child: const MaterialApp(
        home: SplashSignInPage(),
      ),
    ),
  );
}


// {
// "message":{
// "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
// "notification":{
// "title":"Portugal vs. Denmark",
// "body":"great match!"
// }
// }
// }
