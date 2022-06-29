part of 'add_remove_card_bloc.dart';

@immutable
abstract class AddRemoveCardEvent {}

class AddCardToList extends AddRemoveCardEvent {
  final CardModel cardModel;

  AddCardToList({required this.cardModel});
}

class RemoveCardFromList extends AddRemoveCardEvent {
  final CardModel cardModel;

  RemoveCardFromList({required this.cardModel});
}
