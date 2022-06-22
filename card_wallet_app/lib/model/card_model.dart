import 'package:flutter/material.dart';

class CardModel {
  final Color color;
  final int balance;
  final String cardOwner;
  final String validity;

  CardModel({
    required this.color,
    required this.balance,
    required this.cardOwner,
    required this.validity,
  });
}
