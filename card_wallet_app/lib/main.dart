import 'package:card_wallet_app/global_bloc/add_remove_card_bloc.dart';
import 'package:card_wallet_app/pages/add_card_page/bloc/card_pattern_bloc.dart';

import 'package:card_wallet_app/pages/auth_pages/bloc/auth_bloc.dart';
import 'package:card_wallet_app/pages/auth_pages/sign_in_page/sign_in_page.dart';

import 'package:card_wallet_app/pages/home_page/bloc/current_page_bloc.dart';
import 'package:card_wallet_app/pages/welcome_page/welcome_page.dart';

import 'package:card_wallet_app/utils/navigator_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/user_model.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentPageBloc()),
        BlocProvider(create: (_) => CardPatternBloc()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => AddRemoveCardBloc()),
      ],
      child: MaterialApp(
        key: Navigation.mainNavigation,
        home: WelcomePage(),
      ),
    ),
  );
}
