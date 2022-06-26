part of 'add_remove_card_bloc.dart';

@immutable
abstract class AddRemoveCardEvent {}

class AddCardToList extends AddRemoveCardEvent {
  final CardModel card;

  AddCardToList({required this.card});
}

class RemoveCardFromList extends AddRemoveCardEvent {
  final CardModel card;

  RemoveCardFromList({required this.card});
}
