import 'package:card_wallet_app/blocs/card_add_bloc/card_pattern_bloc.dart';
import 'package:card_wallet_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:card_wallet_app/blocs/bottom_bar_bloc/current_page_bloc.dart';
import 'package:card_wallet_app/pages/welcome_page/welcome_page.dart';
import 'package:card_wallet_app/utils/navigator_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/card_action_bloc/card_action_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentPageBloc()),
        BlocProvider(create: (_) => CardPatternBloc()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => CardActionBloc()),
      ],
      child: MaterialApp(
        key: Navigation.mainNavigation,
        home: const WelcomePage(),
      ),
    );
  }
}
