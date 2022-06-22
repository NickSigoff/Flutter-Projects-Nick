import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/pages/detail_card/card_detaily.dart';

import 'package:card_wallet_app/pages/home_page/bloc/current_page_bloc.dart';
import 'package:card_wallet_app/pages/home_page/home_page.dart';
import 'package:card_wallet_app/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentPageBloc()),
      ],
      child: MaterialApp(
          home: DetailCard(
        cardModel: CardModel(
          validity: '04/25',
          color: Colors.teal,
          balance: 1000,
          cardOwner: 'Frank Franklin'
        ),
      ))));
}
