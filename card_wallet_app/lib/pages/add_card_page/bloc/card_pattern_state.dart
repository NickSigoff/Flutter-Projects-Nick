part of 'card_pattern_bloc.dart';

@immutable
abstract class CardPatternState {}

class CardPatternInitial extends CardPatternState {
  final CardModel cardModel;

  CardPatternInitial({required this.cardModel});
}

class CardPatternDefined extends CardPatternState {
  final CardModel cardModel;

  CardPatternDefined({required this.cardModel});
}
