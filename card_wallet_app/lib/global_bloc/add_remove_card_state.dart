part of 'add_remove_card_bloc.dart';

@immutable
abstract class AddRemoveCardState {}

class AddRemoveCardInitial extends AddRemoveCardState {}

class AddRemoveCardSuccess extends AddRemoveCardState {}

class AddRemoveCardError extends AddRemoveCardState {}
