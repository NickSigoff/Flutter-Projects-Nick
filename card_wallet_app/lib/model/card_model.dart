import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:flutter/material.dart';

import '../utils/main_colors.dart';

class CardModel {
  final CardType cardType;
  final Color color;
  final int balance;
  final String cardOwner;
  final String validity;
  final String lastFourNumber;

  CardModel({
     this.cardType = CardType.undefinedCard,
     this.lastFourNumber = '0 0 0 0',
     this.color = MainColors.lightGrey,
     this.balance = 0,
     this.cardOwner = 'Default Name',
     this.validity = '00/00',
  });
}
