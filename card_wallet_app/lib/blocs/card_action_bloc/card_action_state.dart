part of 'card_action_bloc.dart';

@immutable
abstract class CardActionState {}

class CardActionInitial extends CardActionState {}

class CardAddSuccess extends CardActionState {}

class CardRemoveSuccess extends CardActionState {}

class CardAddError extends CardActionState {}

class CardRemoveError extends CardActionState {}
