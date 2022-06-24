import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:flutter/material.dart';

import '../utils/main_colors.dart';

class CardModel {
  final CardType cardType;
  final Color color;
  final int balance;
  final String cardOwner;
  final String validity;
  final String cardNumber;

  CardModel({
    this.cardType = CardType.undefinedCard,
    this.cardNumber = '0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 0',
    this.color = MainColors.lightGrey,
    this.balance = 0,
    this.cardOwner = 'Default Name',
    this.validity = '00/00',
  });

  CardModel copyWith({
    CardType? cardType,
    Color? color,
    int? balance,
    String? cardOwner,
    String? validity,
    String? cardNumber,
  }) {
    return CardModel(
      cardType: cardType ?? this.cardType,
      color: color ?? this.color,
      balance: balance ?? this.balance,
      cardOwner: cardOwner ?? this.cardOwner,
      validity: validity ?? this.validity,
      cardNumber: cardNumber ?? this.cardNumber,
    );
  }
}
