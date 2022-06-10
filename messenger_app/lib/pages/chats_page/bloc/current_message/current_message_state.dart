part of 'current_message_cubit.dart';

@immutable
abstract class CurrentMessageState {}

class CurrentMessageLoading extends CurrentMessageState {}

class CurrentMessageLoaded extends CurrentMessageState {
  final String messageContent;
  final String messageTime;
  final int index;

  CurrentMessageLoaded({
    required this.messageContent,
    required this.messageTime,
    required this.index,
  }) {print('state $messageContent $messageTime');}
}

class CurrentMessageEmpty extends CurrentMessageState {}

class CurrentMessageError extends CurrentMessageState {}
