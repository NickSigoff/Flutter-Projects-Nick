import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/card_enum.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String avatar;
  List<dynamic> cardModelList;

  UserModel({
    this.cardModelList = const [],
    this.password = 'Default password',
    this.name = 'Default name',
    this.email = 'Default email',
    this.avatar = 'assets/images/avatar.jpg',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
@immutable
class CardModel {
  final CardType cardType;
  final int colorValue;
  final int balance;
  final String cardOwner;
  final String validity;
  final String cardNumber;
  final String cssNumber;

  const CardModel({
    this.cardType = CardType.undefinedCard,
    this.cardNumber = '0000000000000000',
    this.colorValue = 4289045928,
    this.balance = 0,
    this.cardOwner = 'Default Name',
    this.validity = '00/00',
    this.cssNumber = '000',
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);


  CardModel copyWith({
    CardType? cardType,
    int? colorValue,
    int? balance,
    String? cardOwner,
    String? validity,
    String? cardNumber,
    String? cssNumber,
  }) {
    return CardModel(
      cardType: cardType ?? this.cardType,
      colorValue: colorValue ?? this.colorValue,
      balance: balance ?? this.balance,
      cardOwner: cardOwner ?? this.cardOwner,
      validity: validity ?? this.validity,
      cardNumber: cardNumber ?? this.cardNumber,
      cssNumber: cssNumber ?? this.cssNumber,
    );
  }
}
