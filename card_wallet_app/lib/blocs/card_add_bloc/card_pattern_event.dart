part of '../../../blocs/card_add_bloc/card_pattern_bloc.dart';

@immutable
abstract class CardPatternEvent {}

class ChangeColorEvent extends CardPatternEvent {
  final Color cardColor;

  ChangeColorEvent({required this.cardColor});
}

class ChangeCardTypeEvent extends CardPatternEvent {
  final CardType cardType;

  ChangeCardTypeEvent({required this.cardType});
}

class ChangeCardNumberEvent extends CardPatternEvent {
  final String cardNumber;

  ChangeCardNumberEvent({required this.cardNumber});
}

class ChangeNameEvent extends CardPatternEvent {
  final String ownerCardName;

  ChangeNameEvent({required this.ownerCardName});
}

class ChangeValidityDateEvent extends CardPatternEvent {
  final String validity;

  ChangeValidityDateEvent({required this.validity});
}

class ChangeCssCodeEvent extends CardPatternEvent {
  final String cssCode;

  ChangeCssCodeEvent({required this.cssCode});
}
