part of 'last_message_cubit.dart';

@immutable
abstract class LastMessageState {}

class LastMessageInitial extends LastMessageState {}

class LastMessageLoading extends LastMessageState {}

class LastMessageLoaded extends LastMessageState {}

class LastMessageEmpty extends LastMessageState {}
