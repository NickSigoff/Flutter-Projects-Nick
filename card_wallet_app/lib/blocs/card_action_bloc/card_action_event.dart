part of 'card_action_bloc.dart';

@immutable
abstract class CardActionEvent {}

class AddCardEvent extends CardActionEvent {
  final CardModel cardModel;

  AddCardEvent({required this.cardModel});
}

class RemoveCardEvent extends CardActionEvent {
  final CardModel cardModel;

  RemoveCardEvent({required this.cardModel});
}
