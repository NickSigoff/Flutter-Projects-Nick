import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
@immutable
class CardModel {
  final CardType cardType;
  final int colorValue;
  final int balance;
  final String cardOwner;
  final String validity;
  final String cardNumber;

  const CardModel({
    this.cardType = CardType.undefinedCard,
    this.cardNumber = '0000000000000000',
    this.colorValue = 4289045928,
    this.balance = 0,
    this.cardOwner = 'Default Name',
    this.validity = '00/00',
  });

  CardModel copyWith({
    CardType? cardType,
    int? colorValue,
    int? balance,
    String? cardOwner,
    String? validity,
    String? cardNumber,
  }) {
    return CardModel(
      cardType: cardType ?? this.cardType,
      colorValue: colorValue ?? this.colorValue,
      balance: balance ?? this.balance,
      cardOwner: cardOwner ?? this.cardOwner,
      validity: validity ?? this.validity,
      cardNumber: cardNumber ?? this.cardNumber,
    );
  }
}
